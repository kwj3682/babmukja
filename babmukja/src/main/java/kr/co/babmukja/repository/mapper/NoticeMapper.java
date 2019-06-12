package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Notice;

public interface NoticeMapper {
//	public List<Notice> selectNotice(Page page);
	List<Notice> selectNoticeList();
	public int selectNoticeCount();
	void insertNotice(Notice notice);
	Notice selectNoticeByNo(int no);
	int deleteNotice(int no);
    int updateNotice(Notice notice); 
//    List<Comment> selectCommentByNo();
//    public int commentUpdate(Comment comment);
//    public int commentDelete(int noticeCommentNo);
    public void insertNoticeImage(FileVO fileVO);
	public int selectMaxNum();
//	int commentInsert(Comment comment);
//	List<Comment> commentList();
//	public int commentCount();
	public void updateViewCnt(int noticeNo);
	
}
