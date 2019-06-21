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
public int selectAllMeetupCount(PageAfterSearch pageAfterSearch);
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
//내가 참여하는 모임 선택
public List<Meetup> selectFollowMeetup(int memNo);
//public List<MeetupLocation> selectLocation()
public List<Meetup>createdBoardByMe(int no);
public void updateApprovalStatus(int no);
public List<MeetupMember> selectMeetupMemberList(int no);
public MeetupMember selectMeetupMemberStatus (MeetupMember meetupMember);
public void updateViewCnt(int meetNo);
public void updateBanStatus(int no);
// 관리자 거절 처리
public void updateRejectStatus(int no);

//회원 탈퇴
public void updateWidthdrawlStatus(int meetNo);
}