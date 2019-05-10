package kr.co.babmukja.repository.mapper;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Hint;
import kr.co.babmukja.repository.domain.Member;

public interface MemberMapper {
	Member selectLogin(Member member); // 로그인
	
	void insertMember(Member member); // 회원가입
	
	List<Hint> selectHintContent(); // 힌트목록

	int selectCheckId(String memId); // 아이디 중복체크
}