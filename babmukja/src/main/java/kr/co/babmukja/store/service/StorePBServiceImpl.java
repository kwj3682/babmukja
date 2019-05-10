package kr.co.babmukja.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.mapper.StorePBMapper;

@Service("kr.co.babmukja.store.service.StorePBService")
public class StorePBServiceImpl implements StorePBService{

	@Autowired
	private StorePBMapper mapper;
	
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
}
