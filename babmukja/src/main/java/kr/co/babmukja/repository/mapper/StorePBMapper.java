package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.ReviewFileVO;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.domain.StorePBReview;

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
	
	public List<StorePB> selectPBStore();
	public StorePB selectPBStoreByNo(int pbNo);
	//public List<StorePB> selectAdminPBList(Pagepb page);
	//public int selectAdminPBListCount();
	//public void insertPBStore(StorePB storepb);
	public void updatePBStore(StorePB storepb);
	//public void deletePBStore(int no);
	public List<StorePBReview> selectPBReviewSelect(StorePBReview storePBReview);
	// public List<ReviewFileVO> selectPBReviewSelectImage(int pbReviewNo);
	
	// PB 상품 후기
	public void insertPBReview(StorePBReview reviewpb);
	public void insertPBReviewImage(FileVO fileVO);
	public int selectMaxNum();
	public List<StorePBReview> selectReview(int pbNo);
	public List<ReviewFileVO> selectReviewFile(int pbReviewNo);
	
}
