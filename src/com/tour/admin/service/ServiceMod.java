package com.tour.admin.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.admin.AdminDAO;
import com.tour.admin.AdminDTO;
import com.tour.util.DBConnector;

public class ServiceMod implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AdminDAO adminDAO = new AdminDAO();
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setId(request.getParameter("id"));
		adminDTO.setNum(Integer.parseInt(request.getParameter("num")));
		adminDTO.setPw(request.getParameter("pw"));
		adminDTO.setPhone(request.getParameter("phone"));
		int result = 0;
		
		Connection con = DBConnector.getConnect();
		
		try {
			result = adminDAO.update(con, adminDTO);
			adminDTO = (AdminDTO) adminDAO.login(con, adminDTO);
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
		
		if (result > 0) {
			request.getSession().setAttribute("admin", adminDTO);
			request.setAttribute("message", "회원 정보 수정 완료");
		} else {
			// 오류페이지
			request.setAttribute("message", "회원 정보 수정 오류");
		}
		
		request.setAttribute("path", "./adminMyInfo.jsp");
		actionForward.setCheck(true);
		actionForward.setPath("../../common/commonResult.jsp");
		
		return actionForward;
	}

}
