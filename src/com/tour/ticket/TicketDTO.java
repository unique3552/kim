package com.tour.ticket;

import com.tour.goods.GoodsDTO;

public class TicketDTO extends GoodsDTO {

	private int location;
	private String kind;
	private int price;
	
	public int getLocation() {
		return location;
	}
	public void setLocation(int location) {
		this.location = location;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
		
}
