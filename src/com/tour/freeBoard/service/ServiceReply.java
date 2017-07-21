package com.tour.freeBoard.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.freeBoard.FreeBoardDAO;
import com.tour.freeBoard.FreeBoardDTO;
import com.tour.util.DBConnector;

public class ServiceReply implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FreeBoardDAO freeBoardDAO=new FreeBoardDAO();
		FreeBoardDTO freeBoardDTO=new FreeBoardDTO();
		Connection con=DBConnector.getConnect();
		freeBoardDTO.setNum(Integer.parseInt(request.getParameter("num")));
		freeBoardDTO.setTitle(request.getParameter("title"));
		freeBoardDTO.setContents(request.getParameter("contents"));
		freeBoardDTO.setWriter(request.getParameter("writer"));
		int result=0;
		try {
			result=freeBoardDAO.reply(con, freeBoardDTO);
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
			request.setAttribute("path", "./freeBoardList.freeBoard");
		}else{
			actionForward.setPath("../error/serverError.jsp");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
