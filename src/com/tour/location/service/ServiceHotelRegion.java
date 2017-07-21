package com.tour.location.service;

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

public class ServiceHotelRegion implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		String nation = request.getParameter("nation");
		
		System.out.println("nation : " + nation);
		LocationDAO locationDAO = new LocationDAO();
		List<LocationDTO> regionList =null;		
		Connection con = DBConnector.getConnect();
		
		try {
			regionList = locationDAO.selectRegionList(con, nation);
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
		
		if (regionList != null) {
			request.setAttribute("regionList", regionList);
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../common/hotelRegionResult.jsp");
		
		return actionForward;
	}

}
