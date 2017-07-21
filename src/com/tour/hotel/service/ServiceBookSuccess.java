package com.tour.hotel.service;

import java.sql.Connection;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.member.MemberDTO;
import com.tour.util.DBConnector;

public class ServiceBookSuccess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		BookDAO bookDAO=new BookDAO();
		BookDTO bookDTO=new BookDTO();
		int result=0;
		Connection con=DBConnector.getConnect();
		bookDTO.setSdate(Date.valueOf(request.getParameter("sDate")));
		bookDTO.setLdate(Date.valueOf(request.getParameter("lDate")));
		bookDTO.setGoods(Integer.parseInt(request.getParameter("goods")));
		bookDTO.setPnum(Integer.parseInt(request.getParameter("pnum")));
		bookDTO.setWon(Integer.parseInt(request.getParameter("won")));
		bookDTO.setMember(((MemberDTO)(request.getSession().getAttribute("member"))).getNum());
		bookDTO.setTprice(0);
		bookDTO.setStatus("결제대기");
		bookDTO.setGnum(Integer.parseInt(request.getParameter("gnum")));
		bookDTO.setBank(request.getParameter("bank"));
		bookDTO.setDname(request.getParameter("dname"));
		
		try {
			result=bookDAO.insert(con, bookDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			actionForward.setPath("../common/messageResult.jsp");
			request.setAttribute("message", "호텔 예약이 성공적으로 완료되었습니다. 예약 내역은 My Page에서 확인하실 수 있습니다.");
			request.setAttribute("path", "./hotelList.hotel");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
