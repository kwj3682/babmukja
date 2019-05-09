package kr.co.babmukja.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.babmukja.store.service.StorePBService;

@Controller("kr.co.babmukja.store.controller.StorePBController")
@RequestMapping("/store")
public class StorePBController {
	
	@Autowired
	private StorePBService service;
	
	@RequestMapping("/detailpb.do")
	public void detailpb() {}
	
	@RequestMapping("/insertformpb.do")
	public void insertformpb() {}
	
	@RequestMapping("/mainpb.do")
	public void selectPBList(Model model) {
		model.addAttribute("pbList", service.selectPBList()); 
	}
	
	
}
