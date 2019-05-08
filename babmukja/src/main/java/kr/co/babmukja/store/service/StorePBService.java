package kr.co.babmukja.store.service;

import java.util.List;

import kr.co.babmukja.repository.domain.StorePB;

public interface StorePBService {
	public List<StorePB> selectPBList(int no);
}
