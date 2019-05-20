package kr.co.babmukja.store.service;

import java.util.List;

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
	public List<StorePB> selectAdminPBList();
	public void insertPBStore(StorePB storepb);
	public StorePB updateFormPBStore(int no);
	public void updatePBStore(StorePB storepb);
	public void deletePBStore(int no);
}
