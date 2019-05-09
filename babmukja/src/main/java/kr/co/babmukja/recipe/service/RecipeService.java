package kr.co.babmukja.recipe.service;

import java.util.List;

import kr.co.babmukja.repository.domain.Recipe;

public interface RecipeService {	
	public Recipe list(int no);
<<<<<<< HEAD
	public int getMaxNum();
	public void insert(Recipe recipe);
=======
	public List<Recipe> selectRecentRecipe();
>>>>>>> master
}
