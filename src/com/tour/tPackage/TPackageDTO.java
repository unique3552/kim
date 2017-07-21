package com.tour.tPackage;

import com.tour.goods.GoodsDTO;

public class TPackageDTO extends GoodsDTO {

	private int num;
	private String name;	// 패키지명
	private int afnum;	// 도착 항공기
	private int dfnum;	// 출발 항공기
	private int goods;	// 상품 코드 번호: 5
	private int fnum;
	private String img;
	private String nation;	// 여행 국가
	private int pnum;	// 수용 가능 인원
	private int hnum;	// 호텔 넘버
	private int price;	// 패키지 가격
	private int admin;	// 담당 관리자
	
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAfnum() {
		return afnum;
	}
	public void setAfnum(int afnum) {
		this.afnum = afnum;
	}
	public int getDfnum() {
		return dfnum;
	}
	public void setDfnum(int dfnum) {
		this.dfnum = dfnum;
	}
	public int getGoods() {
		return goods;
	}
	public void setGoods(int goods) {
		this.goods = goods;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getFnum() {
		return fnum;
	}
	public void setFnum(int fnum) {
		this.fnum = fnum;
	}
	public int getHnum() {
		return hnum;
	}
	public void setHnum(int hnum) {
		this.hnum = hnum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
		
}
