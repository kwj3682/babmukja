package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Member;

public interface AdminMapper {
	public List<Member> selectMemberList();
}