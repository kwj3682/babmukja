package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.StorePB;

public interface StorePBMapper {
	public List<StorePB> selectPBList();
	public void insertpb(StorePB storepb);
	public void insertPBImage(FileVO fileVO);
	public int selectMaxNum();
	public List<StorePB> selectPBMainList();
}
