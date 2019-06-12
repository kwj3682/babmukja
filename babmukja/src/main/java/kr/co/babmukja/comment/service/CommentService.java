package kr.co.babmukja.comment.service;

import java.util.List;

import kr.co.babmukja.repository.domain.Comment;

public interface CommentService {
public int commentInsert(Comment comment);
	public List<Comment> commentList(int noticeNo);
	public int commentUpdate(Comment comment);
	public int commentDelete(int noticeCommentNo);
	public Comment commentSelectByNo(int noticeCommentNo);
}
