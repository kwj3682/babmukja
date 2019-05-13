package kr.co.babmukja.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.notice.service.NoticeService;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

@Controller("kr.co.babmukja.notice.controller.NoticeController")
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/delete.do")
	public String delete(int notice_no) {
		service.deleteNotice(notice_no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}	
	
	@RequestMapping("/detail.do")
	public void detail(){}
	
	@RequestMapping("/index.do")
	public void index() {}
	
	@RequestMapping("/list.do")
	public void list(Page page, Model model) {
		model.addAttribute("list");
		model.addAttribute("pageResult");
		
	}
	@RequestMapping("/comment.do")
	public void comment() {}
	
	@RequestMapping("/enrollform.do")
	public void enrollform() {}

	@RequestMapping("/updateform.do")
	public void updateform() {	
	}
	@RequestMapping("/update.do")
	public String update(Notice notice) {
		service.updateNotice(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	@RequestMapping("/enroll.do")
	@PostMapping
	public String enroll(Notice notice) {
		System.out.println("컨텐츠 가져오기 :" + notice.getContent());
		service.insertNotice(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
}
