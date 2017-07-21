package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
import com.tour.util.DBConnector;

public class ServiceTPackageBookView implements Action {

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
		
		TPackageDAO tPackageDAO=new TPackageDAO();
		TPackageDTO tPackageDTO=null;
		
		try {
			bookDTO=bookDAO.selectOne(con, num);
			tPackageDTO=(TPackageDTO)tPackageDAO.selectOne(con, bookDTO.getGnum());
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
		
		if(bookDTO!=null){
			actionForward.setPath("./memberTPackageBookView.jsp");
			request.setAttribute("tPackage", tPackageDTO);
			request.setAttribute("book", bookDTO);
			request.setAttribute("point", point);
		}
		actionForward.setCheck(true);
		return actionForward;
	}

}
