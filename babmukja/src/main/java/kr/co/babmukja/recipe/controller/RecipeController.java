package kr.co.babmukja.recipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("kr.co.babmukja.recipe.controller.RecipeController")
@RequestMapping("/recipe")
public class RecipeController {

	@RequestMapping("/main.do")
	public void main(){}
	
	@RequestMapping("/writeform.do")
	public void writeForm() {}
}
