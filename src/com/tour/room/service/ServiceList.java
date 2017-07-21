package com.tour.room.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.room.RoomDAO;
import com.tour.room.RoomDTO;
import com.tour.util.DBConnector;

public class ServiceList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String pDate=request.getParameter("pDate");
		String rDate=request.getParameter("rDate");
		int hnum=0;
		try{
			hnum=Integer.parseInt(request.getParameter("hnum"));
		}catch(Exception e){
			e.printStackTrace();
		}
		Connection con=DBConnector.getConnect();
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		long diff = 0;
		
		try {
			Date startDate = dateFormat.parse(pDate);
			Date endDate = dateFormat.parse(rDate);
			
			diff = ((endDate.getTime() - startDate.getTime()) / (24*60*60*1000)) + 1;
		} catch (ParseException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		
		RoomDAO roomDAO=new RoomDAO();
		List<RoomDTO> ar=null;
		
		try {
			ar=roomDAO.selectList(con,hnum);
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
		request.setAttribute("roomList", ar);
		request.setAttribute("diff", (int)diff);
		actionForward.setPath("./roomResult.jsp");
		
		return actionForward;
	}

}
