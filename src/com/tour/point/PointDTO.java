package com.tour.point;

import java.sql.Date;

public class PointDTO {
	private int num;
	private Date reserve;
	private String category;
	private String contents;
	private int usePoint;
	private int mnum;
	private int curPoint;
	private int tPoint;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getReserve() {
		return reserve;
	}
	public void setReserve(Date reserve) {
		this.reserve = reserve;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}
	public int getMnum() {
		return mnum;
	}
	public void setMnum(int mnum) {
		this.mnum = mnum;
	}
	public int getCurPoint() {
		return curPoint;
	}
	public void setCurPoint(int curPoint) {
		this.curPoint = curPoint;
	}
	public int gettPoint() {
		return tPoint;
	}
	public void settPoint(int tPoint) {
		this.tPoint = tPoint;
	}
	
}
