package kr.co.babmukja.admin.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.mapper.AdminMapper;

@Service("kr.co.babmukja.admin.service.AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	public AdminMapper mapper;
	
	public Map listMember(Page page){
		Map<String, Object> result = new HashMap<>();	
		result.put("list", mapper.selectMemberList(page));			
		result.put("searchType",page.getSearchType());
		result.put("input", page.getInput());
	
		if(page.getSignDate1() != "") {
			result.put("signDate1",page.getSignDate1());
			result.put("signDate2",page.getSignDate2());			
		}
//		if(page.getLastDate1() != "") {
//			result.put("lastDate1",page.getLastDate1());
//			result.put("lastDate2",page.getLastDate2());			
//		}
		result.put("pageResult", new PageResult(
				page.getPageNo(), mapper.selectMemberCount(page))
				);	
		return result;
	}

	public int countMember(Page page) {
		return mapper.selectMemberCount(page);
	}
	
	public Member selectMemberByNo(int no) {
		return mapper.selectMemberByNo(no);
		
	}
	

}
