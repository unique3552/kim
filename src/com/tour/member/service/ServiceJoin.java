package com.tour.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.member.MemberDAO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.point.PointDTO;
import com.tour.util.DBConnector;

public class ServiceJoin implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		// member
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPw(request.getParameter("pw"));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setPhone(request.getParameter("phone"));
		memberDTO.setNation(request.getParameter("nation"));
		
		System.out.println("member : " + memberDTO.getId());
		System.out.println(memberDTO.getPw());
		System.out.println(memberDTO.getName());
		System.out.println(memberDTO.getPhone());
		System.out.println(memberDTO.getNation());
		
		// point
		PointDAO pointDAO = new PointDAO();
		PointDTO pointDTO = new PointDTO();
		pointDTO.setCategory("적립");
		pointDTO.setContents("회원 가입 축하");
		pointDTO.setUsePoint(1000);
		pointDTO.setCurPoint(1000);
		pointDTO.settPoint(1000);
		int result = 0;	// member
		int mnum = 0; // point insert의 결과값 : mnum
		
		Connection con = DBConnector.getConnect();
		
		System.out.println(memberDTO.getId());
		
		try {
			result = memberDAO.join(con, memberDTO); // member 가입
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			mnum = memberDAO.selectOne(con, memberDTO.getId());
			pointDTO.setMnum(mnum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("mnum : " + mnum);
		
		try {
			mnum = pointDAO.insert(con, pointDTO); // mnum 변수 재활용
		} catch (Exception e) {
			mnum = 0;
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (result > 0 && mnum > 0) {
			request.setAttribute("path", "./memberJoinSuccess.jsp");
		} else {
			request.setAttribute("path", "../../index.jsp"); //오류페이지
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../../common/commonResult.jsp");
		
		return actionForward;
	}

}
