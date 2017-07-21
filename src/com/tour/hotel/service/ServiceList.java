package com.tour.hotel.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.goods.GoodsDTO;
import com.tour.hotel.HotelDAO;
import com.tour.location.LocationDAO;
import com.tour.location.LocationDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		HotelDAO hotelDAO=new HotelDAO();
		LocationDAO locationDAO=new LocationDAO();
		
		List<GoodsDTO> ar=null;
		List<LocationDTO> ar2=null;
		List<LocationDTO> ar3=null;
		List<LocationDTO> ar4=null;
		LocationDTO locationDTO=null;
		int curPage=1;
		int perPage=9;
		int location=1;
		// 검색에서 location이 null로 들어오면 자동으로 1번이 되기 때문에 오키나와 안에서만 검색됨. 수정필요 
		String name=request.getParameter("name");
		if(name=="" || name==null){
			name="%";
		}
		PageResult pr=null;
		try{
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			location=Integer.parseInt(request.getParameter("location"));
		}catch(Exception e){
			
		}
		PageMaker pm=new PageMaker(curPage,perPage);
		RowMaker rowMaker=pm.getRowMaker();
		try{
			pr=pm.paging(hotelDAO.getTotalCount(con, location, name));
			ar=hotelDAO.selectRegionList(con, location, name, rowMaker);
			locationDTO=locationDAO.selectLocation(con, location);
			ar2=locationDAO.selectJapanList(con);
			ar3=locationDAO.selectGroupNation(con);
			ar4=locationDAO.selectNationList(con);
		}catch(Exception e){
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
		actionForward.setPath("./hotelList.jsp");
		request.setAttribute("curPage", curPage);
		request.setAttribute("locationDTO", locationDTO);
		request.setAttribute("hotelList", ar);
		request.setAttribute("japanList", ar2);
		request.setAttribute("foreignList", ar3);
		request.setAttribute("nationList", ar4);
		request.setAttribute("pageResult", pr);
		request.setAttribute("location", location);
		request.setAttribute("name", name);
		
		return actionForward;
	}

}
