package kr.co.babmukja.repository.mapper;

import kr.co.babmukja.repository.domain.Member;

public interface MemberMapper {
	Member selectLogin(Member member); // 로그인
	void insertMember(Member member); // 회원가입
}
