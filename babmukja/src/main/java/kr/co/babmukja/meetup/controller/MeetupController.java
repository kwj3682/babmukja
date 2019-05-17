package kr.co.babmukja.meetup.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.babmukja.meetup.service.MeetupService;

@Controller("kr.co.babmukja.meetup.controller.MeetupController")

@RequestMapping("/meetup")
public class MeetupController {

	@Autowired
	private MeetupService service;

	@RequestMapping("/detail.do")
	public void meetupDetail(Model model) {
//		service.selectIntro();
		model.addAttribute("intro", service.selectIntro());

	}

	@RequestMapping("/main.do")
	public void meetupMain() {
		System.out.println("main 들어왔음.");

	}

	@RequestMapping("/meetupAddress.do")
	public void meetupAddress() {
		System.out.println("주소 들어왔음.");

	}

	@RequestMapping("/updateIntro.do")
	@ResponseBody
	public String updateIntro(String data) {
		System.out.println("들어왔음");

		service.updateIntro(data);
		return data;

		// 읽을때
		FileReader fr = null;
		BufferedReader br = null;
		try {
			fr = new FileReader("data/lec17/Test03.java");
			br = new BufferedReader(fr);
			while (true) {
				int ch = br.read();
				if (ch == -1)
					break;
				System.out.println((char) ch);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
			} catch (IOException e1) {
			}
			try {
				fr.close();
			} catch (IOException e1) {
			}
		}
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
	public void deleteIntro() {
		System.out.println(" delete들어왔음");

		service.deleteIntro();

	}

}

/*
 * package lec17;
 * 
 * import java.io.BufferedWriter; import java.io.FileWriter; import
 * java.io.PrintWriter; import java.util.Random;
 * 
 * public class Test18 { public static void main(String[] args) { String[] msg =
 * {"잘 살아~", "행복해", "부자되세요", "건강해", "잘자라"};
 * 
 * String[] user = {"공유", "현빈", "송강호", "김혜수", "전지현"};
 * 
 * try { FileWriter fw = new FileWriter("data/lec17/msg.txt"); BufferedWriter bw
 * = new BufferedWriter(fw); // 속도 향상 PrintWriter pw = new PrintWriter(bw); //
 * 출력과 관련된 편리한 API 사용하기위해
 * 
 * Random r = new Random(); for(int i=1 ; i<=100 ; i++) { // 1.화면에 출력 //
 * System.out.printf("%d. %s님 %s\n", i, // user[r.nextInt(user.length)],
 * msg[r.nextInt(msg.length)]);
 * 
 * 2. 파일에 저장 String file = String.format("%d. %s님 %s", i,
 * user[r.nextInt(user.length)], msg[r.nextInt(msg.length)]);
 * 
 * bw.write(file); bw.newLine();
 * 
 * 
 * 
 * // 3. PrintWriter AIP 사용! pw.printf("%d. %s님 %s\n", i,
 * user[r.nextInt(user.length)], msg[r.nextInt(msg.length)]);
 * 
 * } System.out.println("성공"); pw.close(); bw.close(); fw.close();
 * 
 * } catch (Exception e) { e.printStackTrace(); }
 * 
 * 
 * } }
 */
