package kr.co.babmukja.admin.service;

import java.util.Map;

import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;

public interface AdminService {
	public Map<String, Object> listMember(Page page);
	public int countMember(Page page);
	public Member selectMemberByNo(int no);
	
}
