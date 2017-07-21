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
import com.tour.hotel.HotelDAO;
import com.tour.hotel.HotelDTO;
import com.tour.member.MemberDTO;
import com.tour.room.RoomDAO;
import com.tour.room.RoomDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceHotelBookList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		BookDAO bookDAO=new BookDAO();
		Connection con=DBConnector.getConnect();
		int curPage=1;
		List<BookDTO> ar=null;
		List<RoomDTO> room=new ArrayList<>();
		List<HotelDTO> hotel=new ArrayList<>();
		RoomDTO roomDTO=null;
		RoomDAO roomDAO=new RoomDAO();
		HotelDAO hotelDAO=new HotelDAO();
		HotelDTO hotelDTO=null;
		int member=(((MemberDTO)request.getSession().getAttribute("member")).getNum());
		
		PageResult pr=null;
		
		try{
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		PageMaker pm=new PageMaker(curPage);
		RowMaker rowMaker=pm.getRowMaker();
		try {
			ar=bookDAO.selectList(con, rowMaker, 6 , member);
			pr=pm.paging(bookDAO.getTotalCount(con,6 , member));
			
			for (int i=0; i<ar.size(); i++) {
				int gnum = ar.get(i).getGnum();
				roomDTO=roomDAO.selectOne(con, gnum);
				hotelDTO=(HotelDTO)hotelDAO.selectOne(con, roomDAO.selectHnum(con, gnum));
				room.add(roomDTO);
				hotel.add(hotelDTO);
			}
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
		if(ar!=null){
			actionForward.setPath("/user/member/memberHotelBookList.jsp");
			request.setAttribute("book", ar);
			request.setAttribute("curPage", curPage);
			request.setAttribute("pageResult", pr);
			request.setAttribute("hotel", hotel);
			request.setAttribute("room", room);
		}
		
		return actionForward;
	}

}
