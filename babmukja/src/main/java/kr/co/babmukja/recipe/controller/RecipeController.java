package kr.co.babmukja.recipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.recipe.service.RecipeService;
import kr.co.babmukja.repository.domain.Recipe;

@Controller("kr.co.babmukja.recipe.controller.RecipeController")
@RequestMapping("/recipe")
public class RecipeController {
	
	@Autowired
	private RecipeService service;
	
	@RequestMapping("/main.do")
	public void main(){}
	
	@RequestMapping("/writeform.do")
	public void writeForm() {}
	
	@RequestMapping("/insert.do")
	public String insert(Recipe recipe) {
		service.insert(recipe);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "main.do";
	}
}
