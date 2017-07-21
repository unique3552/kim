package com.tour.ticket.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.ticket.TicketDAO;
import com.tour.ticket.TicketDTO;
import com.tour.util.DBConnector;

public class ServiceTicketChoice implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		TicketDAO ticketDAO = new TicketDAO();
		TicketDTO ticketDTO = null;
		Connection con = DBConnector.getConnect();
		
		try {
			ticketDTO = (TicketDTO) ticketDAO.selectOne(con, num);
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
		
		request.setAttribute("ticketDTO", ticketDTO);
		actionForward.setCheck(true);
		actionForward.setPath("../common/ticketResult.jsp");
		
		return actionForward;
	}

}
