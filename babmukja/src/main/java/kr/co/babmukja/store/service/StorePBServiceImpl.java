package kr.co.babmukja.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PBPageResult;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.ReviewFileVO;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.domain.StorePBCart;
import kr.co.babmukja.repository.domain.StorePBInquire;
import kr.co.babmukja.repository.domain.StorePBPayment;
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
	
	public Map<String, Object> selectPBStoreList(Pagepb page) {
		Map<String, Object> map = new HashMap<>();
		map.put("sortType", page.getSortType());
		map.put("list", mapper.selectPBStoreList(page));
		map.put("pageResult", new PBPageResult(page.getPageNo(), mapper.selectPBStoreCount(page)));
		return map;
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
	
	public void insertPBReview(StorePBReview reviewpb,StorePB spb) {
		mapper.insertPBReview(reviewpb);
		mapper.updateRatingByMember(spb);
	}
	
	public void insertPBReviewImage(FileVO fileVO) {
		mapper.insertPBReviewImage(fileVO);
	}
	
	public int getMax() {
		return mapper.selectMaxNum();
	}
	
	public int selectPBStoreCount(Pagepb page) {
		return mapper.selectPBStoreCount(page);
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
	
	// pb 후기 수정
	
	public StorePBReview updatePBReview(StorePBReview storePBReview) {
		return mapper.updatePBReview(storePBReview);
	}
	
//	public List<ReviewFileVO> selectPBReviewSelectImage(int pbReivewNo) {
//		return mapper.selectPBReviewSelectImage(pbReivewNo);
//	}
	
	
	// PB 상품 문의
	public void insertInquiry(StorePBInquire storePBInquire) {
		mapper.insertInquiry(storePBInquire);
	}
	
	// pb 상품 조회
	public List<StorePBInquire> selectPBInquire(int pbNo) {
		return mapper.selectPBInquire(pbNo);
	}
	
	public StorePBInquire selectInquiryByNo(int inquiryNo) {
		return mapper.selectInquiryByNo(inquiryNo);
	}
	
	public void updateInquiry(StorePBInquire storePBInquire) {
		mapper.updateInquiry(storePBInquire);
	}
	
	public void deleteInquiry(int inquiryNo) {
		mapper.deleteInquiry(inquiryNo);
	}
	
	// pb 상품 결제
	public void insertPBPayment(StorePBPayment storePBPayment) {
		mapper.insertPBPayment(storePBPayment);
	}
	
	public StorePBPayment selectPBPaymentByNo(int paymentNo) {
		return mapper.selectPBPaymentByNo(paymentNo);
	}
	
	// pb 상품 장바구니
	
	public void insertPBCart(StorePBCart storePBCart) {
		mapper.insertPBCart(storePBCart);
	}
	
	public List<StorePBCart> selectPBCartByMember(int memNo) {
		return mapper.selectPBCartByMember(memNo);
	}
	
	public void deletePBCart(int cartNo) {
		mapper.deletePBCart(cartNo);
	}


}
