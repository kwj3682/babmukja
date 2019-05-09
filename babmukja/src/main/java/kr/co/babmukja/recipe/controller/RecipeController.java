package kr.co.babmukja.recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.babmukja.recipe.service.RecipeService;
import kr.co.babmukja.repository.domain.FileVO;

@Controller("kr.co.babmukja.recipe.controller.RecipeController")
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	
	@RequestMapping("/main.do")
	public void main(Model model) {
		
		System.out.println(service.list(1));
		model.addAttribute("list", service.list(1));
	}
	
	@RequestMapping("/writeform.do")
	public void writeForm() {}
	
	@RequestMapping("/write.do")
	public String write(FileVO fileVO) {
		return "";
//		String uploadRoot = "/images";
//		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd");
//		String path = "/recipe" + sdf.format(new Date());
////		uploadPath + path,///서버 컴퓨터에 저장할 경로
//				
//		for(MultipartFile file : fileVO.getAttach()) {
//			if(file.isEmpty()) {
//				System.out.println("파일 선택하지 않음");
//				break;
//			}
//			file.transferTo(new File("c:/bit2019/upload/" + file.getOriginalFilename()));
//		}
//		for(MultipartFile file : fileVO.getAttach2()) {
//			if(file.isEmpty()) {
//				System.out.println("파일 선택하지 않음");
//				break;
//			}
//			file.transferTo(new File("c:/bit2019/upload/" + file.getOriginalFilename()));
//		}
//		
//		int maxNum = mapper.selectMaxNum();
//		
//		file.setMaxNum(maxNum);
//		
//		mapper.insertFile(File);
//		
//		
//		
//		return "redirect:/index04.jsp";
//		
//		
//		
	}
	
}
