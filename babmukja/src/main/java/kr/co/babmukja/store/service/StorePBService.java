package kr.co.babmukja.store.service;

import java.util.Map;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.domain.StorePBReview;

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
	public Map<String, Object> selectAdminPBList(Pagepb page);
	public void insertPBStore(StorePB storepb);
	public StorePB updateFormPBStore(int no);
	public void updatePBStore(StorePB storepb);
	public void deletePBStore(int no);
	
	// 후기
	public void insertPBReview(StorePBReview reviewpb);
	public void insertPBReviewImage(FileVO fileVO);
	public int getMax();
}
