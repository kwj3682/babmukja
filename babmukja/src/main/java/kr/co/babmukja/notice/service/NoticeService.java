package kr.co.babmukja.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

public interface NoticeService {
	public List<Comment> commentList(int no);
    public void write(Notice notice);
	public Notice updateForm(int no);
	public void update(Notice notice);
	public void delete(int no);
	public Notice detail(int no);
	public List<Notice> selectNoticeList();
	public int selectNoticeCount();
//	public Map<String, Object> list(Page page);

	
	
}
