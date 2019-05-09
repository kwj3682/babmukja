package kr.co.babmukja.admin.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.mapper.AdminMapper;

@Service("kr.co.babmukja.admin.service.AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	public AdminMapper mapper;
	
	public Map listMember(Page page){
		Map<String, Object> result = new HashMap<>();	
		result.put("list", mapper.selectMemberList(page));	
		result.put("pageResult", new PageResult(
				page.getPageNo(), mapper.selectMemberCount())
		);		
		return result;
	}

	public int countMember() {
		return mapper.selectMemberCount();
	}
}
