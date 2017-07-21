package com.tour.rentCar.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.goods.GoodsDTO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.rentCar.RentCarDAO;
import com.tour.rentCar.RentCarDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.RowMaker;

public class ServiceRentListTable implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		RentCarDAO rentCarDAO = new RentCarDAO();
		String kind = request.getParameter("kind");
		String engRegion = request.getParameter("region");
		
		String pDate = request.getParameter("pDate");
		String rDate = request.getParameter("rDate");		
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
		
		
		int location = 0;
		LocationDAO locationDAO = new LocationDAO();
		LocationDTO locationDTO = null;
		Connection con = DBConnector.getConnect();
		
		try {
			location = locationDAO.selectRegionNum(con, engRegion);
			locationDTO = locationDAO.selectLocation(con, location);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}		
		
		int curPage = 1;
		PageMaker pageMaker = new PageMaker(curPage);
		RowMaker rowMaker = pageMaker.getRowMaker();
		List<GoodsDTO> ar = null;
		
		
		try {
			ar = rentCarDAO.selectList(con, kind, location, rowMaker);
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
		
		if (ar != null) {			
			ArrayList<Integer> totalPrice = new ArrayList<>();			
			for (int i=0; i<ar.size(); i++) {
				int tp = 0;
				RentCarDTO r = (RentCarDTO) ar.get(i);
				tp = (int) (r.getPrice() * diff);				
				totalPrice.add(tp);
			}
			
			if (locationDTO != null) {
				request.setAttribute("unit", locationDTO.getUnit());
			}
			
			request.setAttribute("rentCarList", ar);
			request.setAttribute("totalPrice", totalPrice);
			request.setAttribute("diff", (int)diff);
			request.setAttribute("pDate", pDate);
			request.setAttribute("rDate", rDate);
		}
		
		actionForward.setCheck(true);
		actionForward.setPath("../common/rentCarListResult.jsp");
		
		
		return actionForward;
	}

}
