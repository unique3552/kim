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
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceTicketList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int location = Integer.parseInt(request.getParameter("location"));
		int curPage = 1;
		
		try {
			curPage = Integer.parseInt(request.getParameter("curPage"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		PageMaker pageMaker = new PageMaker(curPage, 9);
		RowMaker rowMaker = pageMaker.getRowMaker();	
		PageResult pageResult = null;
		LocationDTO locationDTO = null;
		LocationDAO locationDAO = new LocationDAO();
		
		TicketDAO ticketDAO = new TicketDAO();
		List<GoodsDTO> ar = null;
		
		Connection con = DBConnector.getConnect();
		
		try {
			ar = ticketDAO.selectListName(con, location, rowMaker);
			locationDTO = locationDAO.selectLocation(con, location);	
			pageResult = pageMaker.paging(ticketDAO.getTotalCount(con, location));
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
		
		System.out.println("pageResult : " + pageResult.getStartNum());
		
		if (ar != null) {
			request.setAttribute("ticketList", ar);
			request.setAttribute("location", locationDTO);
			request.setAttribute("pageResult", pageResult);
			
		} else {
			request.setAttribute("message", "해당 지역의 판매 상품이 존재하지 않습니다.");
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("./ticketList.jsp");
		
		return actionForward;
	}	
}
