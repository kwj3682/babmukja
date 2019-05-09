package kr.co.babmukja.recipe.service;

import kr.co.babmukja.repository.domain.Recipe;

public interface RecipeService {	
	public Recipe list(int no);
	public int getMaxNum();
	public void insert(Recipe recipe);
}
