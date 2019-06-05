package kr.co.babmukja.repository.domain;

public class Page {
	private int pageNo = 1;
	private int recipeNo;	
		
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (this.pageNo -1) * 10;
	}
	public int getEnd() {
		return 10;
	}
}
