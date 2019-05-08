package kr.co.babmukja.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.co.babmukja.notice.service.NoticeService;
import kr.co.babmukja.repository.domain.Notice;

@Controller("kr.co.babmukja.notice.controller.NoticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	public void tranTest() throws Exception {
		System.out.println("트랜잭션 테스트");
		Notice notice = new Notice();
		notice.setTitle("h");
	    notice.setContent("a");
		notice.setWriter("m");
	//	notice.updateNotice(notice);
	}

	public void retrieveNotice() throws Exception {
		List<Notice> list = service.retrieveNotice();
		System.out.println("게시물 정보 출력");
		System.out.println("-------------------");
		for (Notice notice : list) {
			System.out.println(
					notice.getNo() + "\t" + notice.getTitle() + "\t" + notice.getWriter() + "\t" + notice.getRegdate() );
		}
	}
}


