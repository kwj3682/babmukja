package kr.co.babmukja.recipe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.common.page.PageResult;
import kr.co.babmukja.repository.domain.Keyword;
import kr.co.babmukja.repository.domain.Page;
import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.domain.RecipePage;
import kr.co.babmukja.repository.domain.RecipeKeywordCode;
import kr.co.babmukja.repository.domain.RecipeKeywordName;
import kr.co.babmukja.repository.domain.RecipeReview;
import kr.co.babmukja.repository.domain.RecipeWriteVO;
import kr.co.babmukja.repository.mapper.RecipeMapper;

@Service("kr.co.babmukja.recipe.service.RecipeService")
public class RecipeServiceImpl implements RecipeService {
	@Autowired
	public RecipeMapper mapper;

	// 조회수 증가
	public void addViewCnt(int no) {
		mapper.addViewCnt(no);
	}

	// 레시피 삽입
	public void insertRecipe(RecipeWriteVO rw) {
		mapper.insertRecipe(rw.getRecipe());
		RecipeKeywordCode rk = new RecipeKeywordCode();
		int [] rkValue = rw.getKeywordNo();
		rk.setCountry(rkValue[0]);
		rk.setSituation(rkValue[1]);
		rk.setLevel(rkValue[2]);
		rk.setTime(rkValue[3]);
		rk.setType(rkValue[4]);
		rk.setCaution(rk.getCaution());
		mapper.insertKeywordToRecipe(rk);
	}

	// 번호로 레시피 찾기
	public Recipe selectRecipeByNo(int no) {
		return mapper.selectRecipeByNo(no);
	}

	// 수정페이지에 리시피 가져가기
	public Recipe updateForm(int no) {
		return mapper.selectRecipeByNo(no);
	}

	// 레시피 수정
	public void updateRecipe(Recipe recipe) {
		mapper.updateRecipe(recipe);
	}

	// 레시피 삭제
	public void deleteRecipe(int no) {
		mapper.deleteRecipe(no);
	}

	// 레시피 전체 가져오기
	public List<Recipe> selectRecipe() {
		return mapper.selectRecipe();
	}

	// 레시피 댓글 전체 조회
	public Map selectReviewByNo(Page page) {
		Map<String, Object> result = new HashMap<>();
		result.put("list", mapper.selectReviewByNo(page));
		result.put("pageResult", new PageResult(page.getPageNo(), mapper.selectReviewCount(page)));
		return result;
	}
	// 레시피 댓글 전체 수
	public int selectReviewCount(Page page) {
		return mapper.selectReviewCount(page);
	}
	// 레시피 댓글 등록
	public void insertRecipeReview(RecipeReview review) {
		mapper.insertRecipeReview(review);
	}
	// 레시피 댓글 수정
	public void updateRecipeReview(RecipeReview review) {
		mapper.updateRecipeReview(review);
	}
	// 레시피 댓글 하나 가져오기 
	public RecipeReview selectOneReviewByNo(int no) { 
		return mapper.selectOneReviewByNo(no); 
	}	
	// 레시피 댓글 삭제 
	public void deleteRecipeReview(int no) {
		mapper.deleteRecipeReview(no);
	}

	public RecipeKeywordName selectKeywordByNo(int no){
		return mapper.selectKeywordByNo(no);
	}
	public List<Recipe> selectRecipeByKeyword(int no){
		return mapper.selectRecipeByKeyword(no);
	}
	public List<Keyword> selectKeywordMost(String column){
		return mapper.selectKeywordMost(column);
	}
	public List<Keyword> selectKeyword(){
		return mapper.selectKeyword();
	}
	
	// 레시피 카테고리 리스트
	public Map selectCategory(RecipePage page) {
		Map<String, Object> result = new HashMap<>();
		result.put("calist", mapper.selectCategory(page));
		result.put("pageResult", new PageResult(page.getPageNo(), mapper.selectCategoryCount(page)));
		return result;
	}
	// 레시피 카테고리 리스트 전체수
	public int selectCategoryCount(RecipePage page) {
		return mapper.selectCategoryCount(page);
	}

	// 댓글 등록될 때 레시피 평점 수정하기
	public void updateRecipeRating(int no) {		
		mapper.updateRecipeRating(no);
	}
}
