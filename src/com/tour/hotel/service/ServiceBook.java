package com.tour.hotel.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.hotel.HotelDAO;
import com.tour.hotel.HotelDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.room.RoomDAO;
import com.tour.room.RoomDTO;
import com.tour.util.DBConnector;

public class ServiceBook implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		int num=0;
		int rnum=0;
		int totalPrice=0;
		int location=0;
		String pDate="";
		String rDate="";
		try{
			num=Integer.parseInt(request.getParameter("num"));
			rnum=Integer.parseInt(request.getParameter("rnum"));
			totalPrice=Integer.parseInt(request.getParameter("totalPrice"));
			location=Integer.parseInt(request.getParameter("location"));
			pDate=request.getParameter("pDate");
			rDate=request.getParameter("rDate");
		}catch(Exception e){
			e.printStackTrace();
		}
		LocationDAO locationDAO=new LocationDAO();
		HotelDAO hotelDAO=new HotelDAO();
		RoomDAO roomDAO=new RoomDAO();
		HotelDTO hotelDTO=null;
		RoomDTO roomDTO=null;
		LocationDTO locationDTO=null;
		
		try {
			hotelDTO=(HotelDTO)hotelDAO.selectOne(con, num);
			roomDTO=roomDAO.selectOne(con, rnum);
			locationDTO=locationDAO.selectLocation(con, location);
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
		
		if(hotelDTO!=null){
			request.setAttribute("room", roomDTO);
			request.setAttribute("location", locationDTO);
			request.setAttribute("hotel", hotelDTO);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("pDate", pDate);
			request.setAttribute("rDate", rDate);
			actionForward.setPath("./hotelBook.jsp");
		}
		actionForward.setCheck(true);
		return actionForward;
	}

}
