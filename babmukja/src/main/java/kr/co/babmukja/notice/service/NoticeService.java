package kr.co.babmukja.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

@Service("kr.co.babmukja.notice.service.NoticeService")
public interface NoticeService {
	public List<Comment> commentList(int notice_no);
	public List<Notice> selectNotice();
	public void updateNotice(Notice notice);
	public Notice updateForm(int notice_no);
	public void insertNotice(Notice notice);
	public void deleteNotice(int notice_no);
	
}
