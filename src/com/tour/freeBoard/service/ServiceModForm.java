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

public class ServiceModForm implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FreeBoardDAO freeBoardDAO=new FreeBoardDAO();
		FileDAO fileDAO=new FileDAO();
		List<FileDTO> ar=null;
		Connection con=DBConnector.getConnect();
		FreeBoardDTO freeBoardDTO=null;
		int num=0;
		int fnum=0;
		try{
			num=Integer.parseInt(request.getParameter("num"));
			freeBoardDTO=(FreeBoardDTO)freeBoardDAO.selectOne(con, num);
			fnum=freeBoardDAO.selectFileNum(con, num);
			ar=fileDAO.selectFile(con, fnum);
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
		if(freeBoardDTO!=null){
			request.setAttribute("freeBoard", freeBoardDTO);
			request.setAttribute("fileList", ar);
			actionForward.setPath("./freeBoardModForm.jsp");
		}else{
			actionForward.setPath("../error/serverError.jsp");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
