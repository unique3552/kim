package com.tour.member;

import com.tour.user.UserDTO;

public class MemberDTO extends UserDTO {

	private String grade;
	private String nation;

	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	
}
