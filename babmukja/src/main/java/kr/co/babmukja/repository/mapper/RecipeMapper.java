package kr.co.babmukja.repository.mapper;

import kr.co.babmukja.repository.domain.Recipe;


public interface RecipeMapper {
	public void insertRecipe(Recipe recipe);
	public Recipe selectRecipeByNo(int no);
	public void updateRecipe(Recipe recipe);
	
}
