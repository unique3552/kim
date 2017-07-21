package com.tour.flight.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.flight.FlightDAO;
import com.tour.flight.FlightDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.RowMaker;

public class ServiceList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		int curPage=1;
		String ddate=request.getParameter("ddate");
		String adate="";
		int way=Integer.parseInt(request.getParameter("way"));	// 왕복/편도 구분
		
		int dcity=Integer.parseInt(request.getParameter("dcity"));
		int acity=Integer.parseInt(request.getParameter("acity"));
		
		int pnum=Integer.parseInt(request.getParameter("pnum"));
		
		String company="";
		try{
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			adate=request.getParameter("adate");
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			company=request.getParameter("company");
		}catch(Exception e){
			e.printStackTrace();
		}
		if(company==""||company==null){
			company="%";
		}
		
		FlightDAO flightDAO=new FlightDAO();
		Connection con=DBConnector.getConnect();
		LocationDAO locationDAO=new LocationDAO();
		LocationDTO departureDTO=null;
		LocationDTO arrivalDTO=null;
		try {
			departureDTO=locationDAO.selectLocation(con, dcity);
			arrivalDTO=locationDAO.selectLocation(con, acity);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		List<FlightDTO> ar1=null;
		List<FlightDTO> ar2=null;
		PageMaker pm=new PageMaker(curPage);
		RowMaker rowMaker=pm.getRowMaker();
		try {
			if(way==0){	// 0이면 왕복
				ar1=flightDAO.selectDepartureList(con, acity, dcity, company, rowMaker);
				ar2=flightDAO.selectArrivalList(con, acity, dcity, company, rowMaker);
			}else if(way==1){	// 1이면 편도
				ar1=flightDAO.selectDepartureList(con, acity, dcity, company, rowMaker);
			}
			
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
		actionForward.setPath("./flightList.jsp");
		
		request.setAttribute("ddate", ddate);
		request.setAttribute("adate", adate);
		request.setAttribute("pnum", pnum);
		request.setAttribute("dLocation", departureDTO);
		request.setAttribute("aLocation", arrivalDTO);
		request.setAttribute("curPage", curPage);
		request.setAttribute("dList", ar1);
		request.setAttribute("aList", ar2);
		
		
		return actionForward;
	}

}
