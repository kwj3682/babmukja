package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupIntro;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.MeetupMember;
import kr.co.babmukja.repository.domain.PageAfterSearch;

public interface MeetupMapper {

public String selectIntro(int meetNo);
public void updateIntro(MeetupIntro meetupIntro);
public void deleteIntro();
public void insertMeetupBoard(Meetup meetup);
public void insertMeetupLocation(MeetupLocation meetupLocation);
public int selectAllMeetupCount();
public List<Meetup> selectRecommendAll();
public List<Meetup> selectRecommendKorean();
public List<Meetup> selectRecommendChinese();
public List<Meetup> selectRecommendJapanese();
public List<Meetup> selectRecommendWestern();
public List<Meetup> selectRecommendEastAsia();
public List<Meetup>	selectMeetup(PageAfterSearch page);
public Meetup selectBoard(int no);
public void insertMeetupMember(MeetupMember meetupMember);
public List<MeetupMember> selectManageMemberBoard(int no);  
//public List<MeetupLocation> selectLocation()
public List<Meetup>createdBoardByMe(int no);

}