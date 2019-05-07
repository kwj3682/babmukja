package kr.co.babmukja.meetup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.babmukja.meetup.controller.MeetupController")
@RequestMapping("/meetup")
public class MeetupController {

	@RequestMapping("/detail.do")
	public void meetupDetail(){}
	
}
