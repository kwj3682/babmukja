package kr.co.babmukja.member.controller;

import javax.servlet.http.HttpServletRequest;
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
	public String login(Member member,HttpSession session){
		
		Member mem = service.selectLogin(member);
		
		System.out.println(mem.getMemId());
		System.out.println(mem.getMemPass());
		// session에 올리기 없으면 안올리기, 세션도 받기 
		// 페이지 이동
		if (mem == null) {
			System.out.println("실패");
			return "redirect:loginform.do";
		} 
		System.out.println("성공");
		session.setAttribute("user", mem);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do";
	}
	
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		
		return "/admin/main.do";
	}
}
