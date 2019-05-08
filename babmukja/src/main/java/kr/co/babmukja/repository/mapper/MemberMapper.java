package kr.co.babmukja.repository.mapper;

import kr.co.babmukja.repository.domain.Member;

public interface MemberMapper {
	Member selectLogin(Member member);
}
