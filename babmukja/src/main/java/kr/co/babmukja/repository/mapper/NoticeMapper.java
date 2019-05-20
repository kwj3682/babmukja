package kr.co.babmukja.repository.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

public interface NoticeMapper {
//	public List<Notice> selectNotice(Page page);
	List<Notice> selectNoticeList();
	public int selectNoticeCount();
	void insertNotice(Notice notice);
	Notice selectNoticeByNo(int no);
	int deleteNotice(int no);
    int updateNotice(Notice notice);
    List<Comment> selectCommentByNo(int no);
	
}
