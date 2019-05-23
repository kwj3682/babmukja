package kr.co.babmukja.meetup.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.meetup.service.MeetupService;
import kr.co.babmukja.repository.domain.MeetupFile;

//파일을 동적으로 받아주기 위해서 File 객체 만들

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

	@RequestMapping("/uploadImage.do")
	@ResponseBody
	public MeetupFile uploadImage(MultipartFile file) {
		System.out.println("들어왔음");
		System.out.println("file 들어왔나 확인" + file);
		// service.updateIntro(data);
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/meetup/" + sdf.format(new Date());
		String orgFileName = file.getOriginalFilename();
		String sysFileName = uuid.toString() + orgFileName;
		String filePath = uploadRoot + path;
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		MeetupFile mFile = new MeetupFile();
		mFile.setOrgFileName(orgFileName);
		mFile.setSysFileName(sysFileName);
		mFile.setFilePath(filePath);
		File f = new File(filePath + sysFileName);
		if (f.exists() == false) {
			f.mkdirs();
		}

		try {
			System.out.println("이동 잘되나 확인");
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("실패");
		}

		return mFile;

	}

	@RequestMapping("download.do")
	public void download(String path, HttpServletResponse response) throws IOException {

		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);

		while (true) {
			int ch = bis.read();
			if (ch == -1) {
				break;
			}
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}

	@RequestMapping("/updateIntro.do")
	@ResponseBody
	public String updateIntro(String[] fileDirectory, String[] deleteDirectory, String dbPath) {
		System.out.println("세이브 후 들어왔음");
		if (deleteDirectory != null) {
		System.out.println("파일 들어왔나 확인 :" + fileDirectory[0]);
		}
		System.out.println("dbpath 들어왔나 확인 :" + dbPath);
		service.updateIntro(dbPath);
		if (deleteDirectory != null) {
			System.out.println("지울 파일 들어오나 확인 :" + deleteDirectory[0]);

			for (int i = 0; i < fileDirectory.length; i++) {

				System.out.println("----------------");
				System.out.println(fileDirectory[i]);

			}

			for (int i = 0; i < deleteDirectory.length; i++) {

				System.out.println("----------------");
				System.out.println(deleteDirectory[i]);

				File file = new File(deleteDirectory[i]);

				if (file.exists()) {
					if (file.delete()) {
						System.out.println("파일삭제 성공");
					}
				}
			} // delete for

		}

		return dbPath;

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
	public void deleteIntro(String[] fileDirectory) {
		System.out.println(" delete들어왔음");
		if(fileDirectory !=null) {
		for (int i = 0; i < fileDirectory.length; i++) {
			System.out.println(fileDirectory[i]);
			File file = new File(fileDirectory[i]);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일삭제 성공");
				}
			}
			

		}//for
		}//if
		service.deleteIntro();
	}

}
