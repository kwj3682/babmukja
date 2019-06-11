package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.PageAfterSearch;

public interface MeetupMapper {

public String selectIntro();
public void updateIntro(String intro);
public void deleteIntro();
public void insertMeetupBoard(Meetup meetup);
public void insertMeetupLocation(MeetupLocation meetupLocation);
public int selectAllMeetupCount();
public List<Meetup> selectRecommendAll();
public List<Meetup>	selectMeetup(PageAfterSearch page);
//public List<MeetupLocation> selectLocation()
}