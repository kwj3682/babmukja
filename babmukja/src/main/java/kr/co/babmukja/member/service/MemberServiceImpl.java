package kr.co.babmukja.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Hint;
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
	
	// 힌트 목록
	@Override
	public List<Hint> selectHintContent() {
		return mapper.selectHintContent();
	}

	@Override
	// 아이디 중복체크
	public int selectCheckId(String memId) {
		return mapper.selectCheckId(memId);
	}
	
}
