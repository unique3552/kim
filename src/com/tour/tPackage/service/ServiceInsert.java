package com.tour.tPackage.service;

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
import com.tour.admin.AdminDTO;
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
import com.tour.util.DBConnector;

public class ServiceInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		int result=0;
		Connection con=DBConnector.getConnect();
		AdminDTO admin=(AdminDTO)request.getSession().getAttribute("admin");
		TPackageDAO tPackageDAO=new TPackageDAO();
		TPackageDTO tPackageDTO=new TPackageDTO();
		
		String path=request.getServletContext().getRealPath("tPackageImg");
		System.out.println(path);
		int maxSize=10*1024*1024;
		
		File file=new File(path);
		if(!file.exists()){
			file.mkdir();
		}
		
		MultipartRequest multi=null;
		
		try {
			multi=new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			tPackageDTO.setName(multi.getParameter("name"));
			tPackageDTO.setAfnum(Integer.parseInt(multi.getParameter("afnum")));
			tPackageDTO.setDfnum(Integer.parseInt(multi.getParameter("dfnum")));
			tPackageDTO.setHnum(Integer.parseInt(multi.getParameter("hnum")));
			tPackageDTO.setAdmin(admin.getNum());
			tPackageDTO.setNation(multi.getParameter("nation"));
			tPackageDTO.setPnum(Integer.parseInt(multi.getParameter("pnum")));
			tPackageDTO.setPrice(Integer.parseInt(multi.getParameter("price")));
			
			Enumeration en=multi.getFileNames();
			if(en.hasMoreElements()){
				String n=(String)en.nextElement();
				String fs=multi.getFilesystemName(n);
				tPackageDTO.setImg(fs);
			}
			result=tPackageDAO.insert(con, tPackageDTO);
			
			
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
			request.setAttribute("path", "./tPackageList.tPackage");
		}
		actionForward.setCheck(true);
		
		
		
		
		
		return actionForward;
	}

}
