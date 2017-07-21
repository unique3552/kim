package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.ticket.TicketDAO;
import com.tour.ticket.TicketDTO;
import com.tour.util.DBConnector;

public class ServiceTicketBookView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num"));
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		PointDAO pointDAO = new PointDAO();
		int point = 0;
		
		BookDAO bookDAO = new BookDAO();
		BookDTO bookDTO = null;
		
		Connection con = DBConnector.getConnect();
		
		try {
			bookDTO = bookDAO.selectOne(con, num);
			point = pointDAO.selectOne(con, memberDTO.getNum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		TicketDAO ticketDAO = new TicketDAO();
		TicketDTO ticketDTO = null;
		
		try {
			ticketDTO = (TicketDTO) ticketDAO.selectOne(con, bookDTO.getGnum());
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
		
		request.setAttribute("ticket", ticketDTO);
		request.setAttribute("book", bookDTO);
		request.setAttribute("point", point);
		actionForward.setCheck(true);
		actionForward.setPath("./memberTicketBookView.jsp");
		
		return actionForward;
	}

}
