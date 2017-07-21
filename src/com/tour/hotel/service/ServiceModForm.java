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
import com.tour.util.DBConnector;

public class ServiceModForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		List<FileDTO> ar=null;
		FileDAO fileDAO=new FileDAO();
		int num=0;
		int pnum=0;
		try{
			num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e){
			e.printStackTrace();
		}
		HotelDAO hotelDAO=new HotelDAO();
		HotelDTO hotelDTO=null;
		try {
			hotelDTO=(HotelDTO)hotelDAO.selectOne(con, num);
			pnum=hotelDAO.selectFileNum(con, num);
			ar=fileDAO.selectFile(con, pnum);
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
			actionForward.setCheck(true);
			request.setAttribute("hotel", hotelDTO);
			request.setAttribute("fileList", ar);
			actionForward.setPath("./hotelModForm.jsp");	
		}
		
		return actionForward;
	}

}
