package kr.co.babmukja.meetup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("kr.co.babmukja.meetup.controller.MeetupController")
@RequestMapping("/meetup")
public class MeetupController {

	@RequestMapping("/detail.do")
	public void meetupDetail(){}
	


	@RequestMapping("/detailIntro.do")
	@ResponseBody
	public void detailIntro(){
		System.out.println("들어왔음");
	}
	
}
