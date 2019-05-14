package kr.co.babmukja.store.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.store.service.StorePBService;

@Controller("kr.co.babmukja.store.controller.StorePBController")
@RequestMapping("/store")
public class StorePBController {
	
	@Autowired
	private StorePBService service;
	
	@RequestMapping("/downloadpb.do")
	public void downloadpb(FileVO fileVO, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String uploadRoot = "c:/bit2019/upload";
		String path = fileVO.getPath();
		String sysname = fileVO.getSysname();
		String dName = request.getParameter("dname");
		
		File f = new File(uploadRoot + path + "/" + sysname);
		
		if (dName == null) {
			response.setHeader("Content-Type", "image/jpg");  // 브라우저에게 전송하는 데이터를 해석하도록 하는 정보
		} else {
			response.setHeader("Content-Type", "application/octet-stream");  // 브라우저가 해석해서 다운로드 받아라
			
			dName = new String(dName.getBytes("utf-8"), "8859_1");  // 다운로드 할 때 dname 이 한글이면 인식을 못하는 것을 인식하도록 하는 것
			response.setHeader("Content-Disposition", "attachment;filename=" + dName); 
		}
		
		try {
			FileInputStream fis = new FileInputStream(f);
			BufferedInputStream bis = new BufferedInputStream(fis);
			
			// 사용자에게 전송할 아웃풋을 생성
			OutputStream out = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(out);
			
			while (true) {
				int ch = bis.read();	// bis 읽자 ~~ 파일을
				if (ch == -1) break;	// -1이면 읽을게없다. 그럼 나가자
				
				bos.write(ch);   // 읽은 내용을 write 해주기
			}
			
			// close 해주기
			bis.close();  fis.close();
			bos.close();  out.close();
			
		} catch (Exception e) {

		}
	}
	
	@RequestMapping("/mainpb.do")
	public void selectPBList(Model model, StorePB storepb) {
		model.addAttribute("pbList", service.selectPBMainList());
	}
	
	@RequestMapping("/detailpb.do")
	public void detailpb(StorePB storepb, Model model) {
		model.addAttribute("detailpb", service.selectPBdetail(storepb.getPbNo()));
		model.addAttribute("detailpbIamge", service.selectPBDetailImage(storepb.getGroupNo()));
	}
	
	/*
	@RequestMapping("/detailpb.do")
	public void detailpb() {
		//return 타입 수정할 것!!
		Map<String,Object> map = new HashMap<>();
		
		map.put("pbList", service.selectPBMainList());

		List<StorePB> list = service.selectPBMainList();
		List<String> fileList = new ArrayList<>();
		String uploadRoot = "c:/bit2019/upload";
		for(StorePB pb : list) {
			List<FileVO> files = pb.getImages();
			for(FileVO file : files) {
				fileList.add(uploadRoot + "/" + file.getPath() + "/" + file.getSysname() );
			}
		}
		map.put("fileList",fileList);

	}
	*/
	
	@RequestMapping("/insertformpb.do")
	public void insertformpb() {}
	
	@RequestMapping("/insertpb.do")
	public String insertpb(FileVO fileVO,StorePB storepb) throws Exception{
		
		String uploadRoot = "c:/bit2019/upload";
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		
		String path = "/pbstore" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		int max = service.getMax();
		
		for (MultipartFile mFile : fileVO.getImageList()) {
			if (mFile.isEmpty()) {
				break;
			}
			String uName =  UUID.randomUUID().toString();
			mFile.transferTo(new File(uploadRoot + path + "/" + uName));
			
			//fileVO.setGroupNo(storepb.getGroupNo());
			//1. max 값 가져오기
			//2. max값을 fileVO에 넣기
			fileVO.setGroupNo(max);
			
			//3. insertImage( <- max값을 포함한 fileVO 넣기)
			fileVO.setPath(path);
			fileVO.setOrgname(mFile.getOriginalFilename());
			fileVO.setSysname(uName);
			service.insertPBImage(fileVO);

		}
		storepb.setGroupNo(fileVO.getGroupNo());
		service.insertpb(storepb);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mainpb.do";
	}


	
}
