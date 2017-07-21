package com.tour.notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.notice.NoticeDAO;
import com.tour.notice.NoticeDTO;
import com.tour.util.DBConnector;

public class ServiceMod implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		Connection con=DBConnector.getConnect();
		NoticeDTO noticeDTO=new NoticeDTO();
		noticeDTO.setNum(Integer.parseInt(request.getParameter("num")));
		noticeDTO.setTitle(request.getParameter("title"));
		noticeDTO.setContents(request.getParameter("contents"));
		int result=0;
		NoticeDAO noticeDAO=new NoticeDAO();
		try {
			result=noticeDAO.update(con, noticeDTO);
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
