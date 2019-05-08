package kr.co.babmukja.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.babmukja.member.service.MemberService;

@Controller("kr.co.babmukja.member.controller.MemberController")
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/login.do")
	public void login() {}
	
//	@RequestMapping("/login.do")
//	public String login(Member member, HttpSession session){
//		Member mem = service.selectLogin(member);
//		session.setAttribute("user", mem);
//		
//		// session에 올리기 없으면 안올리기, 세션도 받기 
//		// 페이지 이동
//		if (mem == null) {
//			return "redirect:/login.do";
//		} else {
//			return "/admin/main.do";
//		}
//	}
//	
//	public String logOut(HttpSession session) {
//		session.invalidate();
//		
//		return "/admin/main.do";
//	}
}
