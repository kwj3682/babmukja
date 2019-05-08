package kr.co.babmukja.repository.vo;

import java.util.Date;

public class Comment {
	private int comment_no; 
    private String content;           
    private Date regdate;           
    private String secret_at;         
    private int mem_no;         
    
    public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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
