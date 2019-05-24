package kr.co.babmukja.notice.service;

import java.util.List;

import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.Notice;

public interface CommentService {
	List<Comment> commentListService() throws Exception;
    public int commentInsertService(Comment comment) throws Exception;
	public int commentUpdateService(Comment comment) throws Exception;
	public int commentDeleteService(int commentNo) throws Exception;
	

}
