package kr.co.babmukja.meetup.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.babmukja.meetup.service.MeetupService;
import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupFile;
import kr.co.babmukja.repository.domain.MeetupIntro;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.MeetupMember;
import kr.co.babmukja.repository.domain.MeetupSearch;
import kr.co.babmukja.repository.domain.MeetupTag;
import kr.co.babmukja.repository.domain.PageAfterSearch;
import kr.co.babmukja.repository.domain.Pagepb;

//파일을 동적으로 받아주기 위해서 File 객체 만들

@Controller("kr.co.babmukja.meetup.controller.MeetupController")

@RequestMapping("/meetup")
public class MeetupController {
	
	//승인처리
	@RequestMapping("/manageApproval.do")
	@ResponseBody
	public void manageApproval(int meetMemNo) {
		System.out.println("meetMemNo"+meetMemNo);
		service.updateApprovalStatus(meetMemNo);
	}
	
	//모임 번호에 따른 회원 명단 보내기
	@RequestMapping("/manageMember.do")
	@ResponseBody
	public HashMap<String,Object> manageMember(int meetNo ) {
		System.out.println("manage member 들어왔음" + meetNo);
		
		HashMap<String,Object> hm =new HashMap<String,Object>();
		
		List<MeetupMember> approvalRequestList = service.selectManageMemberBoard(meetNo);
	
		for(int i=1; i<approvalRequestList.size()+1; i++) {
			approvalRequestList.get(i-1).setAdmissionNum(i);
			System.out.println("나열되는 번호" +approvalRequestList.get(i-1).getAdmissionNum());
		}
		hm.put("approvalRequestList", approvalRequestList);
     

		
		List<MeetupMember> meetupMemberList = service.selectMeetupMemberList(300);

		
		for(int i=1; i<meetupMemberList.size()+1; i++) {
			meetupMemberList.get(i-1).setAdmissionNum(i);
			System.out.println("회원목록 나열되는 번호" +meetupMemberList.get(i-1).getAdmissionNum());
		}
	
		hm.put("meetupMemberList", meetupMemberList);
		return hm;
	}
	
	
	
	@RequestMapping("/requestAdmission.do")
	@ResponseBody
	public String requestAdmission(MeetupMember meetupMember) {
		System.out.println("승인 memNo :" + meetupMember.getMemNo());
		System.out.println("승인 meetNo :" + meetupMember.getMeetNo());
		System.out.println("승인 이름 :" + meetupMember.getMemName());
		System.out.println("승인 상태 :" + meetupMember.getStatus());
		System.out.println("이메일 :" + meetupMember.getMemEmail());
		System.out.println("meetNo :" + meetupMember.getStatus());
		service.insertMeetupMember(meetupMember);
		
	
		System.out.println("수정 데이터 처리요청");
		return null;
	}

	@RequestMapping("/test.do")
	public void test() {
	System.out.println("controller 찍히는 확인");
	}

	
	@RequestMapping("/afterSearch.do")
	public void afterSearch(Model model, PageAfterSearch page,
			@RequestParam(required=true,defaultValue="1") int pageNo
			) {
		//페이징 처리
		System.out.println("1번째에서 page번호" +pageNo);
		page.setPageNo(pageNo);
		
		//검색 처리 해주기
		if(page.getCategory() ==null) {
			page.setCategory("");
		}
		if(page.getCategory().equals("전체")) {
			page.setCategory("");
		}
		if(page.getSearch() ==null) {
			page.setSearch("");
		}
		
		if(page.getCategory() ==null) {
			page.setCategory("");
		}
		
		if(page.getCity1() ==null || page.getCity1().equals("-선택-")  ) {
			System.out.println("도시확인 : " + page.getCity1());
			page.setCity1("");
		}
//		if(page.getCity2() ==null || page.getCity2().equals("-선택-")  ) {
//			System.out.println("도시확인 : " + page.getCity2());
//			page.setCity1("");
//		}
//		if(page.getCity3() ==null || page.getCity2().equals("-선택-")  ) {
//			System.out.println("도시확인 : " + page.getCity3());
//			page.setCity3("");
//		}
		
		if( page.getTown1() ==null || page.getTown1().equals("-선택-") || page.getTown1().equals("전체")  ) {
			System.out.println("도시확인 : " + page.getTown1());
			page.setTown1("");
		}
		
//		if( page.getTown2() ==null || page.getTown2().equals("-선택-") || page.getTown2().equals("전체")  ) {
//			System.out.println("도시확인 : " + page.getTown2());
//			page.setTown2("");
//		}
//
//		if( page.getTown3() ==null || page.getTown3().equals("-선택-") || page.getTown3().equals("전체")  ) {
//			System.out.println("도시확인 : " + page.getTown3());
//			page.setTown3("");
//		}
		
		System.out.println("회비 :" + page.getFee() );
		Map<String, Object> result = service.selectMeetup(page);
		model.addAttribute("meetupList", result.get("meetupList"));
		model.addAttribute("pageResult", result.get("pageResult"));
		model.addAttribute("pageAfterSearch", page);

		System.out.println("2번째 page 번호" + page.getPageNo());
		System.out.println(page.getCategory());
		System.out.println(page.getSearch());
		
		System.out.println("지역" +page.getCity2());
		System.out.println("지역");
	
		}
	
	

	
	
	@Autowired
	private MeetupService service;

	
	@RequestMapping("/createMeetup.do")
	public void CreateMeetup(MultipartFile file, String tag, String title,
		String category, String cityModal1, String cityModal2, String cityModal3,	
		String townModal1,String townModal2,String townModal3, String[] day, String fee, String detailFee,
		String hostName, int hostNo, String hostEmail
			
			) {
		System.out.println("호스트 내임, 이름" +hostName +hostNo );
		System.out.println("파일 " + file);
		System.out.println("카테고리" + category);
		System.out.println("제목" + title);
		System.out.println("태그" + tag );
		
		
		
		String meetupDay = "";
		for(int i=0; i<day.length; i++) {
		meetupDay = meetupDay + "," + day[i];
		
		}
		if(meetupDay.charAt(0) == ',') {
			System.out.println("빼지기전 확인" + meetupDay.charAt(0));
			meetupDay =	meetupDay.substring(1);
			System.out.println("빼졌는지 확인" + meetupDay);
		}
		System.out.println("요일 :" + meetupDay);
		System.out.println("fee :" + fee);
		if(detailFee !=null) {
			System.out.println("금액" + detailFee);
			}

		
	
		//file 처리
		System.out.println("들어왔음");
		System.out.println("file 들어왔나 확인" + file);
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/meetup/" + sdf.format(new Date());
		String orgFileName = file.getOriginalFilename();
		String sysFileName = uuid.toString() + orgFileName;
		String filePath = uploadRoot + path;
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		MeetupFile mFile = new MeetupFile();
		mFile.setOrgFileName(orgFileName);
		mFile.setSysFileName(sysFileName);
		mFile.setFilePath(filePath);
		File f = new File(filePath + sysFileName);
		if (f.exists() == false) {
			f.mkdirs();
		}

		try {
			System.out.println("이동 잘되나 확인");
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("실패");
		}
		
		//xml에 담아주기
		Meetup meetupBoard = new Meetup();	
		MeetupTag meetupTag = new MeetupTag();
		meetupTag.setTag(tag);
		System.out.println("진짜첫번째:" +meetupBoard.getMeetNo());
		meetupBoard.setCategory(category);
		meetupBoard.setDay(meetupDay);
		meetupBoard.setFee(detailFee);
		meetupBoard.setTitle(title);
		meetupBoard.setHostName(hostName);
		meetupBoard.setHostNo(hostNo);
		meetupBoard.setFileDir(filePath + sysFileName);
		System.out.println("첫번째:" +meetupBoard.getMeetNo());

		
		
		MeetupLocation meetupLocation = new MeetupLocation();
		
		String location="";
		if(cityModal1 !=null) {
		
			meetupLocation.setCity(cityModal1);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			System.out.println("두번째:" +meetupBoard.getMeetNo());
			System.out.println("도시1" + cityModal1);
			
			location += cityModal1;
		}
		if(townModal1 !=null) {
			meetupLocation.setTown(townModal1);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을1" + townModal1);
			
			location += " "+ townModal1;
			
			}
		if(cityModal2 !=null) {
			meetupLocation.setCity(cityModal2);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			
			System.out.println("도시2" + cityModal2);
			if(cityModal2.equals(cityModal1)) {
				
			}else {
				location += "," +" " + cityModal2;}
			}
		if(townModal2 !=null) {
			meetupLocation.setTown(townModal2);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을2" + townModal2);
			if(cityModal2.equals(cityModal1)) {
				location += ","+ townModal2;
			}else {
				location += " "+ townModal2;
			}
			}//처음 if
				
		
		if(cityModal3 !=null) {
			meetupLocation.setCity(cityModal3);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			
			System.out.println("도시3" + cityModal3);
			
			if(cityModal1.equals(cityModal3) ||cityModal2.equals(cityModal3)) {
				
			}else {
				location += "," +" " + cityModal3;
			}
			
				
		}
		
		
		if(townModal3 !=null) {
			meetupLocation.setTown(townModal3);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을3" + townModal3);
			if(cityModal1.equals(cityModal3) && !cityModal2.equals(cityModal3)) {
				location = cityModal1 +" "+ townModal1 +"," + townModal3 + " " + cityModal2 + " " + townModal2;
					
		}else if(!cityModal1.equals(cityModal3) && cityModal2.equals(cityModal3)) {
			location += ","+ townModal3;

		}else {
				location += " "+ townModal3;
			}
	}//첫번째 if 
		
		
		System.out.println("location" +location);
		
		meetupBoard.setLocation(location);
		service.insertMeetupBoard(meetupBoard);
		MeetupMember member = new MeetupMember();
		member.setMemNo(hostNo);
		member.setMemName(hostName);
		member.setMemEmail(hostEmail);
		member.setMeetNo(meetupBoard.getMeetNo());
		member.setStatus(5);
		service.insertMeetupMember(member);
		
	}//createMeetup
	
	@RequestMapping("/manage.do")
	public void manage(int hostNo, Model model) {
	System.out.println("manage 컨트롤러 들어왔음");
	System.out.println("host no" +hostNo);
	List<Meetup> meetupList; 
	meetupList = service.createdBoardByMe(hostNo);
	for(int i=1; i<meetupList.size()+1; i++) {
		meetupList.get(i-1).setManageNo(i);
		System.out.println(meetupList.get(i-1).getManageNo());
	}
	model.addAttribute("createdMeetup",meetupList);
	}
	
	@RequestMapping("/main.do")
	public void meetupMain(Model model) {
	
	model.addAttribute("selectAll", service.SelectRecommendAll());
	model.addAttribute("selectKorean", service.SelectRecommendKorean());
	model.addAttribute("selectChinese", service.SelectRecommendChinese());
	model.addAttribute("selectJapanese", service.SelectRecommendJapanese());
	model.addAttribute("selectWestern", service.SelectRecommendWestern());
	model.addAttribute("selectEastAsia", service.SelectRecommendEastAsia());
	}
	
	
	@RequestMapping("/detail.do")
	public void meetupDetail(Model model, int meetNo, int memNo) {
		System.out.println("meetNo" + meetNo +  memNo );
		//view cnt 관리
		service.updateViewCnt(meetNo);
		MeetupMember meetupMember = new MeetupMember();
		meetupMember.setMeetNo(meetNo);
		meetupMember.setMemNo(memNo);
		if(service.selectMeetupMemberStatus(meetupMember) !=null) {
		MeetupMember MeetupMemberStatus = service.selectMeetupMemberStatus(meetupMember);
		model.addAttribute("memberStatus", MeetupMemberStatus);

		}
		else {
			meetupMember.setStatus(0);
			model.addAttribute("memberStatus", meetupMember);
		}
		
		model.addAttribute("meetup", service.selectBoard(meetNo));
		
		}



	@RequestMapping("/meetupAddress.do")
	public void meetupAddress() {
		System.out.println("주소 들어왔음.");

	}

	@RequestMapping("/uploadImage.do")
	@ResponseBody
	public MeetupFile uploadImage(MultipartFile file) {
		System.out.println("들어왔음");
		System.out.println("file 들어왔나 확인" + file);
		// service.updateIntro(data);
		UUID uuid = UUID.randomUUID();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/meetup/" + sdf.format(new Date());
		String orgFileName = file.getOriginalFilename();
		String sysFileName = uuid.toString() + orgFileName;
		String filePath = uploadRoot + path;
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		MeetupFile mFile = new MeetupFile();
		mFile.setOrgFileName(orgFileName);
		mFile.setSysFileName(sysFileName);
		mFile.setFilePath(filePath);
		File f = new File(filePath + sysFileName);
		if (f.exists() == false) {
			f.mkdirs();
		}

		try {
			System.out.println("이동 잘되나 확인");
			file.transferTo(f);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("실패");
		}

		return mFile;

	}


	@RequestMapping("download.do")
	public void download(String path, HttpServletResponse response) throws IOException {

		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		BufferedInputStream bis = new BufferedInputStream(fis);
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);

		while (true) {
			int ch = bis.read();
			if (ch == -1) {
				break;
			}
			bos.write(ch);
		}
		bis.close();
		fis.close();
		bos.close();
		out.close();
	}
	

	@RequestMapping("/updateIntro.do")
	@ResponseBody
	public String updateIntro(String[] fileDirectory, String[] deleteDirectory, String dbPath, int meetNo) {
		System.out.println("세이브 후 들어왔음");
		if (deleteDirectory != null) {
		System.out.println("파일 들어왔나 확인 :" + fileDirectory[0]);
		}
		System.out.println("dbpath 들어왔나 확인 :" + dbPath);
		System.out.println("meetNo:" + meetNo);
		MeetupIntro meetupIntro = new MeetupIntro();
		meetupIntro.setDbPath(dbPath);
		meetupIntro.setMeetNo(meetNo);
		service.updateIntro(meetupIntro);
		if (deleteDirectory != null) {
			System.out.println("지울 파일 들어오나 확인 :" + deleteDirectory[0]);

			for (int i = 0; i < fileDirectory.length; i++) {

				System.out.println("----------------");
				System.out.println(fileDirectory[i]);

			}

			for (int i = 0; i < deleteDirectory.length; i++) {

				System.out.println("----------------");
				System.out.println(deleteDirectory[i]);

				File file = new File(deleteDirectory[i]);

				if (file.exists()) {
					if (file.delete()) {
						System.out.println("파일삭제 성공");
					}
				}
			} // delete for

		}

		return dbPath;

	}

	@RequestMapping("/editIntro.do")
	@ResponseBody
	public String editIntro(int meetNo) {
		System.out.println("수정 meetNo :" +meetNo);
		System.out.println("수정 데이터 처리요청");
		String data = service.selectIntro(meetNo);
		return data;
	}

	@RequestMapping("/deleteIntro.do")
	@ResponseBody
	public void deleteIntro(String[] fileDirectory) {
		System.out.println(" delete들어왔음");
		if(fileDirectory !=null) {
		for (int i = 0; i < fileDirectory.length; i++) {
			System.out.println(fileDirectory[i]);
			File file = new File(fileDirectory[i]);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("파일삭제 성공");
				}
			}
			

		}//for
		}//if
		service.deleteIntro();
	}

}
