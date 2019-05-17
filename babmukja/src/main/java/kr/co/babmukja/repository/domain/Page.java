package kr.co.babmukja.repository.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Page {
	private int pageNo = 1;
	private String input;
	private String searchType;
	private String signDate1;
	private String signDate2;
	private String lastDate1;
	private String lastDate2;
	private String totalBuy1;
	private String totalBuy2;
	private String totalSel1;
	private String totalSel2;
	private String recipeCnt1;
	private String recipeCnt2;
	private String sellingCnt1;
	private String sellingCnt2;
	private String point1;
	private String point2;
	private String gradeType;
	

	public String getSignDate1() {
		return signDate1;
	}
	public void setSignDate1(String signDate1) {
		this.signDate1 = signDate1;
	}
	public String getSignDate2() {
		return signDate2;
	}
	public void setSignDate2(String signDate2) {
		this.signDate2 = signDate2;
	}
	public String getLastDate1() {
		return lastDate1;
	}
	public void setLastDate1(String lastDate1) {
		this.lastDate1 = lastDate1;
	}
	public String getLastDate2() {
		return lastDate2;
	}
	public void setLastDate2(String lastDate2) {
		this.lastDate2 = lastDate2;
	}
	public String getTotalBuy1() {
		return totalBuy1;
	}
	public void setTotalBuy1(String totalBuy1) {
		this.totalBuy1 = totalBuy1;
	}
	public String getTotalBuy2() {
		return totalBuy2;
	}
	public void setTotalBuy2(String totalBuy2) {
		this.totalBuy2 = totalBuy2;
	}
	public String getTotalSel1() {
		return totalSel1;
	}
	public void setTotalSel1(String totalSel1) {
		this.totalSel1 = totalSel1;
	}
	public String getTotalSel2() {
		return totalSel2;
	}
	public void setTotalSel2(String totalSel2) {
		this.totalSel2 = totalSel2;
	}
	public String getRecipeCnt1() {
		return recipeCnt1;
	}
	public void setRecipeCnt1(String recipeCnt1) {
		this.recipeCnt1 = recipeCnt1;
	}
	public String getRecipeCnt2() {
		return recipeCnt2;
	}
	public void setRecipeCnt2(String recipeCnt2) {
		this.recipeCnt2 = recipeCnt2;
	}
	public String getSellingCnt1() {
		return sellingCnt1;
	}
	public void setSellingCnt1(String sellingCnt1) {
		this.sellingCnt1 = sellingCnt1;
	}
	public String getSellingCnt2() {
		return sellingCnt2;
	}
	public void setSellingCnt2(String sellingCnt2) {
		this.sellingCnt2 = sellingCnt2;
	}
	public String getPoint1() {
		return point1;
	}
	public void setPoint1(String point1) {
		this.point1 = point1;
	}
	public String getPoint2() {
		return point2;
	}
	public void setPoint2(String point2) {
		this.point2 = point2;
	}
	public String getGradeType() {
		return gradeType;
	}
	public void setGradeType(String gradeType) {
		this.gradeType = gradeType;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getInput() {
		return input;
	}
	public void setInput(String input) {
		this.input = input;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getBegin() {
		return (this.pageNo -1) * 10;
	}
	public int getEnd() {
		return this.pageNo * 10;
	}
}
