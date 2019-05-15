package kr.co.babmukja.meetup.controller;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;



import kr.co.babmukja.meetup.service.MeetupService;



@Controller("kr.co.babmukja.meetup.controller.MeetupController")

@RequestMapping("/meetup")
public class MeetupController {

	@Autowired
	private MeetupService service;
	
	@RequestMapping("/detail.do")
	public void meetupDetail(Model model){
//		service.selectIntro();
		model.addAttribute("intro",service.selectIntro());
		
	}
	@RequestMapping("/saveFile.do")
	@ResponseBody
	public void saveFile(String data1, MultipartFile data){
//		service.selectIntro();
		System.out.println("data 들어왔음" +data);
		System.out.println("data1 들어왔음 :" +data1);
	//	System.out.println("파일이름: " +data.getOriginalFilename());
	//	System.out.println("파일크기: " +data.getSize());
		
		
			
				
		
	
	}
	
	@RequestMapping("/main.do")
	public void meetupMain(){
		System.out.println("main 들어왔음.");
		
	}
	
	@RequestMapping("/meetupAddress.do")
	public void meetupAddress(){
		System.out.println("주소 들어왔음.");
		
	}
	
	
	@RequestMapping("/updateIntro.do")
	@ResponseBody
	public String updateIntro(){
		System.out.println("들어왔음");

		//service.updateIntro(data);
		return null;
		//return data;
	}
	

	  @RequestMapping("/editIntro.do") 
	  @ResponseBody public String editIntro(){
	  System.out.println("수정 데이터 처리요청");
	 String data = service.selectIntro();
	 return data;
	  }
	 
	
	@RequestMapping("/deleteIntro.do")
	@ResponseBody
	public void deleteIntro(){
		System.out.println(" delete들어왔음");
	
		service.deleteIntro();
	
	}
	
}
