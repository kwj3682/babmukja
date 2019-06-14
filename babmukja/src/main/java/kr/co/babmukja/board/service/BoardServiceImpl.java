package kr.co.babmukja.board.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.PageBoard;
import kr.co.babmukja.repository.mapper.BoardMapper;

@Service("kr.co.babmukja.board.service.BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper mapper;
	
	// 글목록, 페이징
	@Override
	public Map<String, Object> list(PageBoard page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectBoard(page));
		result.put("pageResult", new PageResult(page.getPageNo(), mapper.selectBoardCount()));
		return result;
	}
	
	// 글상세
	@Override
	public Board detail(int boardNo) {
		return mapper.selectBoardByNo(boardNo);
	}
	
	// 글등록
	@Override
	public void write(Board board) throws Exception {
		mapper.insertBoard(board);
	}
	
	// 글삭제
	@Override
	public void delete(int boardNo) {
		mapper.deleteBoard(boardNo);
	}
	
	// 글수정 폼
	@Override
	public Board updateBoardForm(int boardNo) {
		return mapper.selectBoardByNo(boardNo);
	}
	
	// 글수정
	@Override
	public void updateBoard(Board board) {
		mapper.updateBoard(board);
	}
	
	// 조회수
	@Override
	public void updateBoardViewCnt(int boardNo) {
		mapper.updateBoardViewCnt(boardNo);
	}
}
