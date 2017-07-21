package com.tour.flight.service;

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
		BookDTO bookDTO2=null;
		Connection con=DBConnector.getConnect();
		int result=0;
		
		int gnum1=Integer.parseInt(request.getParameter("gnum1"));
		int gnum2=0;
		int total1=Integer.parseInt(request.getParameter("total1"));
		int total2=0;
		String sdate=request.getParameter("sdate");
		String ldate=request.getParameter("ldate");
		
		try{
			gnum2=Integer.parseInt(request.getParameter("gnum2"));
			total2=Integer.parseInt(request.getParameter("total2"));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		if(ldate=="" || ldate==null){
			bookDTO.setLdate(null);
		}else{
			bookDTO.setLdate(Date.valueOf(ldate));
		}
		
		bookDTO.setSdate(Date.valueOf(sdate));
		bookDTO.setGoods(2);
		bookDTO.setPnum(Integer.parseInt(request.getParameter("pnum")));
		bookDTO.setWon(total1);
		bookDTO.setMember(((MemberDTO)(request.getSession().getAttribute("member"))).getNum());
		bookDTO.setTprice(0);
		bookDTO.setStatus("결제대기");
		bookDTO.setGnum(gnum1);
		bookDTO.setBank(request.getParameter("bank"));
		bookDTO.setDname(request.getParameter("dname"));
		
		if(gnum2!=0){
			bookDTO2=new BookDTO();
			bookDTO2.setSdate(Date.valueOf(sdate));
			if(ldate=="" || ldate==null){
				bookDTO2.setLdate(null);
			}else{
				bookDTO2.setLdate(Date.valueOf(ldate));
			}
			bookDTO2.setGoods(2);
			bookDTO2.setPnum(Integer.parseInt(request.getParameter("pnum")));
			bookDTO2.setWon(total2);
			bookDTO2.setMember(((MemberDTO)(request.getSession().getAttribute("member"))).getNum());
			bookDTO2.setTprice(0);
			bookDTO2.setStatus("결제대기");
			bookDTO2.setGnum(gnum2);
			bookDTO2.setBank(request.getParameter("bank"));
			bookDTO2.setDname(request.getParameter("dname"));
		}
		
		
		try {
			result=bookDAO.insert(con, bookDTO);
			if(gnum2!=0){
				result=bookDAO.insert(con, bookDTO2);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			actionForward.setPath("../common/messageResult.jsp");
			request.setAttribute("message", "항공권 예매가 성공적으로 완료되었습니다. 예약 내역은 My Page에서 확인하실 수 있습니다.");
			request.setAttribute("path", "./mainFlight.jsp");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
