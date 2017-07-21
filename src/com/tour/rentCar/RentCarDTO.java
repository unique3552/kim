package com.tour.rentCar;

import com.tour.goods.GoodsDTO;

public class RentCarDTO extends GoodsDTO{
	private int price;
	private int location;
	private String kind;

	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
}