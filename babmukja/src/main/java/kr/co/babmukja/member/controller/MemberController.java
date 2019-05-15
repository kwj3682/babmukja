package kr.co.babmukja.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.member.service.MemberService;
import kr.co.babmukja.repository.domain.Member;

@Controller("kr.co.babmukja.member.controller.MemberController")
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder; // 암호화
	
	// 로그인 폼
	@RequestMapping("/loginform.do")
	public void loginForm() {
		
	}

	// 로그인 처리
	@RequestMapping("/login.do")
	public String login(Member member,HttpSession session){
		String pass = passEncoder.encode(member.getMemPass());
		Member mem = service.selectLogin(member);
		
		boolean passMatch = passEncoder.matches(member.getMemPass(), mem.getMemPass());
		
		if(mem != null && passMatch) {
			session.setAttribute("user", mem);
			System.out.println("성공");
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do?complete=1";
		} else {
			System.out.println("실패");
			return "redirect:loginform.do?fail=1"; 
			// complete라는 변수를 만들어서 성공했을 때 1을 넘겨주고 화면에 alert창이 보여지지 않게
			// 1이 넘어오지 않았을 때는 실패 했으니까 화면에 alert창을 보여주게
		}
	}
	
	// 로그아웃 처리
	@RequestMapping("/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do";
	}
	
	// 우편번호 폼
	@RequestMapping("/jusopopup.do")
	public void jusoPopUp() {
		System.out.println("우편번호 검색 버튼");
	}
	
	// 회원가입 폼
	@RequestMapping("/signupform.do")
	public void signUpForm() {}
	
	// 회원가입 처리
	@RequestMapping("/signup.do")
	public String signUp(Member member) {
		System.out.println("회원가입 버튼");
		
		// 암호화
		String inputPass = member.getMemPass();
		String pass = passEncoder.encode(inputPass);
		member.setMemPass(pass);
		
		service.insertMember(member); 
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do";
	}
	
	// 닉네임 중복체크
	@RequestMapping("/checknickname.do")
	@ResponseBody
	public int checkNickName(String memNickname) {
		System.out.println("ajax 들어옴");
		System.out.println(memNickname);
		return service.selectCheckNickName(memNickname);
	}
	
	// 닉네임 중복체크
	@RequestMapping("/checkemail.do")
	@ResponseBody
	public int checkEmail(String memEmail) {
		System.out.println("ajax 들어옴");
		System.out.println(memEmail);
		return service.selectCheckEmail(memEmail);
	}
}
