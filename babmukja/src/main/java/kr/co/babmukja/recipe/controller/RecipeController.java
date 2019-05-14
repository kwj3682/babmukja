package kr.co.babmukja.recipe.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.google.gson.Gson;

import kr.co.babmukja.recipe.service.RecipeService;
import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Recipe;



@Controller("kr.co.babmukja.recipe.controller.RecipeController")
@RequestMapping("/recipe")
public class RecipeController {
	

	@Autowired
	private RecipeService service;	
	
	@RequestMapping("/main.do")
	public void main(Model model) {		
//		model.addAttribute("list", service.list(1));
	}
	//-----------------------------------------------------------------------
	@RequestMapping("/writeform.do")
	public void writeForm() {}
	
	
	@RequestMapping("/upload.do")
	@ResponseBody
	public Object upload(FileVO fileVO) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		String uploadRoot = "C:/bit2019/upload";
		String path = "/recipe" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		
		MultipartFile mFile = fileVO.getAttach();
		
		if (mFile.isEmpty()) {
//				return;
				System.out.println("is empty");
			}
			String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
			mFile.transferTo(new File(uploadRoot + path + "/" + uName));

			
			fileVO.setPath(path);
			fileVO.setOrgname(mFile.getOriginalFilename());
			fileVO.setSysname(uName);
			System.out.println("file upload succeed.");

			return new Gson().toJson(fileVO);
	}
	
	
	@RequestMapping("/download.do")
	public void download(FileVO fileVO, HttpServletResponse response) throws Exception {
		System.out.println("Download.do");
		String uploadRoot = "c:/bit2019/upload";
		String path = fileVO.getPath();
		String sysname = fileVO.getSysname();
		
		System.out.println("path : "+ path);
		System.out.println("sysname : "+ sysname);
		
		System.out.println("file 생성");
		File f = new File(uploadRoot + path + "/" + sysname);
		
//		f = new File("c:/bit2019/upload/recipe/2019/05/10/767e829f-78ce-47ed-bd82-a0d85da1a9c820140510_221359.jpg");
		response.setHeader("Content-Type", "image/jpg");
		
		// 파일을 읽고 사용자에게 전송
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		while(true) {
			int ch = bis.read();
			if(ch == -1) break;
			bos.write(ch);
		}
		
		bis.close();  fis.close();
		bos.close();  out.close();
	}
	
	
	@RequestMapping("/write.do")
	public void write(Recipe recipe) {
		System.out.println("받아옴");
		System.out.println(recipe.getContent());
		System.out.println(recipe.getTitle());
		service.insertRecipe(recipe);
	}
	
	@RequestMapping("/detail.do")
	public void detail(Model model) {
		
		model.addAttribute("recipe", service.selectRecipeByNo(27));
	}
}
