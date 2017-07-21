package com.tour.point;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tour.util.RowMaker;

public class PointDAO {
	
	
	// 로그인시 적립된 포인트의 날짜 확인
	public String selectDate(Connection con, int mnum) throws Exception {
		PreparedStatement st = null;
		String loginDate = null;
		ResultSet result = null;
		
		String sql = "select reserve from point where num=(select max(num) from point where contents=? and mnum=?)";
		st = con.prepareStatement(sql);
		st.setString(1, "로그인");
		st.setInt(2, mnum);
		result = st.executeQuery();
		
		if (result.next()) {
			loginDate = result.getDate("reserve").toString();
		}
		
		return loginDate;
	}
	
	
	// delete
	public int delete(Connection con, int mnum) throws Exception {
		PreparedStatement st = null;
		int result = 0;
		
		String sql = "delete from point where mnum=?";
		st = con.prepareStatement(sql);
		st.setInt(1, mnum);
		result = st.executeUpdate();
		
		return result;
	}
	
	// insert
	public int insert(Connection con, PointDTO pointDTO) throws Exception {
		PreparedStatement st = null;
		int result = 0;
		
		String sql = "insert into point values(point_seq.nextval, sysdate, ?, ?, ?, ?, ?, ?)";
		st = con.prepareStatement(sql);
		st.setString(1, pointDTO.getCategory());
		st.setString(2, pointDTO.getContents());
		st.setInt(3, pointDTO.getUsePoint());
		st.setInt(4, pointDTO.getMnum());
		st.setInt(5, pointDTO.getCurPoint());
		st.setInt(6, pointDTO.gettPoint());
		result = st.executeUpdate();
		
		return result;
	}
	
	// 현재 total 포인트 (회원 등급)
		public int selectTPoint(Connection con, int mnum) throws Exception {
			PreparedStatement st = null;
			ResultSet result = null;
			int tPoint = 0;
			
			String sql = "select tpoint from point where num="
					+ "(select max(num) from point where mnum=?)";
			st = con.prepareStatement(sql);
			st.setInt(1, mnum);
			result = st.executeQuery();
			
			if (result.next()) {
				tPoint = result.getInt("tPoint");
			}
			
			return tPoint;
		}
	
	// 현재 사용 가능 포인트 (가용 포인트)
	public int selectOne(Connection con, int mnum) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		int curPoint = 0;
		
		String sql = "select curPoint from point where num="
				+ "(select max(num) from point where mnum=?)";
		st = con.prepareStatement(sql);
		st.setInt(1, mnum);
		result = st.executeQuery();
		
		if (result.next()) {
			curPoint = result.getInt("curPoint");
		}
		
		return curPoint;
	}
	
	// 포인트 정보
	public List<PointDTO> selectList(Connection con, int mnum, RowMaker rowMaker) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		PointDTO pointDTO = null;
		List<PointDTO> ar = new ArrayList<>();
		
		String sql = "select * from "
				+ "(select rownum r, p.* from "
				+ "(select * from point where mnum=? order by num desc) p) "
				+ "where r between ? and ?";
		st = con.prepareStatement(sql);
		st.setInt(1, mnum);
		st.setInt(2, rowMaker.getStartRow());
		st.setInt(3, rowMaker.getLastRow());
		result = st.executeQuery();
		
		while (result.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(result.getInt("num"));
			pointDTO.setReserve(result.getDate("reserve"));
			pointDTO.setCategory(result.getString("category"));
			pointDTO.setContents(result.getString("contents"));
			pointDTO.setUsePoint(result.getInt("usePoint"));
			pointDTO.setMnum(result.getInt("mnum"));
			pointDTO.setCurPoint(result.getInt("curPoint"));
			pointDTO.settPoint(result.getInt("tPoint"));
			ar.add(pointDTO);
		}
		
		return ar;
	}
}
