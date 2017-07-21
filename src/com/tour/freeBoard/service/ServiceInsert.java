package com.tour.freeBoard.service;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.freeBoard.FreeBoardDAO;
import com.tour.freeBoard.FreeBoardDTO;
import com.tour.util.DBConnector;

public class ServiceInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FreeBoardDAO freeBoardDAO=new FreeBoardDAO();
		FreeBoardDTO freeBoardDTO=new FreeBoardDTO();
		FileDAO fileDAO=new FileDAO();
		Connection con=DBConnector.getConnect();
		int result=0;
		int fnum=0;
		int maxSize=10*1024*1024;
		String path=request.getServletContext().getRealPath("upload");
		
		File f=new File(path);
		if(!f.exists()){
			f.mkdir();
		}
		
		MultipartRequest multi=null;
		try {
			multi=new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			freeBoardDTO.setTitle(multi.getParameter("title"));
			freeBoardDTO.setContents(multi.getParameter("contents"));
			freeBoardDTO.setWriter(multi.getParameter("writer"));
			result=freeBoardDAO.insert(con, freeBoardDTO);
			fnum=freeBoardDAO.selectFileNum(con, result);
			
			Enumeration en=multi.getFileNames();
			while(en.hasMoreElements()){
				String n=(String)en.nextElement();
				String fs=multi.getFilesystemName(n);
				String os=multi.getOriginalFileName(n);
				result=fileDAO.fileUpload(con, fs, os, fnum);
			}
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
