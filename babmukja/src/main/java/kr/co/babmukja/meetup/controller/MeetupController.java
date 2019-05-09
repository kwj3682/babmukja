package kr.co.babmukja.meetup.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public void meetupDetail(){
		service.selectIntro();
		
	}
	


	@RequestMapping("/detailIntro.do")
	@ResponseBody
	public String detailIntro(String data){
		System.out.println("들어왔음");
	System.out.println(data);
		service.updateIntro(data);
		return data;
	}
	
}
