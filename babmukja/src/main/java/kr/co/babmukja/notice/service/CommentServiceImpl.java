//package kr.co.babmukja.notice.service;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import kr.co.babmukja.repository.domain.Comment;
//import kr.co.babmukja.repository.mapper.CommentMapper;
//
//@Service("kr.co.babmukja.notice.service.CommentService")
//public class CommentServiceImpl implements CommentService {
//	    @Autowired   
//	    public CommentMapper mapper;
//	    
//	    public List<Comment> commentList() throws Exception {
//	        return mapper.commentList();
//	    }
//	    
//	    public int commentInsert(Comment comment) throws Exception{
//		    return mapper.commentInsert(comment);
//			
//	    }
//	    
//	    public int updateComment(Comment comment) throws Exception {
//	        return mapper.commentUpdate(comment);
//	    }
//	    
//	    public int commentDelete(int commentNo) throws Exception{
//	        return mapper.commentDelete(commentNo);
//	    }
//
//		@Override
//		public int commentUpdate(Comment comment) throws Exception {
//			// TODO Auto-generated method stub
//			return 0;
//		}
//
//	
//	}
//
//
//	
