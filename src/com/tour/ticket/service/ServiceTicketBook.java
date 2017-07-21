package com.tour.ticket.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDTO;
import com.tour.ticket.TicketDAO;
import com.tour.ticket.TicketDTO;
import com.tour.util.DBConnector;

public class ServiceTicketBook implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int pnum = Integer.parseInt(request.getParameter("pnum"));
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println("pnum : " + pnum);
		System.out.println("num : " + num);
		
		TicketDAO ticketDAO = new TicketDAO();
		TicketDTO ticketDTO = null;
		
		Connection con = DBConnector.getConnect();
		
		try {
			ticketDTO = (TicketDTO) ticketDAO .selectOne(con, num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		BookDTO bookDTO = new BookDTO();
		
		bookDTO.setPnum(pnum);
		bookDTO.setGnum(num);
		bookDTO.setWon(pnum * ticketDTO.getPrice());
		
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("book", bookDTO);
		request.setAttribute("ticket", ticketDTO);
		actionForward.setCheck(true);
		actionForward.setPath("./ticketBook.jsp");
		
		return actionForward;
	}

}
