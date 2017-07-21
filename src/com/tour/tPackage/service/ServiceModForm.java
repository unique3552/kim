package com.tour.tPackage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.file.FileDTO;
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
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
		TPackageDAO tPackageDAO=new TPackageDAO();
		TPackageDTO tPackageDTO=null;
		
		try {
			tPackageDTO=(TPackageDTO)tPackageDAO.selectOne(con, num);
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
		if(tPackageDTO!=null){
			actionForward.setCheck(true);
			request.setAttribute("tPackage", tPackageDTO);
			request.setAttribute("fileList", ar);
			actionForward.setPath("./tPackageModForm.jsp");	
		}
		return actionForward;
	}

}
