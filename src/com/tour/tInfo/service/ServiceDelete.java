package com.tour.tInfo.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.tInfo.TInfoDAO;
import com.tour.util.DBConnector;

public class ServiceDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		TInfoDAO tInfoDAO=new TInfoDAO();
		Connection con=DBConnector.getConnect();
		int num=0;
		try{
			num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e){
			e.printStackTrace();
		}
		try {
			num=tInfoDAO.delete(con, num);
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
		if(num>0){
			request.setAttribute("path", "./tInfoList.tInfo");
		}else{
			request.setAttribute("path", "../error/serverError.jsp");
		}
		actionForward.setCheck(true);
		actionForward.setPath("../common/commonResult.jsp");
		
		return actionForward;
	}
	
}
