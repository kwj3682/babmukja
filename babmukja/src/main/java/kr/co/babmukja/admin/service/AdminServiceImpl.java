package kr.co.babmukja.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.mapper.AdminMapper;

@Service("kr.co.babmukja.admin.service.AdminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	public AdminMapper mapper;
}
