 package kr.co.babmukja.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.mapper.RecipeMapper;

@Service("kr.co.babmukja.recipe.service.RecipeService")
public class RecipeServiceImpl implements RecipeService {
	@Autowired
	public RecipeMapper mapper;
	
	//조회수 증가
	public void addViewCnt(int no) {
		mapper.addViewCnt(no);
	}
	
	// 레시피 삽입
	public void insertRecipe(Recipe recipe) {
		mapper.insertRecipe(recipe);
	}
	
	//번호로 레시피 찾기
	public Recipe selectRecipeByNo(int no) {
		return mapper.selectRecipeByNo(no);
	}
	
	//수정페이지에 리시피 가져가기
	public Recipe updateForm(int no) {		
		return mapper.selectRecipeByNo(no);
	}
	
	//레시피 수정
	public void updateRecipe(Recipe recipe) {
		mapper.updateRecipe(recipe);
	}
	
	//레시피 삭제
	public void deleteRecipe(int no) {
		mapper.deleteRecipe(no);
	}
	
	//레시피 전체 가져오기
	public List<Recipe> selectRecipe(){
		return mapper.selectRecipe();
	}
}

