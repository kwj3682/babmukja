package kr.co.babmukja.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.babmukja.notice.service.CommentService;
import kr.co.babmukja.repository.domain.Comment;

@Controller("kr.co.babmukja.notice.controller.CommentController")
@RequestMapping("/notice")
public class CommentController {
	    @Autowired
	    private CommentService mCommentService;
	    
	    
	    @RequestMapping("/comment-list.do") //댓글 리스트
	    @ResponseBody
	    private List<Comment> mCommentServiceList(Model model) throws Exception{
	        return mCommentService.commentListService();
	    }
	    
	    @RequestMapping("/comment-insert.do") //댓글 작성 
	    @ResponseBody
	    private int mCommentServiceInsert(@RequestParam int noticeNo, @RequestParam String content) throws Exception {
	        
	        Comment comment = new Comment();
	        comment.setNoticeNo(noticeNo);
	        comment.setContent(content);
	        System.out.println(noticeNo);
	        System.out.println(content);
	        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용 
	        return mCommentService.commentInsertService(comment);
	         
	    }
	    
	    @RequestMapping("/comment-update.do") //댓글 수정  
	    @ResponseBody
	    private int mCommentServiceUpdateProc(@RequestParam int commentNo, @RequestParam String content) throws Exception { 
	        Comment comment = new Comment();
	        comment.setCommentNo(commentNo);
	        comment.setContent(content);
	        return mCommentService.commentUpdateService(comment);
	    }
	    
	    @RequestMapping("/comment-delete.do/{commentNo}") //댓글 삭제  
	    @ResponseBody
	    private int mCommentServiceDelete(@PathVariable int commentNo) throws Exception{
	        return mCommentService.commentDeleteService(commentNo);
	    }
	    
	}
	 
	



	

