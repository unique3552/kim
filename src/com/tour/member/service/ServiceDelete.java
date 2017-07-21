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
import com.tour.util.DBConnector;

public class ServiceDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();		
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPw(request.getParameter("pw"));
		memberDTO.setNum(Integer.parseInt(request.getParameter("num")));
		int result = 0;
		
		Connection con = DBConnector.getConnect();
		
		try {
			memberDTO = (MemberDTO) memberDAO.login(con, memberDTO);
		} catch (Exception e) {
			memberDTO = null;
			e.printStackTrace();
		}
		
		PointDAO pointDAO = new PointDAO();
		
		if (memberDTO != null) {
			try {
				result = memberDAO.delete(con, memberDTO.getNum());
				result = result + pointDAO.delete(con, memberDTO.getNum());
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
			
			System.out.println("result : " + result);
			
			if (result > 1) {
				request.getSession().invalidate();
				actionForward.setCheck(false);
				actionForward.setPath("../../index.jsp");
			}
		} else {
			// 회원 정보 (비밀번호) 오류
			actionForward.setCheck(true);
			actionForward.setPath("./memberDelete.jsp");
		}
		
		
		
		return actionForward;
	}

}
