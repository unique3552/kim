package com.tour.point.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.member.MemberDAO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.point.PointDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.RowMaker;

public class ServicePoint implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		int mnum = 0;
		
		Connection con = DBConnector.getConnect();
		
		try {
			mnum = memberDAO.selectOne(con, memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		PointDAO pointDAO = new PointDAO();
		List<PointDTO> ar = null;
		int curPoint = 0;
		int curPage = 1;
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		
		try {
			ar = pointDAO.selectList(con, mnum, rowMaker);
			curPoint = pointDAO.selectOne(con, mnum); // 가용 포인트
		} catch (Exception e) {
			ar = null;
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		if (ar != null) {
			request.getSession().setAttribute("curPoint", curPoint);
			request.getSession().setAttribute("point", ar);
			actionForward.setPath("./memberPoint.jsp");
		} else {
			actionForward.setPath("../../index.jsp");
		}
		
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
