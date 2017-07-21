package com.tour.tPackage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.admin.AdminDAO;
import com.tour.admin.AdminDTO;
import com.tour.file.FileDAO;
import com.tour.file.FileDTO;
import com.tour.flight.FlightDAO;
import com.tour.flight.FlightDTO;
import com.tour.hotel.HotelDAO;
import com.tour.hotel.HotelDTO;
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
import com.tour.util.DBConnector;

public class ServiceView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FlightDTO departureDTO=null;
		FlightDTO arrivalDTO=null;
		HotelDTO hotelDTO=null;
		HotelDAO hotelDAO=new HotelDAO();
		FlightDAO flightDAO=new FlightDAO();
		TPackageDTO tPackageDTO=null;
		TPackageDAO tPackageDAO=new TPackageDAO();
		List<FileDTO> ar=null;
		FileDAO fileDAO=new FileDAO();
		AdminDTO adminDTO=null;
		AdminDAO adminDAO =new AdminDAO();
		Connection con=DBConnector.getConnect();
		
		int num=0;
		int pnum=0;
		
		try{
			num=Integer.parseInt(request.getParameter("num"));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		try {
			tPackageDTO=(TPackageDTO)tPackageDAO.selectOne(con, num);
			hotelDTO=(HotelDTO)hotelDAO.selectOne(con, tPackageDTO.getHnum());
			departureDTO=(FlightDTO)flightDAO.selectOne(con, tPackageDTO.getDfnum());
			arrivalDTO=(FlightDTO)flightDAO.selectOne(con, tPackageDTO.getAfnum());
			adminDTO=adminDAO.selectOne(con, tPackageDTO.getAdmin());
			pnum=tPackageDAO.selectFileNum(con, num);
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
		
		actionForward.setCheck(true);
		if(tPackageDTO!=null){
			actionForward.setPath("./tPackageView.jsp");
			request.setAttribute("hotel", hotelDTO);
			request.setAttribute("dFlight", departureDTO);
			request.setAttribute("aFlight", arrivalDTO);
			request.setAttribute("fileList", ar);
			request.setAttribute("admin", adminDTO);
			request.setAttribute("tPackage", tPackageDTO);
		}
		
		return actionForward;
	}

}
