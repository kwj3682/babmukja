package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.StorePB;

public interface StorePBMapper {
	public List<StorePB> selectPBList(int no);
}
