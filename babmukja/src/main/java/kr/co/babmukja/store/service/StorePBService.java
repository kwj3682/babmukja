package kr.co.babmukja.store.service;

import kr.co.babmukja.repository.domain.StorePB;

public interface StorePBService {
	/*
	 *   editor 이전
	public List<StorePB> selectPBList();
	public void insertpb(StorePB storepb);
	public void insertPBImage(FileVO fileVO);
	public int getMax();
	public List<StorePB> selectPBMainList();
	
	// 상세조회
	public StorePB selectPBdetail(int pbNo);
	public List<FileVO> selectPBDetailImage(int groupNo);
	
	// 삭제
	public void deletePBByNo(int pbNo);
	*/
	 
	public StorePB selectPBStoreByNo(int no);
	public void insertPBStore(StorePB storepb);
}
