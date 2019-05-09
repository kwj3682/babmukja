package kr.co.babmukja.store.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

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
	
	@RequestMapping("/detailpb.do")
	public void detailpb() {}
	
	@RequestMapping("/insertformpb.do")
	public void insertformpb() {}
	
	@RequestMapping("/insertpb.do")
	public String insertpb(FileVO fileVO,StorePB storepb) throws Exception{
		service.insertpb(storepb);
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
			String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
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
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mainpb.do";
	}
	
	@RequestMapping("/mainpb.do")
	public void selectPBList(Model model) {
		model.addAttribute("pbList", service.selectPBList()); 
	}
	
	
}
