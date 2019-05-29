package kr.co.babmukja.repository.domain;

public class Meetup {

String intro;
String title;
String fee;
String day;
String totalMem;

public String getTotalMem() {
	return totalMem;
}
public void setTotalMem(String totalMem) {
	this.totalMem = totalMem;
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
public String getFee() {
	return fee;
}
public void setFee(String fee) {
	this.fee = fee;
}
public String getDay() {
	return day;
}
public void setDay(String day) {
	this.day = day;
}
  

}