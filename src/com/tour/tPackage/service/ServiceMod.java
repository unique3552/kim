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
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
import com.tour.util.DBConnector;

public class ServiceMod implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		TPackageDAO tPackageDAO=new TPackageDAO();
		TPackageDTO tPackageDTO=new TPackageDTO();
		Connection con=DBConnector.getConnect();
		int result=0;
		
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
			tPackageDTO.setNum(Integer.parseInt(multi.getParameter("num")));
			tPackageDTO.setName(multi.getParameter("name"));
			tPackageDTO.setDfnum(Integer.parseInt(multi.getParameter("dfnum")));
			tPackageDTO.setAfnum(Integer.parseInt(multi.getParameter("afnum")));
			tPackageDTO.setPnum(Integer.parseInt(multi.getParameter("pnum")));
			tPackageDTO.setNation(multi.getParameter("nation"));
			tPackageDTO.setHnum(Integer.parseInt(multi.getParameter("hnum")));
			tPackageDTO.setPrice(Integer.parseInt(multi.getParameter("price")));
			
			Enumeration en=multi.getFileNames();
			if(en.hasMoreElements()){
				String name=(String)en.nextElement();
				String fs=multi.getFilesystemName(name);
				tPackageDTO.setImg(fs);
			}
			if(tPackageDTO.getImg()==null){
				result=tPackageDAO.notImgUpdate(con, tPackageDTO);
			}else{
				result=tPackageDAO.update(con, tPackageDTO);	
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
			request.setAttribute("path", "./tPackageList.tPackage");
		}
		actionForward.setCheck(true);
		
		return actionForward;
	}

}
