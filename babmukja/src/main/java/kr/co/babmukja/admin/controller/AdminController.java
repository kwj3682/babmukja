package kr.co.babmukja.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.babmukja.admin.controller.AdminController")
@RequestMapping("/admin")
public class AdminController {
	
	
//	@Autowired
//	private AdminService service;
	
	@RequestMapping("/main.do")
	public void main(){}
	
	public void test() {
		
	}
	public void test2() {
		System.out.println("hi");
	}
}
