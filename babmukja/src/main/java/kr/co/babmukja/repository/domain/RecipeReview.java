package kr.co.babmukja.repository.domain;

import java.util.Date;

public class RecipeReview {
	private String memNo;
	private int recipeReviewNo;
	private int recipeNo;
	private String content;
	private Date regDate;
	private int score;
	public String getMemNo() {
		return memNo;
	}
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}
	public int getRecipeReviewNo() {
		return recipeReviewNo;
	}
	public void setRecipeReviewNo(int recipeReviewNo) {
		this.recipeReviewNo = recipeReviewNo;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
