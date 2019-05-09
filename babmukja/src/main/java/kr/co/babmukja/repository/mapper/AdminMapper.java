package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;

public interface AdminMapper {
	public List<Member> selectMemberList(Page page);
	public int selectMemberCount();
}