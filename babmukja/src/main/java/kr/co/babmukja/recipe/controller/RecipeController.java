package kr.co.babmukja.recipe.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.babmukja.recipe.service.RecipeService;
import kr.co.babmukja.repository.domain.FileVO;



@Controller("kr.co.babmukja.recipe.controller.RecipeController")
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	
	@RequestMapping("/main.do")
	public void main(Model model) {		
		model.addAttribute("list", service.list(1));
	}
	//-----------------------------------------------------------------------
	@RequestMapping("/writeform.do")
	public void writeForm() {}
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public Object upload(FileVO fileVO) throws Exception {
		System.out.println("Try file upload..");
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		String uploadRoot = "C:/bit2019/tomcat-work/wtpwebapps/babmukja";
		String path = "/recipe" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		
		int max = service.getMaxNum();
		
		MultipartFile mFile = fileVO.getAttach();
		System.out.println("Try to attach to MultipartFile");
		if (mFile.isEmpty()) {
//				return;
				System.out.println("is empty");
			}
			String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
			System.out.println("Try to transfer to path");
			mFile.transferTo(new File(uploadRoot + path + "/" + uName));
//			
			fileVO.setGroupNo(max);
			fileVO.setPath(path);
			fileVO.setOrgname(mFile.getOriginalFilename());
			fileVO.setSysname(uName);
//			service.insertRecipeImage(fileVO);
			System.out.println("Return file!");
			
			return new Gson().toJson(fileVO);
	}
	
	
//	@RequestMapping("/write.do")
//	public String write() {
//		service.insertpb(storepb);
//		String uploadRoot = "c:/bit2019/upload";
//		SimpleDateFormat sdf = new SimpleDateFormat(
//				"/yyyy/MM/dd"
//		);
//		System.out.println(outputData);
//		String path = "/recipe" + sdf.format(new Date());
//		File file = new File(uploadRoot + path);
//		if (file.exists() == false) file.mkdirs();
		
//		int max = service.getMax();
		
//		for (MultipartFile mFile : fileVO.getImageList()) {
//			if (mFile.isEmpty()) {
//				break;
//			}
//			String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
//			mFile.transferTo(new File(uploadRoot + path + "/" + uName));
//			
//			//fileVO.setGroupNo(storepb.getGroupNo());
//			//1. max 값 가져오기
//			//2. max값을 fileVO에 넣기
//			fileVO.setGroupNo(max);
//			//3. insertImage( <- max값을 포함한 fileVO 넣기)
//			fileVO.setPath(path);
//			fileVO.setOrgname(mFile.getOriginalFilename());
//			fileVO.setSysname(uName);
//			service.insertPBImage(fileVO);
//		}
//		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mainpb.do";
//		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/main.do";
//		
//		
//	}
	
	//-----------------------------------------------------------------------
	
	
}
