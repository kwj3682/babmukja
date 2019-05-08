package kr.co.babmukja.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.mapper.StorePBMapper;

@Service
public class StorePBServiceImpl implements StorePBService{

	@Autowired
	private StorePBMapper mapper;
}
