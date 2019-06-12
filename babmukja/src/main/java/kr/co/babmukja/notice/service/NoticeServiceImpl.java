package kr.co.babmukja.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.mapper.NoticeMapper;

@Service("kr.co.babmukja.notice.service.NoticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	public NoticeMapper mapper;
	
//	 public int commentInsert(Comment comment) {
//		    return mapper.commentInsert(comment);		
//	    }
//	
//	public List<Comment> commentList() {
//		return mapper.commentList();
//	}
//	
//	public int commentUpdate(Comment comment){
//        return mapper.commentUpdate(comment);
//    }
//    
//    public int commentDelete(int noticeCommentNo){
//        return mapper.commentDelete(noticeCommentNo);
//    }
		
	public void write(Notice notice){
        mapper.insertNotice(notice);
    }
	public void insertNoticeImage(FileVO fileVO) {
		mapper.insertNoticeImage(fileVO);
	}
	
	public int getMax() {
		return mapper.selectMaxNum();
	}
	
	public Notice updateForm(int no) {
		return mapper.selectNoticeByNo(no);	
	}
	
	public void update(Notice notice){
         mapper.updateNotice(notice);
    }
	
	@Transactional
	@Override
	public void updateViewCnt(int noticeNo) {
		mapper.updateViewCnt(noticeNo);
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

	

}
