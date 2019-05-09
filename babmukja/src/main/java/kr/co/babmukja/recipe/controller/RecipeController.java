package kr.co.babmukja.recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.babmukja.recipe.service.RecipeService;



@Controller("kr.co.babmukja.recipe.controller.RecipeController")
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	
	@RequestMapping("/main.do")
	public void main(Model model) {		
		model.addAttribute("list", service.list(1));
	}
	
	@RequestMapping("/writeform.do")
	public void writeForm() {}
	
//	@RequestMapping("/write.do")
//	public String write(List<MultipartFile> attach, Recipe recipe) {
//	
//		
//		
//	}
	@RequestMapping("/cadetail.do")
	public void ca_detail() {}
	
	@RequestMapping("/")
	public void selectRecentRecipe() {
		
	}
	
}
