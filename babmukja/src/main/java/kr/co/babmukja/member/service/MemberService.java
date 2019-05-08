package kr.co.babmukja.member.service;

import kr.co.babmukja.repository.domain.Member;

public interface MemberService {
	// void insertMember (Member member) throws Exception;
	Member selectLogin (Member member);
}
