package kr.co.babmukja.recipe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.mapper.RecipeMapper;

@Service("kr.co.babmukja.recipe.service.RecipeService")
public class RecipeServiceImpl implements RecipeService {
	@Autowired
	public RecipeMapper mapper;
}

