package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.util.DBConnector;

public class ServiceBookCancel implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int result = 0;
		BookDAO bookDAO = new BookDAO();
		BookDTO bookDTO = null;
		
		Connection con = DBConnector.getConnect();
		
		try {
			result = bookDAO.update(con, "취소완료", 0, num);
			bookDTO = bookDAO.selectOne(con, num);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int goods = 0;
		
		try {
			goods = bookDAO.selectGoods(con, num);
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
		
		String goods2 = null;
		
		if (goods == 1) {
			goods2 = "H";
		} else if (goods == 2) {
			goods2 = "F";
		} else if (goods == 3) {
			goods2 = "R";
		} else if (goods == 4) {
			goods2 = "T";
		} else if (goods == 5) {
			goods2 = "P";
		}		
		
		if (result > 0) {
			request.setAttribute("book", bookDTO);
		}
		
		request.setAttribute("goods", goods2);
		request.setAttribute("gnum", goods);
		actionForward.setCheck(true);
		actionForward.setPath("./memberBookCancel.jsp");
		
		return actionForward;
	}

}
