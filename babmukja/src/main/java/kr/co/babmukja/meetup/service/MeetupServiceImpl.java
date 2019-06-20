package kr.co.babmukja.meetup.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.common.page.MeetupPageResult;
import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupFile;
import kr.co.babmukja.repository.domain.MeetupIntro;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.MeetupMember;
import kr.co.babmukja.repository.domain.PageAfterSearch;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.mapper.AdminMapper;
import kr.co.babmukja.repository.mapper.MeetupMapper;

@Service("kr.co.babmukja.admin.service.MeetupService")
public class MeetupServiceImpl implements MeetupService{
	
	@Autowired
	public MeetupMapper mapper;

	
	public String selectIntro(int meetNo) {
		return mapper.selectIntro(meetNo);
	}

	 public MeetupFile uploadImage(MultipartFile file) throws Exception {
		return null;

		
		 
	 }
	public void updateIntro(MeetupIntro meetupIntro) {
		 mapper.updateIntro(meetupIntro);
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

	public Map<String, Object> selectMeetup(PageAfterSearch page) {
		
			Map<String, Object> result = new HashMap<>();
			result.put("meetupList", mapper.selectMeetup(page));
			result.put("locationList", mapper.selectMeetup(page));
			result.put("pageResult", new MeetupPageResult(
			page.getPageNo(), mapper.selectAllMeetupCount(page)));
			
		
			return result;
	}
	
	
	
	
	
	@Override
	public List<Meetup> SelectRecommendAll() {
		
		return mapper.selectRecommendAll();
	}

	@Override
	public List<Meetup> SelectRecommendKorean() {
		return mapper.selectRecommendKorean();
	}

	@Override
	public List<Meetup> SelectRecommendChinese() {
		return mapper.selectRecommendChinese();
	}

	@Override
	public List<Meetup> SelectRecommendJapanese() {
		return mapper.selectRecommendJapanese();
	}

	@Override
	public List<Meetup> SelectRecommendWestern() {
		return mapper.selectRecommendWestern();
	}
	
	@Override
	public List<Meetup> SelectRecommendEastAsia() {
		return mapper.selectRecommendEastAsia();
	}
	
	public Meetup selectBoard(int no) {
		return mapper.selectBoard(no);
	}

	public void insertMeetupMember(MeetupMember meetupMember) {
		mapper.insertMeetupMember(meetupMember);
	}

	public List<Meetup> createdBoardByMe(int no){
		return mapper.createdBoardByMe(no);
	}

	public List<MeetupMember> selectManageMemberBoard(int no){
	return mapper.selectManageMemberBoard(no);
	}
	
	public void updateApprovalStatus(int no) {
		mapper.updateApprovalStatus(no);
	}

	public List<MeetupMember> selectMeetupMemberList(int no){
		return mapper.selectMeetupMemberList(no);
	}

	public MeetupMember selectMeetupMemberStatus(MeetupMember meetupMember) {
	return mapper.selectMeetupMemberStatus(meetupMember);
	}
	
	public void updateViewCnt(int meetNo) {
	mapper.updateViewCnt(meetNo);	
	}

	//관리자 강퇴처리하기
	public void updateBanStatus(int no) {
	mapper.updateBanStatus(no);	
	}
	
	//관리자 거절처리하기
	public void updateRejectStatus(int no) {
	mapper.updateRejectStatus(no);
	}

	//내가 참여하는 모임 리스트
	public List<Meetup> selectFollowMeetup(int memNo){
	return	mapper.selectFollowMeetup(memNo);
		
	}

	// 모임 탈퇴 처리
	public void updateWidthdrawlStatus(int meetNo) {
		mapper.updateWidthdrawlStatus(meetNo);
	}

}
