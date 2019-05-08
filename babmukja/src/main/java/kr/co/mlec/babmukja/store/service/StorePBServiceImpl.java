package kr.co.mlec.babmukja.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.mapper.StorePBMapper;

// mapper와 연결하는 역할
@Service("kr.co.babmukja.store.service.StorePBService")
public class StorePBServiceImpl implements StorePBService {
	
	@Autowired
	public StorePBMapper mapper;
}
