package com.tour.tInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tour.util.RowMaker;

public class TInfoDAO{
	
	public List<TInfoDTO> selectList(Connection con, RowMaker rowMaker, String search, String kind) throws SQLException{
		List<TInfoDTO> ar=new ArrayList<>();
		PreparedStatement st=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from tinfo where "+kind+" like ? order by num asc) t)"
				+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, rowMaker.getStartRow());
		st.setInt(3, rowMaker.getLastRow());
		ResultSet rs=st.executeQuery();
		TInfoDTO tInfoDTO=null;
		while(rs.next()){
			tInfoDTO=new TInfoDTO();
			tInfoDTO.setNum(rs.getInt("num"));
			tInfoDTO.setTname(rs.getString("tname"));
			tInfoDTO.setNation(rs.getString("nation"));
			tInfoDTO.setVideo(rs.getString("video"));
			tInfoDTO.setVimg(rs.getString("vimg"));
			tInfoDTO.setVimg2(rs.getString("vimg2"));
			tInfoDTO.setVimg3(rs.getString("vimg3"));
			tInfoDTO.setTimg(rs.getString("timg"));
			tInfoDTO.setTimg2(rs.getString("timg2"));
			tInfoDTO.setTimg3(rs.getString("timg3"));
			tInfoDTO.setTinfo(rs.getString("tinfo"));
			tInfoDTO.setVinfo(rs.getString("vinfo"));
			tInfoDTO.setNimg(rs.getString("nimg"));
			ar.add(tInfoDTO);
		}
		
		return ar;
	}
	
	public TInfoDTO selectOne(Connection con, int num) throws SQLException{
		TInfoDTO tInfoDTO=null;
		PreparedStatement st=null;
		String sql="select * from tinfo where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		if(rs.next()){
			tInfoDTO=new TInfoDTO();
			tInfoDTO.setNum(rs.getInt("num"));
			tInfoDTO.setTname(rs.getString("tname"));
			tInfoDTO.setNation(rs.getString("nation"));
			tInfoDTO.setVideo(rs.getString("video"));
			tInfoDTO.setVimg(rs.getString("vimg"));
			tInfoDTO.setVimg2(rs.getString("vimg2"));
			tInfoDTO.setVimg3(rs.getString("vimg3"));
			tInfoDTO.setTimg(rs.getString("timg"));
			tInfoDTO.setTimg2(rs.getString("timg2"));
			tInfoDTO.setTimg3(rs.getString("timg3"));
			tInfoDTO.setTinfo(rs.getString("tinfo"));
			tInfoDTO.setVinfo(rs.getString("vinfo"));
			tInfoDTO.setNimg(rs.getString("nimg"));
		}
		
		return tInfoDTO;
	}
	
	public int insert(Connection con, TInfoDTO tInfoDTO) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="insert into tinfo values(tinfo_seq.nextval,?,?,?)";
		st=con.prepareStatement(sql);
		st.setString(1, tInfoDTO.getTname());
		st.setString(2, tInfoDTO.getNation());
		st.setString(3, tInfoDTO.getVideo());
		result=st.executeUpdate();
		
		return result;
	}

	
	public int update(Connection con, TInfoDTO tInfoDTO) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="update tinfo set tname=?, nation=?, video=? where num=?";
		st=con.prepareStatement(sql);
		st.setString(1, tInfoDTO.getTname());
		st.setString(2, tInfoDTO.getNation());
		st.setString(3, tInfoDTO.getVideo());
		st.setInt(4, tInfoDTO.getNum());
		result=st.executeUpdate();
		return result;
	}

	public int delete(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="delete from tinfo where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		result=st.executeUpdate();
		return result;
	}

	
	public int getTotalCount(Connection con, String kind, String search) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="select count(num) from tinfo where "+kind+" like ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		return result;
	}
}
