package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.member.MemberDTO;
import com.tour.rentCar.RentCarDTO;
import com.tour.ticket.TicketDAO;
import com.tour.ticket.TicketDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceTicketBookList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		BookDAO bookDAO = new BookDAO();
		List<BookDTO> ar = null;
		int curPage = 1;
		
		Connection con = DBConnector.getConnect();
		
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pageResult = null;
		
		MemberDTO member = (MemberDTO) request.getSession().getAttribute("member");
		try {
			ar = bookDAO.selectList(con, rowMaker, 4, member.getNum());
			pageResult = pageMaker.paging(bookDAO.getTotalCount(con, 4, member.getNum()));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		TicketDTO ticketDTO = null;
		TicketDAO ticketDAO = new TicketDAO();
		List<TicketDTO> ticket = new ArrayList<>();
		
		for (int i=0; i<ar.size(); i++) {
			int gnum = ar.get(i).getGnum();

			try {
				ticketDTO = (TicketDTO) ticketDAO.selectOne(con, gnum);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ticket.add(ticketDTO);
		}
		
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if (ar != null) {
			request.setAttribute("ticket", ticket);
			request.setAttribute("book", ar);
			request.setAttribute("curPage", curPage);
			request.setAttribute("pageResult", pageResult);
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("/user/member/memberTicketBookList.jsp");
		
		return actionForward;
	}

}
