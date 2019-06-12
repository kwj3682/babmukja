package kr.co.babmukja.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.mapper.CommentMapper;

@Service("kr.co.babmukja.notice.service.CommentService")
public class CommentServiceImpl implements CommentService {
	    @Autowired   
	    public CommentMapper mapper;
	    
 public int commentInsert(Comment comment) {
		    return mapper.commentInsert(comment);		
	    }
	
	public List<Comment> commentList(int noticeNo) {
		return mapper.commentList(noticeNo);
	}
	
	public int commentUpdate(Comment comment){
        return mapper.commentUpdate(comment);
    }
    
    public int commentDelete(int noticeCommentNo){
        return mapper.commentDelete(noticeCommentNo);
    }
    
    public Comment commentSelectByNo(int noticeCommentNo) {
    	return mapper.commentSelectByNo(noticeCommentNo);
    }

}
//
//	
//	
//
//
//	
