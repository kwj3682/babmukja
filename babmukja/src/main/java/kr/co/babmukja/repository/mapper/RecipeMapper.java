package kr.co.babmukja.repository.mapper;

import java.util.List;

import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.domain.RecipeReview;


public interface RecipeMapper {
	// 레시피 등록
	public void insertRecipe(Recipe recipe);
	// 레시피 상세 조회
	public Recipe selectRecipeByNo(int no);
	// 레시피 수정
	public void updateRecipe(Recipe recipe);
	// 레시피 삭제
	public void deleteRecipe(int no);
	// 레시피 목록
	public List<Recipe> selectRecipe();
	// 레시피 조회수 증가
	public void addViewCnt(int no);
	// 레시피 댓글 조회
	public List<RecipeReview> selectReviewByNo(Page page);
	// 레시피 수 카운트
	public int selectReviewCount(Page page);
	// 레시피 댓글 등록
	public void insertRecipeReview(RecipeReview review);
	// 레시피 댓글 수정
	public void updateRecipeReview(RecipeReview review);
}
