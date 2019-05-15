package kr.co.babmukja.recipe.service;

import kr.co.babmukja.repository.domain.Recipe;

public interface RecipeService {	
	public void insertRecipe(Recipe recipe);
	public Recipe selectRecipeByNo(int no);
	public Recipe updateForm(int no);
	public void updateRecipe(Recipe recipe);
	
}
