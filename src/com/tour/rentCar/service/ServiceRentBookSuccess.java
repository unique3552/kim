package com.tour.rentCar.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.glass.ui.Pixels.Format;
import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.member.MemberDTO;
import com.tour.rentCar.RentCarDAO;
import com.tour.rentCar.RentCarDTO;
import com.tour.util.DBConnector;

public class ServiceRentBookSuccess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int diff = Integer.parseInt(request.getParameter("diff"));
		int num = Integer.parseInt(request.getParameter("rentCarNum"));
		
		RentCarDAO rentCarDAO = new RentCarDAO();
		
		Connection con = DBConnector.getConnect();
		RentCarDTO rentCarDTO = null;
		
		try {
			rentCarDTO = (RentCarDTO) rentCarDAO.selectOne(con, num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		LocationDAO locationDAO = new LocationDAO();
		LocationDTO locationDTO = null;
		
		try {
			locationDTO = locationDAO.selectLocation(con, rentCarDTO.getLocation());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		Date sdate = Date.valueOf(request.getParameter("pDate"));
		Date ldate = Date.valueOf(request.getParameter("rDate"));
		String bank = request.getParameter("bank");
		String dname = request.getParameter("dname");
		int won = Integer.parseInt(request.getParameter("won"));
		
		BookDTO bookDTO = new BookDTO();
		bookDTO.setGoods(3);
		bookDTO.setPnum(1);		
		bookDTO.setTprice(rentCarDTO.getPrice() * diff);
		bookDTO.setMember(memberDTO.getNum());
		bookDTO.setGnum(num);
		bookDTO.setSdate(sdate);
		bookDTO.setLdate(ldate);
		bookDTO.setStatus("결제대기");
		bookDTO.setBank(bank);
		bookDTO.setDname(dname);
		bookDTO.setWon(won);
		
		BookDAO bookDAO = new BookDAO();
		int result = 0;
		try {
			result = bookDAO.insert(con, bookDTO);
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
		
		/*Date today = null;
		
		try {
			today = bookDAO.selectDate(con, bookDTO.getNum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		Calendar cal = Calendar.getInstance();
		*/
		
		if (result > 0) {
			request.setAttribute("book", bookDTO);
			request.setAttribute("rentCar", rentCarDTO);
			request.setAttribute("location", locationDTO);
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("./rentCarBookSuccess.jsp");
		
		return actionForward;
	}

}
