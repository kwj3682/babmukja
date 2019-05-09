package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Notice;

public interface NoticeMapper {
	public interface noticeMapper {
	    List<Notice> selectNotice() throws Exception;
	    void insertNotice(Notice notice) throws Exception;
	    void updateNotice(Notice notice) throws Exception;
	    void deleteNotice(int no) throws Exception;
	}

	public void insertNotice(Notice notice);

	public List<Notice> selectNotice();   
}
