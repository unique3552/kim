package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.flight.FlightDAO;
import com.tour.flight.FlightDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.util.DBConnector;

public class ServiceFlightBookView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		int num=0;
		try{
			num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e){
			e.printStackTrace();
		}
		Connection con=DBConnector.getConnect();
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		PointDAO pointDAO = new PointDAO();
		int point = 0;
		BookDAO bookDAO=new BookDAO();
		BookDTO bookDTO=null;
		FlightDTO flightDTO=null;
		FlightDAO flightDAO=new FlightDAO();
		LocationDAO locationDAO=new LocationDAO();
		LocationDTO departureDTO=null;
		LocationDTO arrivalDTO=null;
		
		try {
			bookDTO=bookDAO.selectOne(con, num);
			flightDTO=(FlightDTO)flightDAO.selectOne(con, bookDTO.getGnum());
			point = pointDAO.selectOne(con, memberDTO.getNum());
			departureDTO=locationDAO.selectLocation(con, flightDTO.getDcity());
			arrivalDTO=locationDAO.selectLocation(con, flightDTO.getAcity());
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
		if(bookDTO!=null){
			request.setAttribute("flight", flightDTO);
			request.setAttribute("dLocation", departureDTO);
			request.setAttribute("aLocation", arrivalDTO);
			request.setAttribute("book", bookDTO);
			request.setAttribute("point", point);
			actionForward.setPath("./memberFlightBookView.jsp");
		}
		
		return actionForward;
	}

}
