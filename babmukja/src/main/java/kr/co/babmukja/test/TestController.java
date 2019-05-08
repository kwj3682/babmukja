package kr.co.babmukja.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@Autowired
	private TestService service;
	
	@RequestMapping("/select.do")
	public void selectOne() {
		String result = service.selectOne();
		System.out.println(result);
	}
	
}
