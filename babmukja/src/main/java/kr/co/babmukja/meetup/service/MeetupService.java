package kr.co.babmukja.meetup.service;

import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.repository.domain.MeetupFile;

public interface MeetupService {
	
	public String selectIntro();
	public void updateIntro(String intro);
	public void deleteIntro();

	public MeetupFile uploadImage(MultipartFile file) throws Exception; 
		
}
