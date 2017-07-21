package com.tour.flight.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.flight.FlightDAO;
import com.tour.flight.FlightDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.util.DBConnector;

public class ServiceBook implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		String sdate=request.getParameter("sdate");
		String ldate=request.getParameter("ldate");
		int dloc=Integer.parseInt(request.getParameter("dloc"));
		int aloc=Integer.parseInt(request.getParameter("aloc"));
		int won=Integer.parseInt(request.getParameter("won"));
		int dTotal=Integer.parseInt(request.getParameter("dTotal"));
		int aTotal=Integer.parseInt(request.getParameter("aTotal"));
		int dnum=Integer.parseInt(request.getParameter("dnum"));
		int anum=0;
		try{
			anum=Integer.parseInt(request.getParameter("anum"));	
		}catch(Exception e){
			e.printStackTrace();
		}
		int pnum=Integer.parseInt(request.getParameter("pnum"));

		FlightDTO departureDTO=null;
		FlightDTO arrivalDTO=null;
		FlightDAO flightDAO=new FlightDAO();
		LocationDAO locationDAO=new LocationDAO();
		LocationDTO dLocation=null;
		LocationDTO aLocation=null;
		try {
			departureDTO=(FlightDTO)flightDAO.selectOne(con, dnum);
			if(anum!=0){
				arrivalDTO=(FlightDTO)flightDAO.selectOne(con, anum);
			}
			dLocation=locationDAO.selectLocation(con, dloc);
			aLocation=locationDAO.selectLocation(con, aloc);
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
		
		if(departureDTO!=null){
			actionForward.setCheck(true);
			actionForward.setPath("flightBook.jsp");
			request.setAttribute("pnum", pnum);
			request.setAttribute("dFlight", departureDTO);
			request.setAttribute("aFlight", arrivalDTO);
			request.setAttribute("won", won);
			request.setAttribute("dTotal", dTotal);
			request.setAttribute("aTotal", aTotal);
			request.setAttribute("sdate", sdate);
			request.setAttribute("ldate", ldate);
			request.setAttribute("dLocation", dLocation);
			request.setAttribute("aLocation", aLocation);
		}
		
		return actionForward;
	}

}
