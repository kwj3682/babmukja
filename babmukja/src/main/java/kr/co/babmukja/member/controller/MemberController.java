package kr.co.babmukja.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("/loginform.do")
	public void loginForm() {}

	@RequestMapping("/login.do")
	public String login(Member member,HttpSession session){
		
		Member mem = service.selectLogin(member);
		
		// session에 올리기 없으면 안올리기, 세션도 받기 
		if (mem == null) {
			System.out.println("실패");
			return "redirect:loginform.do?fail=1&memId=1"; 
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
	
	@RequestMapping("/checkid.do")
	@ResponseBody
	public Map<Object, Object> idCheck(String memId) {
		System.out.println("ajax 들어옴");
		
		 int count = 0;
	     Map<Object, Object> map = new HashMap<Object, Object>();
	 
	     System.out.println(memId);
	     
	     count = service.selectCheckId(memId);
	     System.out.println(count);
	     map.put("cnt", count);
	     return map;
	}
		
	
}
