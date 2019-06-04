package kr.co.babmukja.repository.domain;

public class RecipeWriteVO {
	private Recipe recipe;
	private int[] keywordNo;
	private int[] cautions;
	public Recipe getRecipe() {
		return recipe;
	}
	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}
	public void setRecipeMemNo(int no) {
		this.recipe.setMemNo(no);
	}
	public int[] getKeywordNo() {
		return keywordNo;
	}
	public void setKeywordNo(int[] keywordNo) {
		this.keywordNo = keywordNo;
	}
	public String getCautions() {
		return cautions.toString().substring(1,cautions.toString().indexOf("]"));
	}
	public void setCautions(int[] cautions) {
		this.cautions = cautions;
	}
	
}
