package kr.co.babmukja.store.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.ReviewFileVO;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.domain.StorePBCart;
import kr.co.babmukja.repository.domain.StorePBInquire;
import kr.co.babmukja.repository.domain.StorePBPayment;
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
	
	public List<StorePB> selectPBStore();
	public Map<String, Object> selectPBStoreList(Pagepb page);
	public StorePB selectPBStoreByNo(int pbNo);
	// public Map<String, Object> selectAdminPBList(Pagepb page);
	//public void insertPBStore(StorePB storepb);
	public StorePB updateFormPBStore(int pbNo);
	public void updatePBStore(StorePB storepb);
	//public void deletePBStore(int no);
	public int selectPBStoreCount(Pagepb page);
	
	// 후기
	public void insertPBReview(StorePBReview reviewpb);
	public void insertPBReviewImage(FileVO fileVO);
	public int getMax();
	public List<StorePBReview> selectPBReviewSelect(StorePBReview storePBReview);
	//public List<ReviewFileVO> selectPBReviewSelectImage(int pbReivewNo);
	public List<StorePBReview> selectReview(int pbNo);
	public List<ReviewFileVO> selectReviewFile(int pbReviewNo); 
	public StorePBReview selectReviewByNo(int pbReviewNo);
	public void deleteReviewByNo(int pbReviewNo);
	public StorePBReview updatePBReview(StorePBReview storePBReview);
	
	// pb 상품 문의
	public void insertInquiry(StorePBInquire storePBInquire);
	public List<StorePBInquire> selectPBInquire(int pbNo);
	public StorePBInquire selectInquiryByNo(int inquiryNo);
	public void updateInquiry(StorePBInquire storePBInquire);
	public void deleteInquiry(int inquiryNo);
	
	// pb 상품 결제
	public void insertPBPayment(StorePBPayment storePBPayment);
	public StorePBPayment selectPBPaymentByNo(int paymentNo);
	
	// pb 상품 장바구니
	public void insertPBCart(StorePBCart storePBCart);
	public List<StorePBCart> selectPBCartByMember(int memNo);
	public void deletePBCart(int cartNo);
}
