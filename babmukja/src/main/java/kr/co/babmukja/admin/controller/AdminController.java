package kr.co.babmukja.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.babmukja.admin.service.AdminService;

@Controller("kr.co.babmukja.admin.controller.AdminController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/main.do")
	public void main(){}
	
	@RequestMapping("/memberlist.do")
	public void list(){
		service.listMember();
	}
}
