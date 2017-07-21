package com.tour.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.member.MemberDAO;
import com.tour.util.DBConnector;

public class ServiceIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO memberDAO = new MemberDAO();
		boolean check = false;
		String id = request.getParameter("id");
		
		System.out.println("id : " + id);
				
		Connection con = DBConnector.getConnect();
		
		try {
			check = memberDAO.idCheck(con, id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println("check : " + check);
		
		if (check == true) {
			request.setAttribute("check", 1);
		} else {
			request.setAttribute("check", 0);
		}
		
		if (id.equals("")) {
			request.setAttribute("check", 2);
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../../common/ajaxResult.jsp");
		
		return actionForward;
	}

}