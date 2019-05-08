package kr.co.babmukja.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.babmukja.admin.service.AdminService;
import kr.co.babmukja.repository.domain.Member;

@Controller("kr.co.babmukja.admin.controller.AdminController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/main.do")
	public void main(){}
	
	
	@RequestMapping("/member.do")
	public void memberTab() {}
	
	
	@RequestMapping("/membersearch.do")
	public ResponseEntity<String> list(){
		List<Member> list = service.listMember();
		if(list == null) {
			return new ResponseEntity<String>("회원 테이블을 가져오는데 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);			
		}
		return new ResponseEntity<String> ("검색 결과 : 총"+list.size()+"명의 회원 정보를 검색했습니다.",HttpStatus.OK);
	}
}
