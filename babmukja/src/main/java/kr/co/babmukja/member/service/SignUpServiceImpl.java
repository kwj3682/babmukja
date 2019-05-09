package kr.co.babmukja.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.mapper.MemberMapper;

@Service("kr.co.babmukja.member.service.SignUpService")
public class SignUpServiceImpl implements SignUpService{
	@Autowired
	private MemberMapper mapper;
	
}
