package com.tour.tPackage.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.flight.FlightDAO;
import com.tour.flight.FlightDTO;
import com.tour.hotel.HotelDAO;
import com.tour.hotel.HotelDTO;
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
import com.tour.util.DBConnector;

public class ServiceBook implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		int num=0;
		String sDate="";
		String lDate="";
		int pnum=0;
		try{
			num=Integer.parseInt(request.getParameter("num"));
			sDate=request.getParameter("sDate");
			lDate=request.getParameter("lDate");
			pnum=Integer.parseInt(request.getParameter("pnum"));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		TPackageDAO tPackageDAO=new TPackageDAO();
		TPackageDTO tPackageDTO=null;
		FlightDTO departureDTO=null;
		FlightDTO arrivalDTO=null;
		FlightDAO flightDAO=new FlightDAO();
		HotelDAO hotelDAO=new HotelDAO();
		HotelDTO hotelDTO=null;
		
		try {
			tPackageDTO=(TPackageDTO)tPackageDAO.selectOne(con, num);
			departureDTO=(FlightDTO)flightDAO.selectOne(con, tPackageDTO.getDfnum());
			arrivalDTO=(FlightDTO)flightDAO.selectOne(con, tPackageDTO.getAfnum());
			hotelDTO=(HotelDTO)hotelDAO.selectOne(con, tPackageDTO.getHnum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if(tPackageDTO!=null){
			actionForward.setPath("./tPackageBook.jsp");
			request.setAttribute("tPackage", tPackageDTO);
			request.setAttribute("hotel", hotelDTO);
			request.setAttribute("dFlight", departureDTO);
			request.setAttribute("aFlight", arrivalDTO);
			request.setAttribute("sDate", sDate);
			request.setAttribute("lDate", lDate);
			request.setAttribute("pnum", pnum);
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
