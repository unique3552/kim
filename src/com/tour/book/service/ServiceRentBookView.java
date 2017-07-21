package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.rentCar.RentCarDAO;
import com.tour.rentCar.RentCarDTO;
import com.tour.util.DBConnector;

public class ServiceRentBookView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		int num = Integer.parseInt(request.getParameter("num"));	//book num
		BookDAO bookDAO = new BookDAO();
		BookDTO bookDTO = null;
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		PointDAO pointDAO = new PointDAO();
		int point = 0;
		
		Connection con = DBConnector.getConnect();
		
		try {
			bookDTO = bookDAO.selectOne(con, num);
			point = pointDAO.selectOne(con, memberDTO.getNum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RentCarDAO rentCarDAO = new RentCarDAO();
		RentCarDTO rentCarDTO = null;
		LocationDAO locationDAO = new LocationDAO();
		LocationDTO locationDTO = null;
		
		try {
			rentCarDTO = (RentCarDTO) rentCarDAO.selectOne(con, bookDTO.getGnum());
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
		
		if (locationDTO != null) {
			request.setAttribute("location", locationDTO);
			request.setAttribute("rentCar", rentCarDTO);
			request.setAttribute("book", bookDTO);
			request.setAttribute("point", point);
			request.setAttribute("member", memberDTO);
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("./memberRentBookView.jsp");
		
		return actionForward;
	}

}
