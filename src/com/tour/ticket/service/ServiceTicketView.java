package com.tour.ticket.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.goods.GoodsDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.ticket.TicketDAO;
import com.tour.ticket.TicketDTO;
import com.tour.util.DBConnector;

public class ServiceTicketView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		String name = request.getParameter("name");
		TicketDAO ticketDAO = new TicketDAO();
		TicketDTO ticketDTO = null;
		LocationDAO locationDAO = new LocationDAO();
		LocationDTO locationDTO = null;
		
		Connection con = DBConnector.getConnect();
		
		try {
			ticketDTO = (TicketDTO) ticketDAO.selectKind(con, name);
			locationDTO = locationDAO.selectLocation(con, ticketDTO.getLocation());
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
		
		if (ticketDTO!= null) {
			request.setAttribute("ticket", ticketDTO);
			request.setAttribute("location", locationDTO);
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("./ticketView.jsp");
		
		return actionForward;
	}

}
