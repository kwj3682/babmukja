package kr.co.babmukja.meetup.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupFile;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.mapper.AdminMapper;
import kr.co.babmukja.repository.mapper.MeetupMapper;

@Service("kr.co.babmukja.admin.service.MeetupService")
public class MeetupServiceImpl implements MeetupService{
	
	@Autowired
	public MeetupMapper mapper;

	
	public String selectIntro() {
		return mapper.selectIntro();
	}

	 public MeetupFile uploadImage(MultipartFile file) throws Exception {
		return null;

		
		 
	 }
	public void updateIntro(String intro) {
		 mapper.updateIntro(intro);
	}

	public void deleteIntro() {
		mapper.deleteIntro();
	}


	public void insertMeetupBoard(Meetup meetup) {
		mapper.insertMeetupBoard(meetup);
		
	}
	
	public void insertMeetupLocation(MeetupLocation meetupLocation) {
		mapper.insertMeetupLocation(meetupLocation);
	}
	
}
