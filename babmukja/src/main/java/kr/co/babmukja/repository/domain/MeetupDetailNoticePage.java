package kr.co.babmukja.repository.domain;

public class MeetupDetailNoticePage {
	private int noticePageNo = 1;
	public int getNoticePageNo() {
		return noticePageNo;
	}
	public void setNoticePageNo(int noticePageNo) {
		this.noticePageNo = noticePageNo;
	}
	public int getBegin() {
		return (this.noticePageNo -1) * 5;
	}
	public int getEnd() {
		return 5;
	}
}
