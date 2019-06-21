package kr.co.babmukja.repository.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	 private int noticeNo;   
	 private String title;        
     private String content;  
     private Date regdate;     
     private int viewcnt;  
     private String writer;
     private int memNo;
     public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	 private String imgpath;
 	 private String imgOrgname;
 	 private String imgSysname;
 	 private MultipartFile file;

	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getImgOrgname() {
		return imgOrgname;
	}
	public void setImgOrgname(String imgOrgname) {
		this.imgOrgname = imgOrgname;
	}
	public String getImgSysname() {
		return imgSysname;
	}
	public void setImgSysname(String imgSysname) {
		this.imgSysname = imgSysname;
	}
	public MultipartFile getNoticefile() {
		return file;
	}
	public void setNoticefile(MultipartFile noticefile) {
		this.file = noticefile;
	}
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
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
}
