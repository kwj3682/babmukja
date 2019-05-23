package kr.co.babmukja.store.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Pagepb;
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

	public StorePB selectPBStoreByNo(int no) {
		return mapper.selectPBStoreByNo(no);
	}
	
	public Map<String, Object> selectAdminPBList(Pagepb page) {
		Map<String, Object> result = new HashMap<>();
		result.put("pbAdminList", mapper.selectAdminPBList(page));
		result.put("pageResult", new PageResult(
				page.getPageNo(), mapper.selectAdminPBListCount()));
		
		return result;
	}
	
	public void insertPBStore(StorePB storepb) {
		mapper.insertPBStore(storepb);
	}
	
	public StorePB updateFormPBStore(int no) {
		return mapper.selectPBStoreByNo(no);
	}
	
	public void updatePBStore(StorePB storepb) {
		mapper.updatePBStore(storepb);
	}
	
	public void deletePBStore(int no) {
		mapper.deletePBStore(no);
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
}
