package com.tour.notice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.board.BoardDTO;
import com.tour.notice.NoticeDAO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		NoticeDAO noticeDAO=new NoticeDAO();
		List<BoardDTO> ar=null;
		Connection con=DBConnector.getConnect();
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
			pr=pm.paging(noticeDAO.getTotalCount(con, kind, search));
			ar=noticeDAO.selectList(con, kind, search, rowMaker);
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
		request.setAttribute("noticeList", ar);
		request.setAttribute("search", search);
		request.setAttribute("kind", kind);
		request.setAttribute("curPage", curPage);
		request.setAttribute("pageResult", pr);
		actionForward.setCheck(true);
		actionForward.setPath("./noticeList.jsp");
		
		return actionForward;
	}

}
