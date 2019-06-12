package kr.co.babmukja.comment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.babmukja.comment.service.CommentService;
import kr.co.babmukja.repository.domain.Comment;

@Controller("kr.co.babmukja.comment.controller.CommentController")
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private CommentService service;

	@RequestMapping("/comment-list.do")
	@ResponseBody
	public List<Comment> commentList(Comment comment, int noticeNo) {
		List<Comment> list = service.commentList(noticeNo);
		System.out.println("list :" + list.get(0));
		System.out.println("comment :" + comment);
		return list;
	}

	@RequestMapping("/comment-insert.do") // 댓글 작성
	@ResponseBody
	private int commentInsert(Comment comment) {
		System.out.println(comment.getContent());
		System.out.println(comment.getNoticeNo());
		// 로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용
		return service.commentInsert(comment);

	}

	@RequestMapping("/comment-update.do") // 댓글 수정
	@ResponseBody
	private int commentUpdate(int noticeCommentNo, String content){
		Comment comment = new Comment();
		comment.setNoticeCommentNo(noticeCommentNo);
		comment.setContent(content);
		return service.commentUpdate(comment);
	}

	/*
	 * @RequestMapping("/comment-update.do") // 댓글 수정
	 * 
	 * @ResponseBody private String commentUpdate(int noticeCommentNo, String
	 * content){ Comment comment = new Comment();
	 * comment.setNoticeCommentNo(noticeCommentNo); comment.setContent(content);
	 * service.commentUpdate(comment); return content; }
	 */
	
	@RequestMapping("/comment-delete.do") // 댓글 삭제
	@ResponseBody
	private int commentDelete(int noticeCommentNo){
		return service.commentDelete(noticeCommentNo);
	}

}
