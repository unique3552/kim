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
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.member.MemberDTO;
import com.tour.rentCar.RentCarDAO;
import com.tour.rentCar.RentCarDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceRentBookList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		BookDAO bookDAO = new BookDAO();
		List<BookDTO> ar = null;
		int curPage = 1;
		
		Connection con = DBConnector.getConnect();
		try{
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		PageResult pr=null;
		int member = (((MemberDTO)request.getSession().getAttribute("member")).getNum());
		try {			
			ar = bookDAO.selectList(con, rowMaker, 3, member); //rentCar 굿즈 번호 3
			pr = pageMaker.paging(bookDAO.getTotalCount(con, 3, member));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		List<String> rentCar = new ArrayList<>();
		List<String> location = new ArrayList<>();
		
		RentCarDAO rentCarDAO = new RentCarDAO();
		RentCarDTO rentCarDTO = null;
		LocationDAO locationDAO = new LocationDAO();
		LocationDTO locationDTO = null;
		
		for (int i=0; i<ar.size(); i++) {
			int gnum = ar.get(i).getGnum();

			try {
				rentCarDTO = (RentCarDTO) rentCarDAO.selectOne(con, gnum);
				locationDTO = locationDAO.selectLocation(con, rentCarDTO.getLocation());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			rentCar.add(rentCarDTO.getName());
			location.add(locationDTO.getRegion());
		}		
		
		if (ar != null) {
			request.setAttribute("book", ar);
			request.setAttribute("curPage", curPage);
			request.setAttribute("rentCar", rentCar);
			request.setAttribute("location", location);
			request.setAttribute("pageResult", pr);
		}

		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		actionForward.setCheck(true);
		actionForward.setPath("/user/member/memberRentBookList.jsp");
		
		
		
		return actionForward;
	}

}
