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
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.meetup.service.MeetupService;
import kr.co.babmukja.repository.domain.Meetup;
import kr.co.babmukja.repository.domain.MeetupFile;
import kr.co.babmukja.repository.domain.MeetupLocation;
import kr.co.babmukja.repository.domain.PageAfterSearch;
import kr.co.babmukja.repository.domain.Pagepb;

//파일을 동적으로 받아주기 위해서 File 객체 만들

@Controller("kr.co.babmukja.meetup.controller.MeetupController")

@RequestMapping("/meetup")
public class MeetupController {

	@RequestMapping("/afterSearch.do")
	public void afterSearch(Model model, PageAfterSearch page) {
		Map<String, Object> result = service.selectAllMeetup(page);
		model.addAttribute("meetupList", result.get("meetupList"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	@Autowired
	private MeetupService service;

	@RequestMapping("/afterSearch.do")
	public void afterSearch() {
		System.out.println("aftersearch 들어옴");
	}
	@RequestMapping("/createMeetup.do")
	public void CreateMeetup(MultipartFile file, String title,
		String category, String city1, String city2, String city3,	
		String town1,String town2,String town3, String[] day, String fee, String detailFee
			) {
		service.selectIntro();
		System.out.println("파일 " + file);
		System.out.println("카테고리" + category);
		System.out.println("제목" + title);
		
		
		
		
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
		System.out.println("진짜첫번째:" +meetupBoard.getMeetNo());
		meetupBoard.setCategory(category);
		meetupBoard.setDay(meetupDay);
		meetupBoard.setFee(detailFee);
		meetupBoard.setTitle(title);
		meetupBoard.setFileDir(filePath + sysFileName);
		System.out.println("첫번째:" +meetupBoard.getMeetNo());

		service.insertMeetupBoard(meetupBoard);
		
		MeetupLocation meetupLocation = new MeetupLocation();
		if(city1 !=null) {
		
			meetupLocation.setCity(city1);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			System.out.println("두번째:" +meetupBoard.getMeetNo());
			System.out.println("도시1" + city1);
			
		}
		if(town1 !=null) {
			meetupLocation.setTown(town1);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을1" + town1);
			}
		if(city2 !=null) {
			meetupLocation.setCity(city2);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			
			System.out.println("도시2" + city2);
			}
		if(town2 !=null) {
			meetupLocation.setTown(town2);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을2" + town2);
			}
		if(city3 !=null) {
			meetupLocation.setCity(city3);
			meetupLocation.setMeetNo(meetupBoard.getMeetNo());
			
			System.out.println("도시3" + city3);
			}
		
		
		if(town3 !=null) {
			meetupLocation.setTown(town3);
			service.insertMeetupLocation(meetupLocation);
			System.out.println("마을3" + town3);
			}
		
	}//createMeetup
	
	@RequestMapping("/main.do")
	public void meetupMain() {
//		service.selectIntro();
		System.out.println("메인 들어왔음");
	}
	
	
	@RequestMapping("/detail.do")
	public void meetupDetail(Model model) {
//		service.selectIntro();
		model.addAttribute("intro", service.selectIntro());
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
	public String updateIntro(String[] fileDirectory, String[] deleteDirectory, String dbPath) {
		System.out.println("세이브 후 들어왔음");
		if (deleteDirectory != null) {
		System.out.println("파일 들어왔나 확인 :" + fileDirectory[0]);
		}
		System.out.println("dbpath 들어왔나 확인 :" + dbPath);
		service.updateIntro(dbPath);
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
	public String editIntro() {
		System.out.println("수정 데이터 처리요청");
		String data = service.selectIntro();
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
