package kr.co.babmukja.notice.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

public interface NoticeService {
    public void write(Notice notice);
    public void insertNoticeImage(FileVO fileVO);
	public int getMax();
	public Notice updateForm(int no);
	public void update(Notice notice);
	public void delete(int no);
	public Notice detail(int no);
	public List<Notice> selectNoticeList();
//	public Map<String, Object> list(Page page);
//	public int commentInsert(Comment comment);
//	public List<Comment> commentList();
//	public int commentUpdate(Comment comment);
//	public int commentDelete(int noticeCommentNo);
	public void updateViewCnt(int noticeNo);
	

	
	
}
