package kr.co.babmukja.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Notice;

@Service("kr.co.babmukja.notice.service.NoticeService")
public interface NoticeService {
	public List<Notice> selectNotice();
	public void updateNotice(Notice notice);
	public void insertNotice(Notice notice);
	public void deleteNotice(int notice_no);
	
}
