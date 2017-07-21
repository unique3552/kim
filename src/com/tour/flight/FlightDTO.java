package com.tour.flight;

import com.tour.goods.GoodsDTO;

public class FlightDTO extends GoodsDTO {
	
	private int pnum;
	private String atime;
	private String dtime;
	private int acity;
	private int dcity;
	private int price;
	private String company;
	
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getAtime() {
		return atime;
	}
	public void setAtime(String atime) {
		this.atime = atime;
	}
	public String getDtime() {
		return dtime;
	}
	public void setDtime(String dtime) {
		this.dtime = dtime;
	}
	
	public int getAcity() {
		return acity;
	}
	public void setAcity(int acity) {
		this.acity = acity;
	}
	public int getDcity() {
		return dcity;
	}
	public void setDcity(int dcity) {
		this.dcity = dcity;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
			
}
