package com.tour.rentCar.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.util.DBConnector;

public class ServiceRentList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		LocationDAO locationDAO = new LocationDAO();
		List<LocationDTO> nationList = null;
		
		Connection con = DBConnector.getConnect();
		
		try {
			nationList = locationDAO.selectNationList(con);
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
		
		if (nationList != null) {
			request.setAttribute("nationList", nationList);
		}
		
		actionForward.setPath("./rentCarList.jsp");
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
