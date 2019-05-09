package kr.co.babmukja.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.member.service.MemberService;
import kr.co.babmukja.repository.domain.Member;

@Controller("kr.co.babmukja.member.controller.MemberController")
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/loginform.do")
	public void loginForm() {}

	@RequestMapping("/login.do")
	public String login(HttpSession session){
		Member member = new Member();
		member.setMemId("bitchanmom9");
		member.setMemPass("bitbit");
		
//		Member mem = service.selectLogin(member);
		
		// session에 올리기 없으면 안올리기, 세션도 받기 
		// 페이지 이동
//		if (member == null) {
//			return "redirect:loginform.do";
//		} else {
			session.setAttribute("user", member);
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/recipe/main.do";
//		}
	}
	
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		
		return "/admin/main.do";
	}
}
