package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Notice;

public interface NoticeMapper {
	List<Notice> selectNotice();
	void insertNotice(Notice notice); 
	void updateNotice(Notice notice); 
	void deleteNotice(int no); 
}
