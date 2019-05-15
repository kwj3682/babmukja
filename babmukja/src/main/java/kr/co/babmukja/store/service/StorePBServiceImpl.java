package kr.co.babmukja.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.StorePB;
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
	
	public void insertPBStore(StorePB storepb) {
		mapper.insertPBStore(storepb);
	}
	
}
