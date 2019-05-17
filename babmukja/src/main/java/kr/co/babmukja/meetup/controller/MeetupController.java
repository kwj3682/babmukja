package kr.co.babmukja.meetup.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.meetup.service.MeetupService;
import kr.co.babmukja.repository.domain.MeetupFile;

@Controller("kr.co.babmukja.meetup.controller.MeetupController")

@RequestMapping("/meetup")
public class MeetupController {

	@Autowired
	private MeetupService service;

	@RequestMapping("/detail.do")
	public void meetupDetail(Model model) {
//		service.selectIntro();
		model.addAttribute("intro", service.selectIntro());

	}

	@RequestMapping("/main.do")
	public void meetupMain() {
		System.out.println("main 들어왔음.");

	}

	@RequestMapping("/meetupAddress.do")
	public void meetupAddress() {
		System.out.println("주소 들어왔음.");

	}

	/*
	 * @RequestMapping("/updateIntro.do")
	 * 
	 * @ResponseBody public void updateIntro(MultipartFile file) {
	 * System.out.println("들어왔음"); System.out.println("file 들어왔나 확인" + file );
	 * //service.updateIntro(data);
	 * 
	 * 
	 * 
	 * }
	 */
	
	@RequestMapping("/saveFile.do")
	@ResponseBody
	public MeetupFile saveFile(MultipartFile file) {
		System.out.println("들어왔음");
		System.out.println("file 들어왔나 확인" + file );
		//service.updateIntro(data);
	    UUID uuid = UUID.randomUUID();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	      String uploadRoot = "C:/bit2019/upload";
	      String path = "/meetup/" + sdf.format(new Date());
	      String orgFileName = file.getOriginalFilename();
	      String sysFileName = uuid.toString() + orgFileName;
	      String filePath = uploadRoot + path;
	      System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
	      MeetupFile mFile = new  MeetupFile();
	      mFile.setOrgFileName(orgFileName);
	      mFile.setSysFileName(sysFileName);
	      mFile.setFilePath(filePath);
	      
	      File f = new File(filePath + sysFileName);
	      
	      System.out.println("파일이름 :" + filePath + sysFileName);
	      
	       if(f.exists() == false) {
	         f.mkdirs();
	       }
	       
	       try {
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("실패");
		}
	      
	      return mFile;
	   }

	

	
	@RequestMapping("/editIntro.do")
	@ResponseBody
	public String editIntro() {
		System.out.println("수정 데이터 처리요청");
		String data = service.selectIntro();
		return data;
	}

	@RequestMapping("/deleteIntro.do")
	@ResponseBody
	public void deleteIntro() {
		System.out.println(" delete들어왔음");

		service.deleteIntro();

	}

}

