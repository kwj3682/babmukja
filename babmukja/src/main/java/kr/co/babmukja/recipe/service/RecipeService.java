package kr.co.babmukja.recipe.service;

import kr.co.babmukja.repository.domain.Recipe;

public interface RecipeService {	
	public Recipe list(int no);
	public void write(Recipe recipe);
}
