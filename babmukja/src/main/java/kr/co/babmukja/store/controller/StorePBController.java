package kr.co.babmukja.store.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.repository.domain.FileVO;
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
	public String insertpb(FileVO fileVO, String pbtitle, String pbcontent) throws Exception{
		String uploadRoot = "c:bit2019/upload";
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		
		String path = "/pbstore" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		
		for (MultipartFile mFile : fileVO.getAttach()) {
			if (mFile.isEmpty()) {
				break;
			}
			
			mFile.transferTo(new File(path + mFile.getOriginalFilename()));
		}
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mainpb.do";
	}
	
	@RequestMapping("/mainpb.do")
	public void selectPBList(Model model) {
		model.addAttribute("pbList", service.selectPBList()); 
	}
	
	
}
