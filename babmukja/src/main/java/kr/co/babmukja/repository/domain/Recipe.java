package kr.co.babmukja.repository.domain;

import java.util.Date;
import java.util.List;

public class Recipe {
	
	private int memNo;
	private String memName;
	private String memNickname;
	
	private int recipeNo;
	private String title;
	private String content;
	private Date regDate;
	private int rating;
	private int viewCnt;
	
	private int likeCnt;
	private int likeHeart;
	private int likeNo;
	private int scrapCnt;
	
	private String imgPath;	
	private int keywordNo;
	private List<String> keyword;
	private List<String> caution;
	private int country;		
	
	public List<String> getKeyword() {
		return keyword;
	}
	public void setKeyword(List<String> keyword) {
		this.keyword = keyword;
	}
	public List<String> getCaution() {
		return caution;
	}
	public void setCaution(List<String> caution) {
		this.caution = caution;
	}
	public int getLikeNo() {
		return likeNo;
	}
	public void setLikeNo(int likeNo) {
		this.likeNo = likeNo;
	}
	public int getLikeHeart() {
		return likeHeart;
	}
	public void setLikeHeart(int likeHeart) {
		this.likeHeart = likeHeart;
	}
	public int getCountry() {
		return country;
	}
	public void setCountry(int country) {
		this.country = country;
	}
	public int getKeywordNo() {
		return keywordNo;
	}
	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public int getScrapCnt() {
		return scrapCnt;
	}
	public void setScrapCnt(int scrapCnt) {
		this.scrapCnt = scrapCnt;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getRecipeNo() {
		return recipeNo;
	}
	public void setRecipeNo(int recipeNo) {
		this.recipeNo = recipeNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Recipe [memNo=" + memNo + ", memName=" + memName + ", memNickname=" + memNickname + ", recipeNo="
				+ recipeNo + ", title=" + title + ", content=" + content + ", regDate=" + regDate + ", rating=" + rating
				+ ", viewCnt=" + viewCnt + ", likeCnt=" + likeCnt + ", likeHeart=" + likeHeart + ", likeNo=" + likeNo
				+ ", scrapCnt=" + scrapCnt + ", imgPath=" + imgPath + ", keywordNo=" + keywordNo + ", keyword="
				+ keyword + ", caution=" + caution + ", country=" + country + "]";
	}


	
}
