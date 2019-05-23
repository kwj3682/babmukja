package kr.co.babmukja.recipe.service;

import java.util.List;

import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.domain.RecipeReview;

public interface RecipeService {	
	public void insertRecipe(Recipe recipe);
	public Recipe selectRecipeByNo(int no);
	public Recipe updateForm(int no);
	public void updateRecipe(Recipe recipe);
	public void deleteRecipe(int no);
	public List<Recipe> selectRecipe();
	public void addViewCnt(int no);
	public RecipeReview selectReviewByNo(int no);
	public int selectReviewCount(int no);
	public void insertRecipeReview(RecipeReview review);
}
