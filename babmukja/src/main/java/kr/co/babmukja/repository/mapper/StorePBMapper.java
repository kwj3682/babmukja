package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.StorePB;

public interface StorePBMapper {
	/*
	 *   editor 이전
	public List<StorePB> selectPBList();
	public void insertpb(StorePB storepb);
	public void insertPBImage(FileVO fileVO);
	public int selectMaxNum();
	public List<StorePB> selectPBMainList();
	
	// 상세조회
	public StorePB selectPBdetail(int pbNo);
	public List<FileVO> selectPBDetailImage(int groupNo);
	
	// 삭제
	public void deletePBByNo(int pbNo);
	*/
	
	public StorePB selectPBStoreByNo(int no);
	public List<StorePB> selectAdminPBList(Pagepb page);
	public int selectAdminPBListCount();
	public void insertPBStore(StorePB storepb);
	public void updatePBStore(StorePB storepb);
	public void deletePBStore(int no);
}
