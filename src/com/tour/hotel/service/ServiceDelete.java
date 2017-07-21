package com.tour.hotel.service;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.hotel.HotelDAO;
import com.tour.util.DBConnector;

public class ServiceDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		HotelDAO hotelDAO=new HotelDAO();
		int num=0;
		int pnum=0;
		FileDAO fileDAO=new FileDAO();
		List<String> ar=null;
		int result=0;
		String img="";
		String uploadPath=request.getServletContext().getRealPath("upload");
		String hotelPath=request.getServletContext().getRealPath("hotelImg");
		
		try{
			num=Integer.parseInt(request.getParameter("num"));
			pnum=Integer.parseInt(request.getParameter("pnum"));
			img=request.getParameter("img");	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		try{
			ar=fileDAO.allFileName(con, pnum);
			for(int i=0;i<ar.size();i++){
				File file=new File(uploadPath,ar.get(i));
				if(file.exists()){
					file.delete();
				}
			}
			File file=new File(hotelPath,img);
			if(file.exists()){
				file.delete();
			}
			result=fileDAO.allFileDelete(con, pnum);	//upload db에서 해당 fnum으로 된 파일 모두 삭제
			result=hotelDAO.delete(con, num);
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
		if(result>0){
			actionForward.setPath("../common/commonResult.jsp");
			request.setAttribute("path", "./hotelList.hotel");
			actionForward.setCheck(true);
		}
		
		return actionForward;
	}

}
