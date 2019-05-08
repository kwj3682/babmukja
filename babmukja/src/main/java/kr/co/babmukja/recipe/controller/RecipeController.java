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
		
		System.out.println(service.list(1));
		model.addAttribute("list", service.list(1));
	}
	
	@RequestMapping("/writeform.do")
	public void writeForm() {}
	
}
