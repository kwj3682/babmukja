package kr.co.babmukja.repository.domain;

import java.util.Date;

public class Comment {
	private int commentNo; 
    private String content;           
    private Date regDate;           
    private String secret_at;         
    private int mem_no;         
    private int noticeNo;         
    
   
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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
	public String getSecret_at() {
		return secret_at;
	}
	public void setSecret_at(String secret_at) {
		this.secret_at = secret_at;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	private int notice_no;
}
