package kr.co.babmukja.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.notice.service.NoticeService;
import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

@Controller("kr.co.babmukja.notice.controller.NoticeController")
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/delete.do")
	public String delete(int notice_no) {
		service.delete(notice_no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}	
	
	@RequestMapping("/detail.do")
	public void detail(Page notice_no, Model model){
		model.addAttribute("notice");
	}
	
	@RequestMapping("/index.do")
	public void index() {}
	
	@RequestMapping("/list.do")
	public void list(Page page, Model model) {
		int count = 0;
//		Map<String, Object> list = service.list(page);
//		model.addAttribute("list", service.retrieveNotice());
		model.addAttribute("list", service.selectNoticeList());
		model.addAttribute("count", count);
//		model.addAttribute("pageResult", list.get("pageResult"));
		
	}
//	@RequestMapping("/comment-list.json")
//	public List<Comment> commentList(int notice_no) {
//		return service.commentList(notice_no);
//	}
	
	@RequestMapping("/writeform.do")
	public void writeform() {}

	@RequestMapping("/updateform.do")
	public void updateform() {}
	
	@RequestMapping("/update.do")
	public String update(Notice notice) {
		service.update(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
	@RequestMapping("/write.do")
	public String write(Notice notice) {
		service.insertNotice(notice);
		System.out.println("컨텐츠 가져오기 :" + notice.getContent());
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}
}
