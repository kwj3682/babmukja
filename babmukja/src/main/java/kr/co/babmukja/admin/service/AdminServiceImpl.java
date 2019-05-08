package kr.co.babmukja.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.mapper.AdminMapper;

@Service("kr.co.babmukja.admin.service.AdminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	public AdminMapper mapper;
	public List<Member> listMember(){
		return mapper.selectMemberList();
		
	}
}
