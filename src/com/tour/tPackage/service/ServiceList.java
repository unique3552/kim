package com.tour.tPackage.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.RowMaker;

public class ServiceList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		TPackageDAO tPackageDAO=new TPackageDAO();
		List<TPackageDTO> ar=null;
		int curPage=1;
		int perPage=9;
		String nation="";
		try{
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		try{
			nation=request.getParameter("nation");
		}catch(Exception e){
			e.printStackTrace();
		}
		if(nation==""||nation==null){
			nation="%";
		}
		
		PageMaker pm=new PageMaker(curPage,perPage);
		RowMaker rowMaker=pm.getRowMaker();
		try {
			ar=tPackageDAO.selectList(con, rowMaker, nation);
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
		if(nation=="%"){
			actionForward.setPath("./packageMain.jsp");		
		}else{
			actionForward.setPath("./"+nation+".jsp");
		}
		request.setAttribute("tPackage", ar);
		
		return actionForward;
	}

}
