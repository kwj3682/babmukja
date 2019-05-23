package kr.co.babmukja.repository.domain;

import java.util.Date;

public class StorePBReview {
	private int pbReviewNo;
	private int pbNo;
	private String content;
	private int rating;
	private Date regDate;
	private int memNo;
	private String memNickname;
	private String path;
	private String sysname;

	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getSysname() {
		return sysname;
	}
	public void setSysname(String sysname) {
		this.sysname = sysname;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}
	
	public int getPbReviewNo() {
		return pbReviewNo;
	}
	public void setPbReviewNo(int pbReviewNo) {
		this.pbReviewNo = pbReviewNo;
	}
	public int getPbNo() {
		return pbNo;
	}
	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
}
