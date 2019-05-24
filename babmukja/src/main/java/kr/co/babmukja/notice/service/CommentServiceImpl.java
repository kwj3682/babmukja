package kr.co.babmukja.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.mapper.CommentMapper;

@Service("kr.co.babmukja.notice.service.CommentService")
public class CommentServiceImpl implements CommentService {
	    @Autowired   
	    public CommentMapper mapper;
	    
	    public List<Comment> commentListService() throws Exception {
	        return mapper.commentList();
	    }
	    
	    public int commentInsertService(Comment comment) throws Exception{
		    return mapper.commentInsert(comment);
			
	    }
	    
	    public int commentUpdateService(Comment comment) throws Exception {
	        return mapper.commentUpdate(comment);
	    }
	    
	    public int commentDeleteService(int commentNo) throws Exception{
	        return mapper.commentDelete(commentNo);
	    }

}

	
	


	
