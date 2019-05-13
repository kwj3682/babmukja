package kr.co.babmukja.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.mapper.NoticeMapper;

@Service("kr.co.babmukja.notice.service.NoticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	public NoticeMapper mapper;

	public List<Comment> commentList(int notice_no) {
		return mapper.selectCommentByNo(notice_no);
	}
	public List<Notice> selectNotice(){
		return mapper.selectNotice();
	}
	public void updateNotice(Notice notice){
        mapper.updateNotice(notice);
    }
	public Notice updateForm(int notice_no) {
		return mapper.selectNoticeByNo(notice_no);	
	}
	public void insertNotice(Notice notice){
        mapper.insertNotice(notice);
    }
	public void deleteNotice(int notice_no){
        mapper.deleteNotice(notice_no);
    }
	public Notice detailNotice(int notice_no) {
		return mapper.selectNoticeByNo(notice_no);
		
	}
	
	
}