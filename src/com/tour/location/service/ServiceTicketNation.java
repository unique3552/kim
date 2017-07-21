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

public class ServiceTicketNation implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		LocationDAO locationDAO = new LocationDAO();
		List<LocationDTO> ar = null;
		
		Connection con = DBConnector.getConnect();
		
		try {
			ar = locationDAO.selectNationList2(con);
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
		
		System.out.println("nation: " + ar.get(0).getEngNation());
		
		request.setAttribute("nation", ar);
		
		actionForward.setCheck(true);
		actionForward.setPath("../common/ticketNationResult.jsp");
		
		return actionForward;
	}

}
