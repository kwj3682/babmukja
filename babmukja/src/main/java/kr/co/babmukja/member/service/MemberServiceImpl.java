package kr.co.babmukja.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.mapper.MemberMapper;

@Service("kr.co.babmukja.member.service.MemberService")
public class MemberServiceImpl implements MemberService {
	 
	@Autowired
	private MemberMapper mapper;

	@Override
	// 로그인
	public Member selectLogin(Member member){
		return mapper.selectLogin(member);
	} 
	
	@Override
	// 회원등록
	public void insertMember(Member member) {
		mapper.insertMember(member);
	}
	
	@Override
	// 닉네임 중복체크
	public int selectCheckNickName(String memNickname) {
		return mapper.selectCheckNickName(memNickname);
	}
	
	@Override
	// 이메일 중복체크
	public int selectCheckEmail(String memEmail) {
		return mapper.selectCheckEmail(memEmail);
	}
	
	@Override
	// 이메일 인증
	public void updateEmailVerify(String memEmail) {
		mapper.updateEmailVerify(memEmail);
	}
}
