package com.tour.file.service;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.file.FileDTO;
import com.tour.util.DBConnector;

public class ServiceDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FileDAO fileDAO=new FileDAO();
		Connection con=DBConnector.getConnect();
		int unum=0;
		int pnum=0;
		List<FileDTO> ar=null;
		int result=0;
		String path=request.getServletContext().getRealPath("upload");	// 실제 파일 저장경로
		String fileName="";
		try{
			unum=Integer.parseInt(request.getParameter("unum"));
			pnum=Integer.parseInt(request.getParameter("pnum"));
			fileName=fileDAO.deleteFileName(con, unum);
			result=fileDAO.fileDelete(con, unum);
			File file=new File(path,fileName);
			if(file.exists()){
				file.delete();
			}
			ar=fileDAO.selectFile(con, pnum);
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
		
		if(result>0){
			request.setAttribute("fileList", ar);
			actionForward.setPath("../file/fileResult.jsp");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
