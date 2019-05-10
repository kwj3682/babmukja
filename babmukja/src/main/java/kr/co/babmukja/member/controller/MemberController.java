package kr.co.babmukja.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		
//		System.out.println(mem.getMemId());
//		System.out.println(mem.getMemPass()); // 주석처리 안해주면 잘못된 아이디나 비밀번호를 입력할 때 에러가 발생
		
		// session에 올리기 없으면 안올리기, 세션도 받기 
		// 페이지 이동
		
		if (mem == null) {
			System.out.println("실패");
			return "redirect:loginform.do?fail=1"; 
			// complete라는 변수를 만들어서 성공했을 때 1을 넘겨주고 화면에 alert창이 보여지지 않게
			// 1이 넘어오지 않았을 때는 실패 했으니까 화면에 alert창을 보여주게
		} 
		System.out.println("성공");
		session.setAttribute("user", mem);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do?complete=1";
	}
	
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do";
	}
	
	@RequestMapping("/jusopopup.do")
	public void jusoPopUp() {
		System.out.println("우편번호 검색 버튼");
	}
	
	@RequestMapping("/signupform.do")
	public void signUpForm(Model model) {
		// 힌트 번호를 가져가야한다
		model.addAttribute("hintlist", service.selectHintContent());
	}
	
	@RequestMapping("/signup.do")
	public String signUp(Member member) {
		System.out.println("회원가입 버튼");
//		member.setHintNo(hintNo);
		
		service.insertMember(member);
		
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do";
	}
}
