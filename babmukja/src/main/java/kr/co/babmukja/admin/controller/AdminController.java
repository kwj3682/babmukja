package kr.co.babmukja.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.babmukja.admin.service.AdminService;
import kr.co.babmukja.repository.domain.Page;

@Controller("kr.co.babmukja.admin.controller.AdminController")
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/main.do")
	public void main(){}
	
	@RequestMapping("/member.do")
	public void list(Page page, Model model) {	
		Map<String, Object> list = service.listMember(page);
		model.addAttribute("list", list.get("list"));
		model.addAttribute("pageResult", list.get("pageResult"));
		model.addAttribute("count", service.countMember());
	}
	


}
