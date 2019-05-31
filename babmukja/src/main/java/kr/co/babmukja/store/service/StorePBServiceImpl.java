package kr.co.babmukja.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.ReviewFileVO;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.domain.StorePBReview;
import kr.co.babmukja.repository.mapper.StorePBMapper;

@Service("kr.co.babmukja.store.service.StorePBService")
public class StorePBServiceImpl implements StorePBService{

	@Autowired
	private StorePBMapper mapper;

	/*
	 *   editor 이전
	public List<StorePB> selectPBList() {
		return mapper.selectPBList();
	}
	
	public void insertpb(StorePB storepb) {
		mapper.insertpb(storepb);
	}
	
	public void insertPBImage(FileVO fileVO) {
		mapper.insertPBImage(fileVO);
	}
	public int getMax() {
		return mapper.selectMaxNum();
	}
	
	public List<StorePB> selectPBMainList() {
		return mapper.selectPBMainList();
	}
	
	// 상세조회
	
	public StorePB selectPBdetail(int pbNo) {
		return mapper.selectPBdetail(pbNo);
	}
	
	public List<FileVO> selectPBDetailImage(int groupNo) {
		return mapper.selectPBDetailImage(groupNo);
	}
	
	// 삭제
	
	public void deletePBByNo(int pbNo) {
		mapper.deletePBByNo(pbNo);
	}
	*/
	
	public List<StorePB> selectPBStore() {
		return mapper.selectPBStore();
	}

	public StorePB selectPBStoreByNo(int pbNo) {
		return mapper.selectPBStoreByNo(pbNo);
	}
	
	public StorePB updateFormPBStore(int pbNo) {
		return mapper.selectPBStoreByNo(pbNo);
	}
	
	public void updatePBStore(StorePB storepb) {
		mapper.updatePBStore(storepb);
	}
	
	public void insertPBReview(StorePBReview reviewpb) {
		mapper.insertPBReview(reviewpb);
	}
	
	public void insertPBReviewImage(FileVO fileVO) {
		mapper.insertPBReviewImage(fileVO);
	}
	
	public int getMax() {
		return mapper.selectMaxNum();
	}
	
	// 후기
	public List<StorePBReview> selectPBReviewSelect(StorePBReview storePBReview) {
		return mapper.selectPBReviewSelect(storePBReview);
	}
	
	public List<StorePBReview> selectReview(int pbNo) {
		return mapper.selectReview(pbNo);
	}
	
	public List<ReviewFileVO> selectReviewFile(int pbReviewNo) {
		return mapper.selectReviewFile(pbReviewNo);
	}
	
	public StorePBReview selectReviewByNo(int pbReviewNo) {
		return mapper.selectReviewByNo(pbReviewNo);
	}
	
	public void deleteReviewByNo(int pbReviewNo) {
		mapper.deleteReviewByNo(pbReviewNo);
	}
	
//	public List<ReviewFileVO> selectPBReviewSelectImage(int pbReivewNo) {
//		return mapper.selectPBReviewSelectImage(pbReivewNo);
//	}
}
