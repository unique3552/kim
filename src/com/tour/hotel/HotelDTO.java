package com.tour.hotel;

import com.tour.goods.GoodsDTO;

public class HotelDTO extends GoodsDTO {
	
	private int gnum;
	private int location;
	private int fnum;
	private String address;
	

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public int getGnum() {
		return gnum;
	}
	public void setGnum(int gnum) {
		this.gnum = gnum;
	}
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	
		
}
