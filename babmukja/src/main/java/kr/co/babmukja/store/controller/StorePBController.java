package kr.co.babmukja.store.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.google.gson.Gson;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.domain.StorePBReview;
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
	public void mainpb(Model model) {}
	
	// pb 상품 등록 폼
	@RequestMapping("/insertformpb.do")
	public void insertformpb() {}
	
	// pb 상품 등록
	@RequestMapping("/insertpb.do")
	@ResponseBody
	public void insertpb(StorePB storepb) {
		service.insertPBStore(storepb);
	}
	
	// pb 상품 상세조회
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
	
	// pb 상품 수정 폼
	@RequestMapping("/updateformpb.do")
	public void updatepbform(Model model, int no) {
		model.addAttribute("storepb", service.updateFormPBStore(no));
	}
	
	// pb 상품 수정
	@RequestMapping("/updatepb.do")
	public String updatepb(StorePB storepb) {
		service.updatePBStore(storepb);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/store/pbstoreselectlist.do";
	}
	
	// pb 상품 삭제
	@RequestMapping("/deletepb.do")
	public String deletepb(int no) {
		service.deletePBStore(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/store/pbstoreselectlist.do"; 
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
	
	// PB 스토어 목록조회  (관리자전용)
	@RequestMapping("/pbstoreselectlist.do")
	public void pbstoreselectlist(Model model, Pagepb page) {
		Map<String, Object> result = service.selectAdminPBList(page);
		
		model.addAttribute("pbAdminList", result.get("pbAdminList"));
		model.addAttribute("pageResult", result.get("pageResult"));
	}
	
	// pb 상품 후기  등록
	@RequestMapping("/pbreviewinsert.do")
	@ResponseBody
	public void pbreviewinsert(FileVO fileVO, StorePBReview reviewpb) throws Exception {
		System.out.println(reviewpb.getContent());
		String uploadRoot = "c:/bit2019/upload";
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		
		String path = "/pbReview" + sdf.format(new Date());
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
			service.insertPBReviewImage(fileVO);

		}
		reviewpb.setPbNo(reviewpb.getPbNo());
		reviewpb.setGroupNo(fileVO.getGroupNo());
		service.insertPBReview(reviewpb);
		
	}
}
