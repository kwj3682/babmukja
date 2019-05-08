package kr.co.babmukja.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.babmukja.member.controller.SignUpController")
@RequestMapping("/member")
public class SignUpController {
	
	@RequestMapping("/signup.do")
	public void sign() {
		
	}

}
