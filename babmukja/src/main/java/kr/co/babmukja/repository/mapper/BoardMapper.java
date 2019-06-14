package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.PageBoard;

public interface BoardMapper {
	public List<Board> selectBoard(PageBoard page); // 글목록
	
	public int selectBoardCount(); // 페이징
	
	Board selectBoardByNo(int boardNo); // 글번호
	
	void insertBoard(Board board); // 글등록
	
	int deleteBoard(int boardNo); // 글삭제
	
	public void updateBoard(Board board); // 글수정
	
	public void updateBoardViewCnt(int boardNo); // 조회수
}
