package kr.co.babmukja.store.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.store.service.StorePBService;

@Controller("kr.co.babmukja.store.controller.StorePBController")
@RequestMapping("/store")
public class StorePBController {
	
	@Autowired
	private StorePBService service;
	
	/*
	@RequestMapping("/mainpb.do")
	public void selectPBList(Model model, StorePB storepb) {
		model.addAttribute("pbList", service.selectPBMainList());
	}
	
	@RequestMapping("/detailpb.do")
	public void detailpb(StorePB storepb, Model model) {
		model.addAttribute("detailpb", service.selectPBdetail(storepb.getPbNo()));
		model.addAttribute("detailpbIamge", service.selectPBDetailImage(storepb.getGroupNo()));
	}
	
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

	@RequestMapping("/deletepb.do")
	public String deletePBByNo(StorePB storepb) {
		service.deletePBByNo(storepb.getPbNo());
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mainpb.do";
	}
	*/

	// 아래부 editor js 테스트
	
	@RequestMapping("/mainpb.do")
	public void mainpb(Model model) {
		
	}
	
	@RequestMapping("/insertformpb.do")
	public void insertform() {}
	
	@RequestMapping("/insertpb.do")
	@ResponseBody
	public void insertpb(StorePB storepb) {
		service.insertPBStore(storepb);
	}
	
	@RequestMapping("/detailpb.do")
	public ModelAndView detailpb(ModelAndView mav, int no) {
		StorePB store = service.selectPBStoreByNo(no);
		if (store == null) {
			System.out.println("store is null !!!");
			mav.setViewName("store/mainpb");
			return mav;
		}
		mav.setViewName("store/detailpb");
		mav.addObject("storepb", store);
		return mav;
	}
	
	// 파일 처리 
	@RequestMapping("/downloadpb.do")
	@ResponseBody
	public void downloadpb(FileVO fileVO, HttpServletResponse response) throws Exception{
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
			if (ch == -1) break;	
			bos.write(ch);   
		}

		bis.close();  fis.close();
		bos.close();  out.close();
	}
	
	@RequestMapping("/uploadpb.do")
	@ResponseBody
	public Object uploadpb(FileVO fileVO) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		String uploadRoot = "C:/bit2019/upload";
		String path = "/pbstore" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		
		MultipartFile mFile = fileVO.getAttach();
		
		String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
		mFile.transferTo(new File(uploadRoot + path + "/" + uName));

		
		fileVO.setPath(path);
		fileVO.setOrgname(mFile.getOriginalFilename());
		fileVO.setSysname(uName);
		System.out.println("file upload succeed.");

		return new Gson().toJson(fileVO);
	}
	
	// 후기 
	@RequestMapping("/pbreviewinsertform.do")
	public void reviewinsertform() {
		
	}
}
