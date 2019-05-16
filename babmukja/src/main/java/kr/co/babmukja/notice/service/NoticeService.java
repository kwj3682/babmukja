package kr.co.babmukja.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

public interface NoticeService {
    void updateNotice(Notice notice);
	public Notice updateForm(int notice_no);
	public void update(Notice notice);
	public void delete(int notice_no);
	public void detail(int notice_no);
	public void insertNotice(Notice notice);
	public void selectNotice(Page page);
	public int selectNoticeCount();
	public List<Notice> selectNoticeList();
	
	
}
