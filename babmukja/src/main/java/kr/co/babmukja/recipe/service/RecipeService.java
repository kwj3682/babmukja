package kr.co.babmukja.recipe.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Keyword;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.domain.RecipeReview;

public interface RecipeService {	
	// 레시피 등록
	public void insertRecipe(Recipe recipe,int[] keyList);
	// 레시피 상세
	public Recipe selectRecipeByNo(int no);
	// 레시피 수정폼가기
	public Recipe updateForm(int no);
	// 레시피 수정
	public void updateRecipe(Recipe recipe);
	// 레시피 삭제
	public void deleteRecipe(int no);
	// 레시피 전체
	public List<Recipe> selectRecipe();
	public void addViewCnt(int no);
	public Map<String, Object> selectReviewByNo(Page page);
	public int selectReviewCount(Page page);
	public void insertRecipeReview(RecipeReview review);	
	public void updateRecipeReview(RecipeReview review); 
	public void deleteRecipeReview(int no);
	public RecipeReview selectOneReviewByNo(int no);
	public List<Keyword> selectKeywordMost();
	public List<Keyword> selectKeyword();
	public List<Keyword> selectKeywordByNo(int no);
	public List<Recipe> selectRecipeByKeyword(int no);
	public Map<String, Object> selectCategory(Page page);
	public int selectCategoryCount(Page page); 
}
