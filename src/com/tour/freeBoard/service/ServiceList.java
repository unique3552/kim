package com.tour.freeBoard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.board.BoardDTO;
import com.tour.freeBoard.FreeBoardDAO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FreeBoardDAO freeBoardDAO=new FreeBoardDAO();
		Connection con=DBConnector.getConnect();
		List<BoardDTO> ar=null;
		int curPage=1;
		try{
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		String kind=request.getParameter("kind");
		String search=request.getParameter("search");
		if(kind==null){
			kind="num";
		}
		if(search==null){
			search="%";
		}
		PageMaker pm=new PageMaker(curPage);
		RowMaker rowMaker=pm.getRowMaker();
		PageResult pr=null;
		try {
			pr=pm.paging(freeBoardDAO.getTotalCount(con, kind, search));
			ar=freeBoardDAO.selectList(con, kind, search, rowMaker);
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
		
		request.setAttribute("pageResult", pr);
		request.setAttribute("freeBoardList", ar);
		request.setAttribute("curPage", curPage);
		request.setAttribute("kind", kind);
		request.setAttribute("search", search);
		
		actionForward.setCheck(true);
		actionForward.setPath("./freeBoardList.jsp");
		
		return actionForward;
	}

}
