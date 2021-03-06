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

public class ServiceFlightNation implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		LocationDAO locationDAO=new LocationDAO();
		List<LocationDTO> ar=null;
		try {
			ar=locationDAO.selectNationList(con);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		actionForward.setCheck(true);
		request.setAttribute("nationList", ar);
		actionForward.setPath("./acityNation.jsp");
		
		return actionForward;
	}

}
