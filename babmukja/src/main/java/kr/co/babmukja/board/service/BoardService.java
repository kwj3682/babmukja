package kr.co.babmukja.board.service;

import java.util.Map;

import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.PageBoard;
import kr.co.babmukja.repository.domain.Recipe;

public interface BoardService {
	
	public Map<String, Object> list(PageBoard page); // 글목록
	
	public Board detail(int boardNo); // 글상세
	
	public void write(Board board) throws Exception; // 글등록
	
	public void delete(int boardNo); // 글삭제
	
	public void updateBoardViewCnt(int boardNo); // 조회수
	
	public void updateBoard(Board board); // 글수정
	
	public Board updateBoardForm(int boardNo); // 글수정 폼
}
