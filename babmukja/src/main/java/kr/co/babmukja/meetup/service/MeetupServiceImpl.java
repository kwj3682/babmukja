package kr.co.babmukja.meetup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.mapper.AdminMapper;
import kr.co.babmukja.repository.mapper.MeetupMapper;

@Service("kr.co.babmukja.admin.service.MeetupService")
public class MeetupServiceImpl implements MeetupService{
	
	@Autowired
	public MeetupMapper mapper;
}
