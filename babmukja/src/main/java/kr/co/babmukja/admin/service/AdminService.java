package kr.co.babmukja.admin.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;

public interface AdminService {
	public Map<String, Object> listMember(Page page);
	public int countMember(Page page);
	public List<Member> selectMemberByNo(int no);
	
}
