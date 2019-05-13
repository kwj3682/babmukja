package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;

public interface NoticeMapper {
	public List<Notice> selectNotice();
	public int selectNoticeCount();
	void insertNotice(Notice notice); 
	void updateNotice(Notice notice); 
	void deleteNotice(int no);
	public List<Comment> selectCommentByNo(int notice_no);
	public Notice selectNoticeByNo(int notice_no);
}
