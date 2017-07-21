package com.tour.location;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LocationDAO {
	
	public List<LocationDTO> selectNationList2(Connection con) throws Exception {
		PreparedStatement st = null;
		List<LocationDTO> ar = new ArrayList<>();
		LocationDTO locationDTO = null;
		ResultSet result = null;
				
		String sql = "select * from "
				+ "(select min(num) num, nation, engnation from location "
				+ "group by nation, engnation HAVING nation!='국내' and nation!='일본') "
				+ "ORDER BY num asc";
		st = con.prepareStatement(sql);
		result = st.executeQuery();
		
		while (result.next()) {
			locationDTO = new LocationDTO();
			locationDTO.setNum(result.getInt("num"));
			locationDTO.setNation(result.getString("nation"));
			locationDTO.setEngNation(result.getString("engnation"));
			
			ar.add(locationDTO);
		}		
		return ar;
	}
	
	// 나라
	public List<LocationDTO> selectNationList(Connection con) throws Exception {
		PreparedStatement st = null;
		List<LocationDTO> ar = new ArrayList<>();
		LocationDTO locationDTO = null;
		ResultSet result = null;
				
		String sql = "select distinct nation, engnation from location";
		st = con.prepareStatement(sql);
		result = st.executeQuery();
		
		while (result.next()) {
			locationDTO = new LocationDTO();
			locationDTO.setNation(result.getString("nation"));
			locationDTO.setEngNation(result.getString("engnation"));
			
			ar.add(locationDTO);
		}
		
		return ar;
	}
	
	// 나라별 그룹
	public List<LocationDTO> selectGroupNation(Connection con) throws Exception{
		PreparedStatement st=null;
		List<LocationDTO> ar=new ArrayList<>();
		String sql="select nation,engnation from location where engnation not in ('japan','korea') group by nation,engnation";
		st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		LocationDTO locationDTO=null;
		
		while(rs.next()){
			locationDTO=new LocationDTO();
			locationDTO.setNation(rs.getString(1));
			locationDTO.setEngNation(rs.getString(2));
			ar.add(locationDTO);
		}
		
		return ar;
	}
	
	// 나라로 검색한 지역 리스트
	public List<LocationDTO> selectRegionList(Connection con, String nation) throws Exception {
		PreparedStatement st = null;
		List<LocationDTO> ar = new ArrayList<>();
		ResultSet result = null;
		LocationDTO locationDTO = null;
		
		String sql = "select * from location where engnation=?";
		st = con.prepareStatement(sql);
		st.setString(1, nation);
		result = st.executeQuery();
		
		while (result.next()) {
			locationDTO = new LocationDTO();
			locationDTO.setNum(result.getInt("num"));
			locationDTO.setNation(result.getString("nation"));
			locationDTO.setRegion(result.getString("region"));
			locationDTO.setEngNation(result.getString("engnation"));
			locationDTO.setEngRegion(result.getString("engregion"));
			locationDTO.setUnit(result.getString("unit"));
			ar.add(locationDTO);
		}
		
		return ar;
	}
	
	
	public int selectRegionNum(Connection con, String engRegion) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		int num = 0;
		
		String sql = "select num from location where engregion=?";
		st = con.prepareStatement(sql);
		st.setString(1, engRegion);
		result = st.executeQuery();
		
		if (result.next()) {
			num = result.getInt("num");
		}
		
		return num;
	}
	
	
	public LocationDTO selectLocation(Connection con, int num) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		LocationDTO locationDTO = null;
		
		String sql = "select * from location where num=?";
		st = con.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeQuery();
		
		if (result.next()) {
			locationDTO = new LocationDTO();
			locationDTO.setNum(result.getInt("num"));
			locationDTO.setNation(result.getString("nation"));
			locationDTO.setRegion(result.getString("region"));
			locationDTO.setEngNation(result.getString("engnation"));
			locationDTO.setEngRegion(result.getString("engregion"));
			locationDTO.setUnit(result.getString("unit"));
		}
		
		return locationDTO;
	}
	
	public List<LocationDTO> selectJapanList(Connection con) throws SQLException{
		List<LocationDTO> ar=new ArrayList<>();
		LocationDTO locationDTO=null;
		PreparedStatement st=null;
		String sql="select * from location where engnation='japan'";
		st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			locationDTO = new LocationDTO();
			locationDTO.setNum(rs.getInt("num"));
			locationDTO.setNation(rs.getString("nation"));
			locationDTO.setRegion(rs.getString("region"));
			locationDTO.setEngNation(rs.getString("engnation"));
			locationDTO.setEngRegion(rs.getString("engregion"));
			locationDTO.setUnit(rs.getString("unit"));
			ar.add(locationDTO);
		}
		
		return ar;
	}
	
	public List<LocationDTO> selectForeignList(Connection con) throws Exception{
		List<LocationDTO> ar=new ArrayList<>();
		LocationDTO locationDTO=null;
		PreparedStatement st=null;
		String sql="select * from location where engnation not in ('japan','korea')";
		st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			locationDTO = new LocationDTO();
			locationDTO.setNum(rs.getInt("num"));
			locationDTO.setNation(rs.getString("nation"));
			locationDTO.setRegion(rs.getString("region"));
			locationDTO.setEngNation(rs.getString("engnation"));
			locationDTO.setEngRegion(rs.getString("engregion"));
			locationDTO.setUnit(rs.getString("unit"));
			ar.add(locationDTO);
		}
		
		return ar;
	}
	
	
	
}
