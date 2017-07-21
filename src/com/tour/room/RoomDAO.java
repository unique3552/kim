package com.tour.room;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {
	
	public List<RoomDTO> selectList(Connection con, int hnum) throws Exception{
		List<RoomDTO> ar=new ArrayList<>();
		PreparedStatement st=null;
		String sql="select * from room where hnum=? order by num asc";
		st=con.prepareStatement(sql);
		st.setInt(1, hnum);
		RoomDTO roomDTO=null;
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			roomDTO=new RoomDTO();
			roomDTO.setNum(rs.getInt("num"));
			roomDTO.setPnum(rs.getInt("pnum"));
			roomDTO.setPrice(rs.getInt("price"));
			roomDTO.setRoomtype(rs.getString("roomtype"));
			roomDTO.setHnum(rs.getInt("hnum"));
			roomDTO.setGoods(rs.getInt("goods"));
			ar.add(roomDTO);
		}
		
		return ar;
	}
	
	public RoomDTO selectOne(Connection con, int num) throws Exception{
		RoomDTO roomDTO=null;
		PreparedStatement st=null;
		String sql="select * from room where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		if(rs.next()){
			roomDTO=new RoomDTO();
			roomDTO.setNum(rs.getInt("num"));
			roomDTO.setPnum(rs.getInt("pnum"));
			roomDTO.setPrice(rs.getInt("price"));
			roomDTO.setRoomtype(rs.getString("roomtype"));
			roomDTO.setHnum(rs.getInt("hnum"));
			roomDTO.setGoods(rs.getInt("goods"));
		}
		return roomDTO;
	}
	
	public int selectHnum(Connection con, int num) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="select hnum from room where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		return result;
	}
}
