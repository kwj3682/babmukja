package kr.co.babmukja.recipe.service;

import java.util.List;

import kr.co.babmukja.repository.domain.Recipe;

public interface RecipeService {	
	public void insertRecipe(Recipe recipe);
	public Recipe selectRecipeByNo(int no);
	public Recipe updateForm(int no);
	public void updateRecipe(Recipe recipe);
	public void deleteRecipe(int no);
	public List<Recipe> selectRecipe();
}
