package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.hotel.HotelDAO;
import com.tour.hotel.HotelDTO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.room.RoomDAO;
import com.tour.room.RoomDTO;
import com.tour.util.DBConnector;

public class ServiceHotelBookView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		int num=0;
		try{
			num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e){
			e.printStackTrace();
		}
		Connection con=DBConnector.getConnect();
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		PointDAO pointDAO = new PointDAO();
		int point = 0;
		BookDAO bookDAO=new BookDAO();
		BookDTO bookDTO=null;
		HotelDAO hotelDAO=new HotelDAO();
		HotelDTO hotelDTO=null;
		RoomDAO roomDAO=new RoomDAO();
		RoomDTO roomDTO=null;
		
		try {
			bookDTO=bookDAO.selectOne(con, num);
			roomDTO=roomDAO.selectOne(con, bookDTO.getGnum());
			hotelDTO=(HotelDTO)hotelDAO.selectOne(con, roomDAO.selectHnum(con, roomDTO.getNum()));
			point = pointDAO.selectOne(con, memberDTO.getNum());
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
		
		actionForward.setCheck(true);
		if(bookDTO!=null){
			request.setAttribute("hotel", hotelDTO);
			request.setAttribute("room", roomDTO);
			request.setAttribute("book", bookDTO);
			request.setAttribute("point", point);
			actionForward.setPath("./memberHotelBookView.jsp");
		}
		return actionForward;
	}

}
