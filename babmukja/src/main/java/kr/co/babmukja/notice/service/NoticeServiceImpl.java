package kr.co.babmukja.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.mapper.NoticeMapper;

@Service("kr.co.babmukja.notice.service.NoticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	public NoticeMapper mapper;
	
	public List<Comment> commentList(int notice_no) {
		return mapper.selectCommentByNo(notice_no);
	}
	
	public List<Notice> selectNoticeList(){
		return mapper.selectNoticeList();
	}
	
	public void update(Notice notice){
         mapper.updateNotice(notice);
    }
	public Notice updateForm(int notice_no) {
		return mapper.selectNotice(notice_no);	
	}
	public void write(Notice notice){
        mapper.insertNotice(notice);
    }
	public void delete(int notice_no){
        mapper.deleteNotice(notice_no);
    }
	public List<Notice> detail(Page notice_no) {
		return null;
	}
	public Map<String, Object> list(Page page) {
		Map<String, Object> result = new HashMap<>();
		result.put("pageResult", new PageResult(
				page.getPageNo(), mapper.selectNoticeCount()
		));
		return result;
	}

	@Override
	public void insertNotice(Notice notice) {	
	}

	@Override
	public void selectNotice(Page page) {
		// TODO Auto-generated method stub		
	}

	@Override
	public int selectNoticeCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateNotice(Notice notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void detail(int notice_no) {
		// TODO Auto-generated method stub
		
	}

}
