package com.tour.admin.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.admin.AdminDAO;
import com.tour.admin.AdminDTO;
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
import com.tour.util.DBConnector;

public class ServiceGoods implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		AdminDAO adminDAO = new AdminDAO();
		AdminDTO adminDTO = (AdminDTO) request.getSession().getAttribute("admin");
		String id = adminDTO.getId();
		int anum = 0;
		List<TPackageDTO> ar = null;
		
		TPackageDAO tPackageDAO = new TPackageDAO();
		
		Connection con = DBConnector.getConnect();
		
		System.out.println("id : " + id);

		try {
			anum = adminDAO.selectOne(con, id);
			System.out.println("anum : " + anum);
			ar = tPackageDAO.selectAdminList(con, anum);
		} catch (Exception e) {
			ar = null;
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println("ar : " + ar.get(0).getName());
		
		request.setAttribute("tpackage", ar);
		
		
		actionForward.setCheck(true);
		actionForward.setPath("./adminGoods.jsp");
		
		return actionForward;
	}

}
