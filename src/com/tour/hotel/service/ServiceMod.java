package com.tour.hotel.service;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.hotel.HotelDAO;
import com.tour.hotel.HotelDTO;
import com.tour.util.DBConnector;

public class ServiceMod implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		HotelDTO hotelDTO=new HotelDTO();
		HotelDAO hotelDAO=new HotelDAO();
		Connection con=DBConnector.getConnect();
		int result=0;
		
		String path=request.getServletContext().getRealPath("hotelImg");
		System.out.println(path);
		int maxSize=10*1024*1024;
		
		File file=new File(path);
		if(!file.exists()){
			file.mkdir();
		}
		
		MultipartRequest multi=null;
		
		try {
			multi=new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			hotelDTO.setNum(Integer.parseInt(multi.getParameter("num")));
			hotelDTO.setName(multi.getParameter("name"));
			hotelDTO.setLocation(Integer.parseInt(multi.getParameter("location")));
			hotelDTO.setGnum(Integer.parseInt(multi.getParameter("gnum")));
			hotelDTO.setAddress(multi.getParameter("address"));
			
			Enumeration en=multi.getFileNames();
			if(en.hasMoreElements()){
				String name=(String)en.nextElement();
				String fs=multi.getFilesystemName(name);
				hotelDTO.setImg(fs);
			}
			if(hotelDTO.getImg()==null){
				result=hotelDAO.notImgUpdate(con, hotelDTO);
			}else{
				result=hotelDAO.update(con, hotelDTO);	
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
		
		if(result>0){
			actionForward.setPath("../common/commonResult.jsp");
			request.setAttribute("path", "./hotelList.hotel");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
