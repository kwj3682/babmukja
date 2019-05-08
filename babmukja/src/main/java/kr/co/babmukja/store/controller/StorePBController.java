package kr.co.babmukja.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.mlec.babmukja.store.service.StorePBService;

@Controller("kr.co.babmukja.store.controller.StorePBController")
@RequestMapping("/store")
public class StorePBController {

	private StorePBService service;
	
	@RequestMapping("/detailpb.do")
	public void detailpb() {}
	
	@RequestMapping("/insertformpb.do")
	public void insertformpb() {
		
	}
}
