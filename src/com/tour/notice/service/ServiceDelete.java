package com.tour.notice.service;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.notice.NoticeDAO;
import com.tour.util.DBConnector;

public class ServiceDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		NoticeDAO noticeDAO=new NoticeDAO();
		FileDAO fileDAO=new FileDAO();
		Connection con=DBConnector.getConnect();
		int num=0;
		int pnum=0;
		int result=0;
		String path=request.getServletContext().getRealPath("upload");
		List<String> ar=null;
		try {
			num=Integer.parseInt(request.getParameter("num"));
			pnum=Integer.parseInt(request.getParameter("pnum"));
			ar=fileDAO.allFileName(con, pnum);
			for(int i=0;i<ar.size();i++){
				File file=new File(path,ar.get(i));
				if(file.exists()){
					file.delete();
				}
			}
			result=fileDAO.allFileDelete(con, pnum);
			result=noticeDAO.delete(con, num);
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
			request.setAttribute("path", "./noticeList.notice");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
