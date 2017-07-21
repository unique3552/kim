package com.tour.notice.service;

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
import com.tour.notice.NoticeDAO;
import com.tour.notice.NoticeDTO;
import com.tour.util.DBConnector;

public class ServiceInsert implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		NoticeDTO noticeDTO=new NoticeDTO();
		NoticeDAO noticeDAO=new NoticeDAO();
		FileDAO fileDAO=new FileDAO();
		Connection con=DBConnector.getConnect();
		int result=0;
		int fnum=0;
		
		int maxSize=10*1024*1024;	// 파일 최대 사이즈: 10mb
		String path=request.getServletContext().getRealPath("upload");
		// 파일이 저장될 실제 경로
		
		File f=new File(path);	// 파일 위치 지정
		if(!f.exists()){
			f.mkdir();	// 폴더가 존재하지 않으면 폴더 생성
		}
		
		MultipartRequest multi=null;
		try {
			multi=new MultipartRequest(request, path, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			// 리퀘스트를 받아오는 일종의 배열
			noticeDTO.setTitle(multi.getParameter("title"));
			noticeDTO.setContents(multi.getParameter("contents"));
			noticeDTO.setWriter(multi.getParameter("writer"));
			result=noticeDAO.insert(con, noticeDTO);
			// 글을 추가한 후 notice테이블의 최신 글 번호 받아옴
			fnum=noticeDAO.selectFileNum(con, result);
			
			Enumeration en=multi.getFileNames();	// Enumeration = iterator와 비슷하지만 삭제 불가
			// multi에 저장된 file이름 가져오기
			while(en.hasMoreElements()){
				String n=(String)en.nextElement();
				String fs=multi.getFilesystemName(n);	// 실제 업로드 된 파일명
				String os=multi.getOriginalFileName(n);
				result=fileDAO.fileUpload(con, fs, os, fnum);	// DB에 파일 업로드
			}
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
