package kr.co.babmukja.repository.domain;

public class PagePbReview {
	private int pageNo = 1;
	private int pbNo;
	
	public int getPbNo() {
		return pbNo;
	}
	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (this.pageNo -1) * 3;
	}
	public int getEnd() {
		return 3;
	}
}
