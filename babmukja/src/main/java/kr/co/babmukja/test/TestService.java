package kr.co.babmukja.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestService {
	
	@Autowired
	private TestMapper mapper;
	
	public String selectOne() {
		return mapper.selectTest();
	}
}
