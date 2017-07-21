package com.tour.file;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FileDAO {
	
	public List<String> allFileName(Connection con, int pnum) throws Exception{
		List<String> ar=new ArrayList<>();
		PreparedStatement st=null;
		String sql="select fsname from upload where pnum=?";
		st=con.prepareStatement(sql);
		st.setInt(1, pnum);
		ResultSet rs=st.executeQuery();
		String fileName=null;
		while(rs.next()){
			fileName=rs.getString("fsname");
			ar.add(fileName);
		}
		return ar;
	}
	
	public String deleteFileName(Connection con,int num) throws Exception{
		String fileName="";
		PreparedStatement st=null;
		String sql="select fsname from upload where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		rs.next();
		fileName=rs.getString(1);
		
		return fileName;
	}
	
	public int allFileDelete(Connection con, int pnum) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="delete from upload where pnum=?";
		st=con.prepareStatement(sql);
		st.setInt(1, pnum);
		result=st.executeUpdate();
		
		return result;
	}
	
	public int fileDelete(Connection con, int num) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="delete from upload where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		result=st.executeUpdate();
		
		return result;
	}
	
	public List<FileDTO> selectFile(Connection con, int pnum) throws Exception{
		List<FileDTO> ar=new ArrayList<>();
		PreparedStatement st=null;
		String sql="select * from upload where pnum=?";
		st=con.prepareStatement(sql);
		st.setInt(1, pnum);
		ResultSet rs=st.executeQuery();
		FileDTO fileDTO=null;
		while(rs.next()){
			fileDTO=new FileDTO();
			fileDTO.setNum(rs.getInt("num"));
			fileDTO.setFsname(rs.getString("fsname"));
			fileDTO.setOname(rs.getString("oname"));
			fileDTO.setPnum(rs.getInt("pnum"));
			ar.add(fileDTO);
		}
		
		return ar;
	}
	
	public int fileUpload(Connection con, String fs, String os, int pnum) throws Exception{
		PreparedStatement st=null;
		int result=0;
		String sql="insert into upload values(upload_seq.nextval,?,?,?)";
		st=con.prepareStatement(sql);
		st.setString(1, fs);
		st.setString(2, os);
		st.setInt(3, pnum);
		result=st.executeUpdate();
		
		return result;
	}
}
