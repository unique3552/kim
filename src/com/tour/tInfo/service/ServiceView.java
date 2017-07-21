package com.tour.tInfo.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.tInfo.TInfoDAO;
import com.tour.tInfo.TInfoDTO;
import com.tour.util.DBConnector;

public class ServiceView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		TInfoDTO tInfoDTO=null;
		int num=0;
		try{
			num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e){
			e.printStackTrace();
		}
		TInfoDAO tInfoDAO=new TInfoDAO();
		try {
			tInfoDTO=tInfoDAO.selectOne(con, num);
		} catch (SQLException e) {
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
		
		request.setAttribute("tInfo", tInfoDTO);
		actionForward.setPath("./tInfoView.jsp");
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
