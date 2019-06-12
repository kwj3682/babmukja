package kr.co.babmukja.notice.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.google.gson.Gson;

import kr.co.babmukja.notice.service.NoticeService;
import kr.co.babmukja.repository.domain.Comment;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Notice;
import kr.co.babmukja.repository.domain.Page;

@Controller("kr.co.babmukja.notice.controller.NoticeController")
@RequestMapping("/notice")
public class NoticeController {
	@Autowired
	private NoticeService service;

	@RequestMapping("/writeForm.do")
	public void writeForm() {
	}

	@RequestMapping("/detailsample.do")
	public void detailsample() {
	}

	@RequestMapping("/write.do")
	public String write(Notice notice) {
		notice.setWriter(notice.getWriter());
		notice.setTitle(notice.getTitle());
		notice.setContent(notice.getContent());
		service.write(notice);
		System.out.println("컨텐츠 가져오기 :" + notice.getContent());
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	@RequestMapping("/uploadnotice.do")
	@ResponseBody
	public Object uploadnotice(FileVO fileVO) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/notice" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false)
			file.mkdirs();
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");

		MultipartFile mFile = fileVO.getAttach();

		if (mFile.isEmpty()) {
			System.out.println("is empty");
		}
		String uName = UUID.randomUUID().toString() + mFile.getOriginalFilename();
		mFile.transferTo(new File(uploadRoot + path + "/" + uName));

		fileVO.setPath(path);
		fileVO.setOrgname(mFile.getOriginalFilename());
		fileVO.setSysname(uName);
		System.out.println("file upload succeed.");

		return new Gson().toJson(fileVO);
	}

	@RequestMapping("/download.do")
	public void downloadnotice(FileVO fileVO, HttpServletResponse response) throws Exception {
		System.out.println("Download.do 실행");
		String uploadRoot = "c:/bit2019/upload";
		String path = fileVO.getPath();
		String sysname = fileVO.getSysname();
		File f = new File(uploadRoot + path + "/" + sysname);
		response.setHeader("Content-Type", "image/jpg");

		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);

		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while (true) {
			int ch = bis.read();
			if (ch == -1)
				break;
			bos.write(ch);
		}

		bis.close();
		fis.close();
		bos.close();
		out.close();
	}

	@RequestMapping("/updateForm.do")
	public void updateForm(int noticeNo, Model model) {
		model.addAttribute("notice", service.updateForm(noticeNo));
	}

	@RequestMapping("/update.do")
	public String update(int noticeNo, Notice notice) {
		System.out.println("no:" + notice.getNoticeNo());
		System.out.println("title:" + notice.getTitle());
		System.out.println("content:" + notice.getContent());
		service.update(notice);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	@RequestMapping("/delete.do")
	public String delete(int noticeNo) {
		service.delete(noticeNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "list.do";
	}

	@RequestMapping("/detail.do")
	public void detail(int no, Model model) {
		model.addAttribute("notice", service.detail(no));
	}

	@RequestMapping("/index.do")
	public void index() {
	}

	@RequestMapping("/list.do")
	public void list(Page page, Model model) {
		List<Notice> list = service.selectNoticeList();
		for (Notice notice : list) {
			System.out.println(notice.getWriter());
			System.out.println(notice.getNoticeNo());
			System.out.println(notice.getRegDate());
			System.out.println(notice.getViewCnt());
		}
		model.addAttribute("list", service.selectNoticeList());

	}
}
