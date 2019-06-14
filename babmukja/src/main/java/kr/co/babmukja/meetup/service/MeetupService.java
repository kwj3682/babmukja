package kr.co.babmukja.meetup.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupFile;
import kr.co.babmukja.repository.domain.MeetupIntro;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.MeetupMember;
import kr.co.babmukja.repository.domain.PageAfterSearch;

public interface MeetupService {
	
	
	
	public String selectIntro(int meetNo);
	public void updateIntro(MeetupIntro meetupIntro);
	public void deleteIntro();
	public void insertMeetupBoard(Meetup meetup);
	public void insertMeetupLocation(MeetupLocation meetupLocation);
	public List<Meetup> SelectRecommendAll();
	public List<Meetup> SelectRecommendKorean();
	public List<Meetup> SelectRecommendChinese();
	public List<Meetup> SelectRecommendJapanese();
	public List<Meetup> SelectRecommendWestern();
	public List<Meetup> SelectRecommendEastAsia();
	public MeetupFile uploadImage(MultipartFile file) throws Exception; 
	public Map<String, Object> selectMeetup(PageAfterSearch page);
	public Meetup selectBoard(int no);
	public void insertMeetupMember(MeetupMember meetupMember);
	public List<Meetup> createdBoardByMe(int no);
	public List<MeetupMember> selectManageMemberBoard(int no);
}
