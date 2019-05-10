package kr.co.babmukja.recipe.service;

import java.util.List;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Recipe;

public interface RecipeService {	
	public Recipe list(int no);
	public int getMaxNum();
	public List<Recipe> selectRecentRecipe();
	public void insertRecipeImage(FileVO file);
}
