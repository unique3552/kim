package com.tour.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tour.user.UserDAO;
import com.tour.user.UserDTO;

public class AdminDAO implements UserDAO {

	@Override
	public UserDTO login(Connection con, UserDTO userDTO) throws Exception {
		PreparedStatement st = null;
		AdminDTO adminDTO = null;
		ResultSet result = null;
		
		String sql = "select * from admin where id=? and pw=?";
		st = con.prepareStatement(sql);
		st.setString(1, userDTO.getId());
		st.setString(2, userDTO.getPw());
		result = st.executeQuery();
		
		if (result.next()) {
			adminDTO = new AdminDTO();
			adminDTO.setNum(result.getInt("num"));
			adminDTO.setId(result.getString("id"));
			adminDTO.setPw(result.getString("pw"));
			adminDTO.setName(result.getString("name"));
			adminDTO.setPhone(result.getString("phone"));
		}
		
		return adminDTO;
	}

	@Override
	public int delete(Connection con, int num) throws Exception {
		PreparedStatement st = null;
		int result = 0;
		
		String sql = "delete from admin where num=?";
		st = con.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeUpdate();
		
		return result;
	}

	@Override
	public int update(Connection con, UserDTO userDTO) throws Exception {
		PreparedStatement st = null;
		AdminDTO adminDTO = (AdminDTO)userDTO;
		int result = 0;
		
		String sql = "update admin set pw=?, phone=? where num=?";
		st = con.prepareStatement(sql);
		st.setString(1, adminDTO.getPw());
		st.setString(2, adminDTO.getPhone());
		st.setInt(3, adminDTO.getNum());
		result = st.executeUpdate();
		
		return result;
	}

	@Override
	public int selectOne(Connection con, String id) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		int num = 0;
		
		String sql = "select num from admin where id=?";
		st = con.prepareStatement(sql);
		st.setString(1, id);
		result = st.executeQuery();
		
		if (result.next()) {
			num = result.getInt("num");
		}
		
		return num;
	}
	
	public AdminDTO selectOne(Connection con, int num) throws Exception {
		PreparedStatement st = null;
		ResultSet rs = null;
		AdminDTO adminDTO=null;
		
		String sql = "select * from admin where num=?";
		st = con.prepareStatement(sql);
		st.setInt(1, num);
		rs = st.executeQuery();
		
		if (rs.next()) {
			adminDTO=new AdminDTO();
			adminDTO.setNum(rs.getInt("num"));
			adminDTO.setId(rs.getString("id"));
			adminDTO.setName(rs.getString("name"));
			adminDTO.setPw(rs.getString("pw"));
			adminDTO.setPhone(rs.getString("phone"));
		}
		
		return adminDTO;
	}
	

}
