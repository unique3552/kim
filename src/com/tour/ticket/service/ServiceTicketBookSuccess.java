package com.tour.ticket.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.member.MemberDTO;
import com.tour.ticket.TicketDAO;
import com.tour.ticket.TicketDTO;
import com.tour.util.DBConnector;

public class ServiceTicketBookSuccess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num")); //티켓 넘버
		int pnum = Integer.parseInt(request.getParameter("pnum")); // 티켓 개수
		int won = Integer.parseInt(request.getParameter("won"));
		String method = request.getParameter("method");
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		Date sdate = Date.valueOf(request.getParameter("sdate"));
		
		TicketDAO ticketDAO = new TicketDAO();
		TicketDTO ticketDTO = null;
		
		Connection con = DBConnector.getConnect();
		
		try {
			ticketDTO = (TicketDTO) ticketDAO.selectOne(con, num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		BookDAO bookDAO = new BookDAO();
		BookDTO bookDTO = new BookDTO();
		
		bookDTO.setGoods(4); // 티켓
		bookDTO.setPnum(pnum);
		bookDTO.setMember(memberDTO.getNum());
		bookDTO.setGnum(num);
		bookDTO.setSdate(sdate);
		bookDTO.setStatus("결제대기");
		bookDTO.setWon(won);
		bookDTO.setPmethod(method);
		
		int result = 0;
		
		try {
			result = bookDAO.insert(con, bookDTO);
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
		
		if (result > 0) {
			request.setAttribute("ticket", ticketDTO);
			request.setAttribute("pnum", pnum);
			request.setAttribute("won", won);
			request.setAttribute("sdate", sdate);
			request.setAttribute("pmethod", method);
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("./ticketBookSuccess.jsp");
		
		
		return actionForward;
	}

}
