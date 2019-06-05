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
import kr.co.babmukja.repository.domain.RecipeKeywordCode;
import kr.co.babmukja.repository.domain.RecipeKeywordName;
import kr.co.babmukja.repository.domain.RecipePage;
import kr.co.babmukja.repository.domain.RecipeReview;
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
	public void insertRecipe(Recipe recipe,  int[] keywordNo, int[] cautions) {
		mapper.insertRecipe(recipe);
		RecipeKeywordCode rk = new RecipeKeywordCode();
		rk.setCountry(keywordNo[0]);
		rk.setSituation(keywordNo[1]);
		rk.setLevel(keywordNo[2]);
		rk.setTime(keywordNo[3]);
		rk.setType(keywordNo[4]);
		
		StringBuilder cautionsString = new StringBuilder();
		for(int i=0; i< cautions.length;i++) {
			cautionsString.append(cautions[i]);
			
			if(i== cautions.length-1) {
				break;
			}
			cautionsString.append(",");
		}
		rk.setCaution(cautionsString.toString());
		rk.setRecipeNo(recipe.getRecipeNo());
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
	// 댓글 등록될 때 레시피 평점 수정하기
	public void updateRecipeRating(int no) {		
		mapper.updateRecipeRating(no);
	}

	public RecipeKeywordName selectKeywordByNo(int no){
		return mapper.selectKeywordByNo(no);
	}
	public List<Recipe> selectRecipeByKeyword(int no){
		return mapper.selectRecipeByKeyword(no);
	}
	public RecipeKeywordCode selectKeywordMost(String column){
		return mapper.selectKeywordMost(column);
	}
	public List<Keyword> selectKeyword(){
		return mapper.selectKeyword();
	}
	
	// 레시피 카테고리 전체목록 가져오기
	public List<RecipePage> selectRecipeAll(RecipePage page) {	
		System.out.println(page.getCaution());
		return mapper.selectRecipeAll(page);
	}	
	
	// 레시피 카테고리별 목록 가져오기	
	public List<RecipePage> selectRecipeByCate(RecipePage page) {		
		return mapper.selectRecipeByCate(page);
	}
	
	
	
}
