package com.tour.rentCar.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.rentCar.RentCarDAO;
import com.tour.rentCar.RentCarDTO;
import com.tour.util.DBConnector;

public class ServiceRentBook implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		String pDate = request.getParameter("pDate");
		String rDate = request.getParameter("rDate");
		int diff = Integer.parseInt(request.getParameter("diff"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("num : " + num);
		System.out.println("pDate : " + pDate);
		System.out.println("rDAte : " + rDate);
		
		Connection con = DBConnector.getConnect();
		RentCarDTO rentCarDTO = new RentCarDTO();
		RentCarDAO rentCarDAO = new RentCarDAO();
		
		try {
			rentCarDTO = (RentCarDTO) rentCarDAO.selectOne(con, num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		LocationDAO locationDAO = new LocationDAO();
		LocationDTO locationDTO = new LocationDTO();
		
		try {
			locationDTO = locationDAO.selectLocation(con, rentCarDTO.getLocation());
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
		
		request.setAttribute("pDate", pDate);
		request.setAttribute("rDate", rDate);
		request.setAttribute("diff", diff);
		request.setAttribute("rentCar", rentCarDTO);
		request.setAttribute("location", locationDTO);
		request.setAttribute("num", num);
		
		actionForward.setCheck(true);
		actionForward.setPath("./rentCarBook.jsp");
		
		return actionForward;
	} 

}
