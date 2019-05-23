package kr.co.babmukja.repository.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Notice {
	 private int noticeNo;               
     private String title;        
     private String content;  
     private Date  regDate;     
     private int viewCnt;    
     private String writer;
     
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Object getCommentNO() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
