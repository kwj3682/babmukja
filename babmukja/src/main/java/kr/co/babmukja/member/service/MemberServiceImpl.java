package kr.co.babmukja.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.mapper.MemberMapper;

@Service("kr.co.babmukja.member.service.MemberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;

//	@Override
//	public Member selectLogin(Member member){
//		return mapper.selectLogin(member);
//	}
}
