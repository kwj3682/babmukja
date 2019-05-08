package kr.co.babmukja.meetup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller("kr.co.babmukja.meetup.controller.MeetupController")
@RequestMapping("/meetup")
public class MeetupController {

	@RequestMapping("/detail.do")
	public void meetupDetail(){}
	


	@RequestMapping("/detailIntro.do")
	@ResponseBody
	public String detailIntro(String data){
		System.out.println("들어왔음");
	System.out.println(data);
		return data;
	}
	
}
