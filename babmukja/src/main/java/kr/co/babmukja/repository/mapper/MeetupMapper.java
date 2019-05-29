package kr.co.babmukja.repository.mapper;

import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupLocation;

public interface MeetupMapper {

public String selectIntro();
public void updateIntro(String intro);
public void deleteIntro();
public void insertMeetupBoard(Meetup meetup);
public void insertMeetupLocation(MeetupLocation meetupLocation);
}