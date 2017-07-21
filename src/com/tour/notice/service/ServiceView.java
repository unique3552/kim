package com.tour.notice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.file.FileDTO;
import com.tour.notice.NoticeDAO;
import com.tour.notice.NoticeDTO;
import com.tour.util.DBConnector;

public class ServiceView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		NoticeDAO noticeDAO=new NoticeDAO();
		FileDAO fileDAO=new FileDAO();
		List<FileDTO> ar=null;
		NoticeDTO noticeDTO=null;
		Connection con=DBConnector.getConnect();
		int curPage=1;
		int fnum=0;
		int num=0;
		try {
			num=Integer.parseInt(request.getParameter("num"));
			noticeDTO=(NoticeDTO)noticeDAO.selectOne(con, num);
			fnum=noticeDAO.selectFileNum(con, num);
			ar=fileDAO.selectFile(con, fnum);
			curPage=Integer.parseInt(request.getParameter("curPage"));
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
		
		if(noticeDTO!=null){
			actionForward.setPath("./noticeView.jsp");
			request.setAttribute("notice", noticeDTO);
			request.setAttribute("fileList", ar);
			request.setAttribute("curPage", curPage);
		}else{
			actionForward.setPath("../error/serverError.jsp");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
