package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Comment;

//package kr.co.babmukja.repository.mapper;
//
//import java.util.List;
//
//import kr.co.babmukja.repository.domain.Comment;
//
public interface CommentMapper {
    List<Comment> selectCommentByNo();
    public int commentUpdate(Comment comment);
    public int commentDelete(int noticeCommentNo);
    int commentInsert(Comment comment);
	List<Comment> commentList(int noticeNo);
	public int commentCount();
	public Comment commentSelectByNo(int noticeCommentNo);
}
