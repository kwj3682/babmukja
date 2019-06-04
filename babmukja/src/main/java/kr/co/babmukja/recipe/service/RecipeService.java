package kr.co.babmukja.recipe.service;

import java.util.List;
import java.util.Map;

import kr.co.babmukja.repository.domain.Keyword;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.domain.RecipeKeywordName;
import kr.co.babmukja.repository.domain.RecipeReview;

public interface RecipeService {	
	// 레시피 등록
	public void insertRecipe(Recipe recipe,  int[] keywordNo, int[] cautions);
	// 레시피 상세
	public Recipe selectRecipeByNo(int no);
	// 레시피 수정폼가기
	public Recipe updateForm(int no);
	// 레시피 수정
	public void updateRecipe(Recipe recipe);
	// 레시피 삭제
	public void deleteRecipe(int no);
	// 레시피 전체 목록
	public List<Recipe> selectRecipe();
	// 레시피 조회수 증가
	public void addViewCnt(int no);
	// 레시피 댓글 조회
	public Map<String, Object> selectReviewByNo(Page page);
	// 레시피 당 댓글 수
	public int selectReviewCount(Page page);
	// 댓글 등록
	public void insertRecipeReview(RecipeReview review);	
	// 댓글 등록될 때 레시피 평점 수정하기
	public void updateRecipeRating(int no);
	// 댓글 수정
	public void updateRecipeReview(RecipeReview review); 
	// 댓글 삭제
	public void deleteRecipeReview(int no);
	// 레시피 댓글 하나 가져오기
	public RecipeReview selectOneReviewByNo(int no);
	// 레시피 키워드
	public List<Keyword> selectKeywordMost(String column);
	public List<Keyword> selectKeyword();
	public RecipeKeywordName selectKeywordByNo(int no);
	public List<Recipe> selectRecipeByKeyword(int no);
	// 레시피 카테고리별 목록 가져오기
	public Map<String, Object> selectCategory(Page page);
	public int selectCategoryCount(Page page); 
}
