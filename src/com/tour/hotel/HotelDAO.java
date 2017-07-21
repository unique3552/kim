package com.tour.hotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tour.goods.GoodsDAO;
import com.tour.goods.GoodsDTO;
import com.tour.util.RowMaker;

public class HotelDAO implements GoodsDAO {

	
	public List<GoodsDTO> selectRegionList(Connection con, int location, String name, RowMaker rowMaker) throws SQLException{
		PreparedStatement st=null;
		List<GoodsDTO> ar=new ArrayList<>();
		HotelDTO hotelDTO=null;
		ResultSet rs=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from hotel where location=? and name like ? order by num asc) t)"
				+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setInt(1, location);
		st.setString(2, "%"+name+"%");
		st.setInt(3, rowMaker.getStartRow());
		st.setInt(4, rowMaker.getLastRow());
		rs=st.executeQuery();
		while(rs.next()){
			hotelDTO=new HotelDTO();
			hotelDTO.setNum(rs.getInt("num"));
			hotelDTO.setGoods(rs.getInt("goods"));
			hotelDTO.setLocation(rs.getInt("location"));
			hotelDTO.setFnum(rs.getInt("fnum"));
			hotelDTO.setName(rs.getString("name"));
			hotelDTO.setGnum(rs.getInt("gnum"));
			hotelDTO.setImg(rs.getString("img"));
			hotelDTO.setAddress(rs.getString("address"));
			ar.add(hotelDTO);
		}
		return ar;
	}
	@Override
	public List<GoodsDTO> selectList(Connection con, String kind, String search, RowMaker rowMaker) throws Exception {
		PreparedStatement st=null;
		List<GoodsDTO> ar=new ArrayList<>();
		HotelDTO hotelDTO=null;
		ResultSet rs=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from hotel where "+kind+" like ? order by num asc) t)"
				+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, rowMaker.getStartRow());
		st.setInt(3, rowMaker.getLastRow());
		rs=st.executeQuery();
		while(rs.next()){
			hotelDTO=new HotelDTO();
			hotelDTO.setNum(rs.getInt("num"));
			hotelDTO.setGoods(rs.getInt("goods"));
			hotelDTO.setLocation(rs.getInt("location"));
			hotelDTO.setFnum(rs.getInt("fnum"));
			hotelDTO.setName(rs.getString("name"));
			hotelDTO.setGnum(rs.getInt("gnum"));
			hotelDTO.setImg(rs.getString("img"));
			hotelDTO.setAddress(rs.getString("address"));
			ar.add(hotelDTO);
		}
		return ar;
	}

	@Override
	public GoodsDTO selectOne(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		String sql="select * from hotel where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		HotelDTO hotelDTO=null;
		if(rs.next()){
			hotelDTO=new HotelDTO();
			hotelDTO.setNum(rs.getInt("num"));
			hotelDTO.setGoods(rs.getInt("goods"));
			hotelDTO.setLocation(rs.getInt("location"));
			hotelDTO.setFnum(rs.getInt("fnum"));
			hotelDTO.setName(rs.getString("name"));
			hotelDTO.setGnum(rs.getInt("gnum"));
			hotelDTO.setImg(rs.getString("img"));
			hotelDTO.setAddress(rs.getString("address"));
		}
		return hotelDTO;
	}

	@Override
	public int insert(Connection con, GoodsDTO goodsDTO) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="insert into hotel values(hotel_seq.nextval,?,?,1,file_seq.nextval,?,?,?)";
		st=con.prepareStatement(sql);
		st.setString(1, goodsDTO.getName());
		st.setInt(2, ((HotelDTO)goodsDTO).getGnum());
		st.setString(3, goodsDTO.getImg());
		st.setInt(4, ((HotelDTO)goodsDTO).getLocation());
		st.setString(5, ((HotelDTO)goodsDTO).getAddress());
		result=st.executeUpdate();
		
		sql="select max(num) from hotel";
		st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		rs.next();
		int hnum=rs.getInt(1);
		
		sql="insert into room values(room_seq.nextval,'Standard Single',1,43205,?,6)";
		st=con.prepareStatement(sql);
		st.setInt(1, hnum);
		result=st.executeUpdate();
		
		sql="insert into room values(room_seq.nextval,'Standard Semi Double',2,88555,?,6)";
		st=con.prepareStatement(sql);
		st.setInt(1, hnum);
		result=st.executeUpdate();
		
		sql="insert into room values(room_seq.nextval,'Standard Double',2,98809,?,6)";
		st=con.prepareStatement(sql);
		st.setInt(1, hnum);
		result=st.executeUpdate();
		
		sql="insert into room values(room_seq.nextval,'Standard Twin',2,105644,?,6)";
		st=con.prepareStatement(sql);
		st.setInt(1, hnum);
		result=st.executeUpdate();
		
		sql="insert into room values(room_seq.nextval,'Standard Triple',3,146980,?,6)";
		st=con.prepareStatement(sql);
		st.setInt(1, hnum);
		result=st.executeUpdate();
		
		
		return result;
	}

	@Override
	public int update(Connection con, GoodsDTO goodsDTO) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="update hotel set name=?, gnum=?, location=?, img=?, address=? where num=?";
		st=con.prepareStatement(sql);
		st.setString(1, goodsDTO.getName());
		st.setInt(2, ((HotelDTO)goodsDTO).getGnum());
		st.setInt(3, ((HotelDTO)goodsDTO).getLocation());
		st.setString(4, ((HotelDTO)goodsDTO).getImg());
		st.setString(5, ((HotelDTO)goodsDTO).getAddress());
		st.setInt(6, goodsDTO.getNum());
		result=st.executeUpdate();
		return result;
	}
	
	public int notImgUpdate(Connection con, HotelDTO hotelDTO) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="update hotel set name=?, gnum=?, location=?, address=? where num=?";
		st=con.prepareStatement(sql);
		st.setString(1, hotelDTO.getName());
		st.setInt(2, hotelDTO.getGnum());
		st.setInt(3, hotelDTO.getLocation());
		st.setString(4, hotelDTO.getAddress());
		st.setInt(5, hotelDTO.getNum());
		result=st.executeUpdate();
		
		return result;
	}

	@Override
	public int delete(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="delete from hotel where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		result=st.executeUpdate();
		return result;
	}

	@Override
	public int getTotalCount(Connection con, String kind, String search) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="select count(num) from hotel where "+kind+" like ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		return result;
	}
	
	public int getTotalCount(Connection con, int location, String name) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="select count(num) from hotel where location=? and name like ?";
		st=con.prepareStatement(sql);
		st.setInt(1, location);
		st.setString(2, "%"+name+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		return result;
	}

	@Override
	public int selectFileNum(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		int fnum=0;
		String sql="select fnum from hotel where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		rs.next();
		fnum=rs.getInt(1);
		
		return fnum;
	}

}
