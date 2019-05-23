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
	
	public List<Comment> commentList(int no) {
		return mapper.selectCommentByNo(no);
	}
	
	public void write(Notice notice){
        mapper.insertNotice(notice);
    }
	
	public Notice updateForm(int no) {
		return mapper.selectNoticeByNo(no);	
	}
	
	public void update(Notice notice){
         mapper.updateNotice(notice);
    }
	
	public void delete(int no){
        mapper.deleteNotice(no);
    }
	
	public Notice detail(int no) {
		return mapper.selectNoticeByNo(no);
	}
//	public Map<String, Object> list(Page page) {
//		Map<String, Object> result = new HashMap<>();
//		result.put("list", mapper.selectNotice(page));
//		result.put("pageResult", new PageResult(
//				page.getPageNo(), mapper.selectNoticeCount()
//		));
//		return result;
//	}
	public List<Notice> selectNoticeList(){
		return mapper.selectNoticeList();
	}

	@Override
	public int selectNoticeCount() {
		return 0;
	}

	public static void addComment(Notice notice) {
		// TODO Auto-generated method stub
		
	}

	public static List<Notice> selectNoticeCommentByNo(Notice notice) {
		// TODO Auto-generated method stub
		return null;
	}

}
