package kr.co.babmukja.meetup.service;

import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupFile;
import kr.co.babmukja.repository.domain.MeetupLocation;

public interface MeetupService {
	
	public String selectIntro();
	public void updateIntro(String intro);
	public void deleteIntro();
	public void insertMeetupBoard(Meetup meetup);
	public void insertMeetupLocation(MeetupLocation meetupLocation);
	public MeetupFile uploadImage(MultipartFile file) throws Exception; 
		
}
