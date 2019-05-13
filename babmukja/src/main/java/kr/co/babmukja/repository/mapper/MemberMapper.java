package kr.co.babmukja.repository.mapper;

import kr.co.babmukja.repository.domain.Member;

public interface MemberMapper {
	Member selectLogin(Member member); // 로그인
	
	void insertMember(Member member); // 회원가입

	int selectCheckNickName(String memNickname); // 닉네임 중복체크
	
}