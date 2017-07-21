package com.tour.flight;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tour.goods.GoodsDAO;
import com.tour.goods.GoodsDTO;
import com.tour.util.RowMaker;

public class FlightDAO implements GoodsDAO {
	
	public List<FlightDTO> selectArrivalList(Connection con, int acity, int dcity, String company, RowMaker rowMaker) throws Exception{
		PreparedStatement st=null;
		List<FlightDTO> ar=new ArrayList<>();
		FlightDTO flightDTO=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from flight where acity=? and dcity=? and company like ? order by num asc) t)"
				+ " where rownum between ? and ?";
		st=con.prepareStatement(sql);
		st.setInt(1, dcity);
		st.setInt(2, acity);
		st.setString(3, company);
		st.setInt(4, rowMaker.getStartRow());
		st.setInt(5, rowMaker.getLastRow());
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			flightDTO=new FlightDTO();
			flightDTO.setNum(rs.getInt("num"));
			flightDTO.setName(rs.getString("name"));
			flightDTO.setPnum(rs.getInt("pnum"));
			flightDTO.setDcity(rs.getInt("dcity"));
			flightDTO.setAcity(rs.getInt("acity"));
			flightDTO.setAtime(rs.getString("atime"));
			flightDTO.setDtime(rs.getString("dtime"));
			flightDTO.setPrice(rs.getInt("price"));
			flightDTO.setGoods(rs.getInt("goods"));
			flightDTO.setCompany(rs.getString("company"));
			ar.add(flightDTO);
		}
		
		return ar;
	}
	
	public List<FlightDTO> selectDepartureList(Connection con, int acity, int dcity, String company, RowMaker rowMaker) throws Exception{
		PreparedStatement st=null;
		List<FlightDTO> ar=new ArrayList<>();
		FlightDTO flightDTO=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from flight where acity=? and dcity=? and company like ? order by num asc) t)"
				+ " where rownum between ? and ?";
		st=con.prepareStatement(sql);
		st.setInt(1, acity);
		st.setInt(2, dcity);
		st.setString(3, company);
		st.setInt(4, rowMaker.getStartRow());
		st.setInt(5, rowMaker.getLastRow());
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			flightDTO=new FlightDTO();
			flightDTO.setNum(rs.getInt("num"));
			flightDTO.setName(rs.getString("name"));
			flightDTO.setPnum(rs.getInt("pnum"));
			flightDTO.setDcity(rs.getInt("dcity"));
			flightDTO.setAcity(rs.getInt("acity"));
			flightDTO.setAtime(rs.getString("atime"));
			flightDTO.setDtime(rs.getString("dtime"));
			flightDTO.setPrice(rs.getInt("price"));
			flightDTO.setGoods(rs.getInt("goods"));
			flightDTO.setCompany(rs.getString("company"));
			ar.add(flightDTO);
		}
		
		return ar;
	}
	
	public int getDTotalCount(Connection con, int acity, int dcity, String company) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="select count(num) from flight where acity=? and dcity=? and company=?";
		st=con.prepareStatement(sql);
		st.setInt(1, acity);
		st.setInt(2, dcity);
		st.setString(3, company);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}
	
	public int getATotalCount(Connection con, int acity, int dcity, String company) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="select count(num) from flight where acity=? and dcity=? and company=?";
		st=con.prepareStatement(sql);
		st.setInt(1, dcity);
		st.setInt(2, acity);
		st.setString(3, company);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}

	@Override
	public List<GoodsDTO> selectList(Connection con, String kind, String search, RowMaker rowMaker) throws Exception {
		PreparedStatement st=null;
		List<GoodsDTO> ar=new ArrayList<>();
		FlightDTO flightDTO=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from flight where "+kind+" like ? order by num asc) t)"
						+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, rowMaker.getStartRow());
		st.setInt(3, rowMaker.getLastRow());
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			flightDTO=new FlightDTO();
			flightDTO.setNum(rs.getInt("num"));
			flightDTO.setName(rs.getString("name"));
			flightDTO.setPnum(rs.getInt("pnum"));
			flightDTO.setDcity(rs.getInt("dcity"));
			flightDTO.setAcity(rs.getInt("acity"));
			flightDTO.setAtime(rs.getString("atime"));
			flightDTO.setDtime(rs.getString("dtime"));
			flightDTO.setPrice(rs.getInt("price"));
			flightDTO.setGoods(rs.getInt("goods"));
			flightDTO.setCompany(rs.getString("company"));
			ar.add(flightDTO);
		}
		return ar;
	}

	@Override
	public GoodsDTO selectOne(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		FlightDTO flightDTO=null;
		String sql="select * from flight where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		if(rs.next()){
			flightDTO=new FlightDTO();
			flightDTO.setNum(rs.getInt("num"));
			flightDTO.setName(rs.getString("name"));
			flightDTO.setPnum(rs.getInt("pnum"));
			flightDTO.setDcity(rs.getInt("dcity"));
			flightDTO.setAcity(rs.getInt("acity"));
			flightDTO.setAtime(rs.getString("atime"));
			flightDTO.setDtime(rs.getString("dtime"));
			flightDTO.setPrice(rs.getInt("price"));
			flightDTO.setGoods(rs.getInt("goods"));
			flightDTO.setCompany(rs.getString("company"));
		}
		return flightDTO;
	}

	@Override
	public int insert(Connection con, GoodsDTO goodsDTO) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="insert into flight values(filght_seq.nextval,?,?,?,?,?,?,?,2,?)";
		st=con.prepareStatement(sql);
		st.setString(1, goodsDTO.getName());
		st.setInt(2, ((FlightDTO)goodsDTO).getPnum());
		st.setInt(3, ((FlightDTO)goodsDTO).getDcity());
		st.setInt(4, ((FlightDTO)goodsDTO).getAcity());
		st.setString(5, ((FlightDTO)goodsDTO).getAtime());
		st.setString(6, ((FlightDTO)goodsDTO).getDtime());
		st.setInt(7, ((FlightDTO)goodsDTO).getPrice());
		st.setString(8, ((FlightDTO)goodsDTO).getCompany());
		result=st.executeUpdate();
		
		sql="select max(num) from flight";
		st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}

	@Override
	public int update(Connection con, GoodsDTO goodsDTO) throws Exception {
		PreparedStatement st=null;
		String sql="update flight set name=?, pnum=?, dcity=?, acity=?, atime=?, dtime=?, price=?, company=? where num=?";
		st=con.prepareStatement(sql);
		st.setString(1, goodsDTO.getName());
		st.setInt(2, ((FlightDTO)goodsDTO).getPnum());
		st.setInt(3, ((FlightDTO)goodsDTO).getDcity());
		st.setInt(4, ((FlightDTO)goodsDTO).getAcity());
		st.setString(5, ((FlightDTO)goodsDTO).getAtime());
		st.setString(6, ((FlightDTO)goodsDTO).getDtime());
		st.setInt(7, ((FlightDTO)goodsDTO).getPrice());
		st.setString(8, ((FlightDTO)goodsDTO).getCompany());
		st.setInt(9, goodsDTO.getNum());
		int result=0;
		result=st.executeUpdate();
		
		return result;
	}

	@Override
	public int delete(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="delete from flight where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		result=st.executeUpdate();
		return result;
	}

	@Override
	public int getTotalCount(Connection con, String kind, String search) throws Exception {
		PreparedStatement st=null;
		String sql="select count(num) from flight where "+kind+" like ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		int result=0;
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		return result;
	}

	@Override
	public int selectFileNum(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		String sql="select fnum from flight where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		int fnum=0;
		rs.next();
		fnum=rs.getInt(1);
		return fnum;
	}

}
