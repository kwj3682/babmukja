package kr.co.babmukja.meetup.controller;

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
	

	
	
	
	@RequestMapping("/updateIntro.do")
	@ResponseBody
	public String updateIntro(String data){
		System.out.println("들어왔음");

		service.updateIntro(data);
		return data;
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
