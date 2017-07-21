package com.tour.tInfo.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.tInfo.TInfoDAO;
import com.tour.tInfo.TInfoDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		TInfoDAO tInfoDAO=new TInfoDAO();
		List<TInfoDTO> ar=null;
		Connection con=DBConnector.getConnect();
		String kind=request.getParameter("kind");
		String search=request.getParameter("search");
		if(kind==null){
			kind="num";
		}
		if(search==null){
			search="%";
		}
		int curPage=1;
		try{
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		PageMaker pm=new PageMaker(curPage);
		RowMaker rowMaker=pm.getRowMaker();
		PageResult pr=null;
		try {
			pr=pm.paging(tInfoDAO.getTotalCount(con, kind, search));
			ar=tInfoDAO.selectList(con, rowMaker, search, kind);
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
		request.setAttribute("kind", kind);
		request.setAttribute("search", search);
		request.setAttribute("pageResult", pr);
		request.setAttribute("curPage", curPage);
		request.setAttribute("tInfoList", ar);
		actionForward.setCheck(true);
		actionForward.setPath("./tInfoList.jsp");
		
		
		return actionForward;
	}

}
