package kr.co.babmukja.recipe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Recipe;
import kr.co.babmukja.repository.mapper.RecipeMapper;

@Service("kr.co.babmukja.recipe.service.RecipeService")
public class RecipeServiceImpl implements RecipeService {
	@Autowired
	public RecipeMapper mapper;
	
	public void insertRecipeImage(FileVO file) {
		mapper.insertRecipeImage(file);
	}
	public int getMaxNum() {
		return mapper.selectMaxNum();
	}
	public Recipe list(int no) {
		return mapper.selectRecipe(no);
	}
	
	public List<Recipe> selectRecentRecipe() {
		return mapper.selectRecentRecipe();
	}


	
}

