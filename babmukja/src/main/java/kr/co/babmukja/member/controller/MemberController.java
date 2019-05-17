package kr.co.babmukja.member.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.member.service.MemberService;
import kr.co.babmukja.repository.domain.MailHandler;
import kr.co.babmukja.repository.domain.Member;

@Controller("kr.co.babmukja.member.controller.MemberController")
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private BCryptPasswordEncoder passEncoder; // 암호화
	
	@Autowired
	private JavaMailSender mailSender; // 이메일 인증
	
	// 로그인 폼
	@RequestMapping("/loginform.do")
	public void loginForm() {}

	// 로그인 처리
	@RequestMapping("/login.do")
	public String login(Member member,HttpSession session){ 
		String pass = passEncoder.encode(member.getMemPass());
		Member mem = service.selectLogin(member);
		
		boolean passMatch = passEncoder.matches(member.getMemPass(), mem.getMemPass());
		
		if(mem != null && passMatch) {
			if(mem.getVerify() == 0) {
				System.out.println("회원 이메일 인증안함");
				return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/loginform.do?email=0";
			} else {
				System.out.println("이메일 인증 함");
				session.setAttribute("user", mem);
			}
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do";
		} else {
			System.out.println("실패");
			return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/loginform.do?fail=1";
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
	
	// 이메일 인증 폼
	@RequestMapping("/emailform.do")
	public void emailForm() {}
	
	// 이메일 인증확인 폼
	@RequestMapping("/emailcheck.do")
	public void emailCheck() {
		
	}
	// 회원가입 처리
	@RequestMapping("/signup.do")
	public String signUp(Member member) throws UnsupportedEncodingException, MessagingException {
		System.out.println("회원가입 버튼");
		
		// 암호화
		String inputPass = member.getMemPass();
		String pass = passEncoder.encode(inputPass);
		member.setMemPass(pass);
		
		System.out.println("이메일 발송");
		service.insertMember(member);
		
		// 이메일 인증
		MailHandler sendMail = new MailHandler(mailSender);
		StringBuffer sb = new StringBuffer();
		sendMail.setSubject("[밥먹자 이메일 인증]");
		sendMail.setText(sb.append("<h2>밥먹자 메일인증 입니다!♬ 아래 링크를 눌러서 이메일 인증을 해주세요!</h2>")
						 .append("<a href='http://localhost/babmukja/member/confirm.do?MemEmail="+member.getMemEmail())
						 .append(" 'target='_blank'>밥먹자 이메일 인증하기</a>").toString());
		sendMail.setFrom("babmukja@babmukja.com", "밥먹자");
		sendMail.setTo(member.getMemEmail());
		sendMail.send();
		System.out.println(sb.toString());
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/emailform.do";
	}

	@RequestMapping("/confirm.do")
	public String mSuccess(Member member) {
		member.setMemEmail(member.getMemEmail());
		System.out.println("가입한 회원 이메일: " + member.getMemEmail());
		service.updateEmailVerify(member.getMemEmail());
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/member/emailcheck.do";
	}
	
	// 닉네임 중복체크
	@RequestMapping("/checknickname.do")
	@ResponseBody
	public int checkNickName(String memNickname) {
		System.out.println(memNickname);
		return service.selectCheckNickName(memNickname);
	}
	
	// 닉네임 중복체크
	@RequestMapping("/checkemail.do")
	@ResponseBody
	public int checkEmail(String memEmail) {
		System.out.println(memEmail);
		return service.selectCheckEmail(memEmail);
	}
}
