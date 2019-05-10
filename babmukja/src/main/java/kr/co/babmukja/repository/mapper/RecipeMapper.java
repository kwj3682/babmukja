package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Recipe;


public interface RecipeMapper {
	public void insertRecipe(Recipe recipe);
	
	public Recipe selectRecipe(int no);
	public int selectMaxNum();
	public List<Recipe> selectRecentRecipe();
	public void insertRecipeImage(FileVO file);
}
