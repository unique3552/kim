package com.tour.book.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.SQLException;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.point.PointDTO;
import com.tour.util.DBConnector;

public class ServicePayCancel implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int num = Integer.parseInt(request.getParameter("num"));
		int usePoint = 0;
		int result = 0;
		BookDAO bookDAO = new BookDAO();
		BookDTO bookDTO = null;

		Connection con = DBConnector.getConnect();
		try {
			bookDTO = bookDAO.selectOne(con, num);
			result = bookDAO.update(con, "��ҿϷ�", -(bookDTO.getUsepoint()), num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int goods = 0;
		String goods2 = null;
		try {
			bookDTO = bookDAO.selectOne(con, num);
			goods = bookDAO.selectGoods(con, num);	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
		
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		usePoint = bookDTO.getUsepoint();
		PointDAO pointDAO = new PointDAO();
		PointDTO pointDTO = new PointDTO();
		int curPoint = 0;
		int tPoint = 0;
		try {
			curPoint = pointDAO.selectOne(con, memberDTO.getNum());
			tPoint = pointDAO.selectTPoint(con, memberDTO.getNum());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		pointDTO.setCategory("사용취소");
		pointDTO.setContents("결제취소");
		pointDTO.setUsePoint(bookDTO.getUsepoint());
		pointDTO.setMnum(memberDTO.getNum());
		pointDTO.setCurPoint(curPoint);
		pointDTO.settPoint(tPoint);
		
		try {
			result = pointDAO.insert(con, pointDTO);
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
		
		if (result > 0) {
			request.setAttribute("book", bookDTO);
			request.setAttribute("goods", goods2);
		}
		actionForward.setCheck(true);
		actionForward.setPath("./memberPayCancel.jsp");
		
		
		return actionForward;
	}

}
