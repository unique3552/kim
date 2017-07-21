package com.tour.hotel.service;




import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.room.RoomDAO;
import com.tour.room.RoomDTO;
import com.tour.util.DBConnector;

public class ServiceBookConfirm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		String sDate=request.getParameter("sDate");
		String lDate=request.getParameter("lDate");
		int won=Integer.parseInt(request.getParameter("won"));
		int gnum=Integer.parseInt(request.getParameter("gnum"));
		RoomDTO roomDTO=null;
		RoomDAO roomDAO=new RoomDAO();
		Connection con=DBConnector.getConnect();
		try {
			roomDTO=roomDAO.selectOne(con, gnum);
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
		String require=request.getParameter("require");
		String name=request.getParameter("name");
		String engSeong=request.getParameter("engSeong");
		String gender=request.getParameter("gender");
		String engName=request.getParameter("engName");
		String hname=request.getParameter("hname");
		
		actionForward.setCheck(true);
		request.setAttribute("sDate", sDate);
		request.setAttribute("lDate", lDate);
		request.setAttribute("won", won);
		request.setAttribute("room", roomDTO);
		request.setAttribute("engSeong", engSeong);
		request.setAttribute("require", require);
		request.setAttribute("name", name);
		request.setAttribute("engName", engName);
		request.setAttribute("gender", gender);
		request.setAttribute("hname", hname);
		
		actionForward.setPath("./hotelBookConfirm.jsp");
		return actionForward;
	}

}
