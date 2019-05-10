package kr.co.babmukja.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.notice.service.NoticeService;
import kr.co.babmukja.repository.domain.Notice;

@Controller("kr.co.babmukja.notice.controller.NoticeController")
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/detail.do")
	public void detail() {}
	
	@RequestMapping("/index.do")
	public void index() {}
	
	@RequestMapping("/list.do")
	public void list(Notice notice, Model model) {
	//	List<Notice> result = service.list(notice);
		ModelAndView mav = new ModelAndView("notice/list");
		//
		model.addAttribute("list");
		model.addAttribute("noticeResult");
  	    return;
	}
	
	@RequestMapping("/comment.do")
	public void comment() {}
	
	@RequestMapping("/enrollform.do")
	public void enrollform() {}

	@RequestMapping("/enroll.do")
	public String enroll(Notice notice) {
		System.out.println("컨텐츠 가져오기 :" + notice.getContent());
		service.insertNotice(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
}
