package kr.co.babmukja.repository.domain;

public class MeetupMember {

int meetMemNo;
int memNo;
String memName;
int meetNo;
int status;
String memEmail;

public String getMemEmail() {
	return memEmail;
}
public void setMemEmail(String memEmail) {
	this.memEmail = memEmail;
}
public int getMeetMemNo() {
	return meetMemNo;
}
public void setMeetMemNo(int meetMemNo) {
	this.meetMemNo = meetMemNo;
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
public int getMeetNo() {
	return meetNo;
}
public void setMeetNo(int meetNo) {
	this.meetNo = meetNo;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}
	
}
