package kr.co.babmukja.repository.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

public interface NoticeMapper {
	
	List<Comment> selectCommentByNo(int notice_no);

	void updateNotice(Notice notice);

	Notice selectNotice(int notice_no);

	void insertNotice(Notice notice);

	void deleteNotice(int notice_no);

	List<Notice> selectNoticeList();

	int selectNoticeCount();
	
}
