package com.tour.freeBoard.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.file.FileDTO;
import com.tour.freeBoard.FreeBoardDAO;
import com.tour.freeBoard.FreeBoardDTO;
import com.tour.util.DBConnector;

public class ServiceView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FreeBoardDAO freeBoardDAO=new FreeBoardDAO();
		FileDAO fileDAO=new FileDAO();
		Connection con=DBConnector.getConnect();
		FreeBoardDTO freeBoardDTO=null;
		List<FileDTO> ar=null;
		int num=0;
		int curPage=1;
		int fnum=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
			curPage=Integer.parseInt(request.getParameter("curPage"));
			freeBoardDTO=(FreeBoardDTO)freeBoardDAO.selectOne(con, num);
			fnum=freeBoardDAO.selectFileNum(con, num);
			ar=fileDAO.selectFile(con, fnum);
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
		
		if(freeBoardDTO!=null){
			request.setAttribute("freeBoard", freeBoardDTO);
			request.setAttribute("fileList", ar);
			request.setAttribute("curPage", curPage);
			actionForward.setPath("./freeBoardView.jsp");
		}else{
			actionForward.setPath("../error/serverError.jsp");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
