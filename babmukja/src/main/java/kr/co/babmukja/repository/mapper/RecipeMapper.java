package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Recipe;


public interface RecipeMapper {
	public void insertRecipe(Recipe recipe);
	public Recipe selectRecipeByNo(int no);
	public void updateRecipe(Recipe recipe);
	public void deleteRecipe(int no);
	public List<Recipe> selectRecipe();
	public void addViewCnt(int no);
}
