package com.tour.hotel.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.file.FileDTO;
import com.tour.hotel.HotelDAO;
import com.tour.hotel.HotelDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.room.RoomDAO;
import com.tour.room.RoomDTO;
import com.tour.util.DBConnector;

public class ServiceView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		HotelDAO hotelDAO=new HotelDAO();
		FileDAO fileDAO=new FileDAO();
		RoomDAO roomDAO=new RoomDAO();
		LocationDAO locationDAO=new LocationDAO();
		LocationDTO locationDTO=null;
		List<LocationDTO> ar3=null;
		List<LocationDTO> ar4=null;
		List<FileDTO> ar=null;
		List<RoomDTO> ar2=null;
		
		HotelDTO hotelDTO=null;
		Connection con=DBConnector.getConnect();
		int num=0;
		int pnum=0;
		int location=0;
		try{
			num=Integer.parseInt(request.getParameter("num"));
			location=Integer.parseInt(request.getParameter("location"));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		try {
			hotelDTO=(HotelDTO)hotelDAO.selectOne(con, num);
			pnum=hotelDAO.selectFileNum(con, num);
			ar=fileDAO.selectFile(con, pnum);
			ar2=roomDAO.selectList(con, num);
			locationDTO=locationDAO.selectLocation(con, location);
			ar3=locationDAO.selectJapanList(con);
			ar4=locationDAO.selectGroupNation(con);
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
		if(hotelDTO!=null){
			request.setAttribute("hotel", hotelDTO);
			request.setAttribute("location", locationDTO);
			request.setAttribute("fileList", ar);
			request.setAttribute("japanList", ar3);
			request.setAttribute("foreignList", ar4);
			request.setAttribute("roomList", ar2);
			actionForward.setPath("hotelView.jsp");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
