package kr.co.babmukja.repository.domain;

public class Meetup {

int meetNo;
String host;
String leftAddress;
String memLimit;
String totalMem;
int fee;
String intro;
String title;
String locationCode;


public int getMeetNo() {
	return meetNo;
}
public void setMeetNo(int meetNo) {
	this.meetNo = meetNo;
}
public String getHost() {
	return host;
}
public void setHost(String host) {
	this.host = host;
}
public String getLeftAddress() {
	return leftAddress;
}
public void setLeftAddress(String leftAddress) {
	this.leftAddress = leftAddress;
}
public String getMemLimit() {
	return memLimit;
}
public void setMemLimit(String memLimit) {
	this.memLimit = memLimit;
}
public String getTotalMem() {
	return totalMem;
}
public void setTotalMem(String totalMem) {
	this.totalMem = totalMem;
}
public int getFee() {
	return fee;
}
public void setFee(int fee) {
	this.fee = fee;
}
public String getIntro() {
	return intro;
}
public void setIntro(String intro) {
	this.intro = intro;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}
public String getLocationCode() {
	return locationCode;
}
public void setLocationCode(String locationCode) {
	this.locationCode = locationCode;
}

	
}
