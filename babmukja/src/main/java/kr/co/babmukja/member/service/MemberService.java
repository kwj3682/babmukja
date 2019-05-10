package kr.co.babmukja.member.service;

import java.util.List;

import kr.co.babmukja.repository.domain.Hint;
import kr.co.babmukja.repository.domain.Member;

public interface MemberService {
	Member selectLogin (Member member); // 로그인
	
	void insertMember (Member member); // 회원가입
	
	List<Hint> selectHintContent(); // 힌트
}
