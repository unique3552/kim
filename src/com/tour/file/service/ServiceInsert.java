package com.tour.file.service;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.file.FileDAO;
import com.tour.file.FileDTO;
import com.tour.util.DBConnector;

public class ServiceInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		FileDAO fileDAO=new FileDAO();
		int result=0;
		int pnum=0;
		List<FileDTO> ar=null;
		Connection con=DBConnector.getConnect();
		int maxSize=10*1024*1024;
		String path=request.getServletContext().getRealPath("upload");
		System.out.println(path);
		
		File file=new File(path);
		if(!file.exists()){
			file.mkdir();
		}
		MultipartRequest multi=null;
		try {
			multi=new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			pnum=Integer.parseInt(multi.getParameter("pnum"));
			Enumeration en=multi.getFileNames();
			while(en.hasMoreElements()){
				String n=(String)en.nextElement();
				String fs=multi.getFilesystemName(n);
				String os=multi.getOriginalFileName(n);
				result=fileDAO.fileUpload(con, fs, os, pnum);
			}
			ar=fileDAO.selectFile(con, pnum);
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
			request.setAttribute("fileList", ar);
		}
		actionForward.setCheck(true);
		actionForward.setPath("../file/fileResult.jsp");
		
		return actionForward;
	}

}
