package kr.co.babmukja.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.board.service.BoardService;
import kr.co.babmukja.repository.domain.Board;
import kr.co.babmukja.repository.domain.PageBoard;

@Controller("kr.co.babmukja.board.controller.BoardController")
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	@RequestMapping("/list.do")
	// 글목록, 페이징
	public void list(PageBoard page, Model model) {
		Map<String, Object> result = service.list(page);
		model.addAttribute("list", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}

	@RequestMapping("/detail.do")
	// 글상세
	public void detail(int boardNo, Model model) {
		service.updateBoardViewCnt(boardNo);
		model.addAttribute("board", service.detail(boardNo));
	}

	@RequestMapping("/writeform.do")
	// 글등록 폼
	public void writeForm() {}

	@RequestMapping("/write.do")
	// 글등록 처리
	public Object write(Board board) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
		String uploadRoot = "C:/bit2019/upload";
		String path = "/board" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false)
			file.mkdirs();

		MultipartFile bFile = board.getBoardfile();

		if (bFile.isEmpty()) {
			System.out.println("is empty");
		}
		String uName = UUID.randomUUID().toString() + bFile.getOriginalFilename();
		bFile.transferTo(new File(uploadRoot + path + "/" + uName));
		
		board.setImgpath(path);
		board.setImgOrgname(bFile.getOriginalFilename());
		board.setImgSysname(uName);

		service.write(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/board/list.do";
	}
	
	@RequestMapping("/imgdownload.do")
	public void download(int boardNo, HttpServletResponse response) throws Exception {
		Board board = service.detail(boardNo);
		String uploadRoot = "c:/bit2019/upload";
		String path = board.getImgpath();
		String sysname = board.getImgSysname();
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

	@RequestMapping("/delete.do")
	// 글삭제
	public String delete(int boardNo) {
		service.delete(boardNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/board/list.do";
	}
	
	@RequestMapping("/updateform.do")
	// 글수정 폼
	public void updateForm(int boardNo, Model model) {
		model.addAttribute("board", service.updateBoardForm(boardNo));
	}
	
	@RequestMapping("/update.do")
	@ResponseBody
	public String update(Board board) {
		service.updateBoard(board);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/board/list.do";
	}
}
