package com.tour.rentCar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tour.goods.GoodsDAO;
import com.tour.goods.GoodsDTO;
import com.tour.util.RowMaker;

public class RentCarDAO implements GoodsDAO {

	@Override
	public List<GoodsDTO> selectList(Connection con, String kind, String search, RowMaker rowMaker) throws Exception {
		PreparedStatement st=null;
		List<GoodsDTO> ar=new ArrayList<>();
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from rentcar where "+kind+" like ? order by num asc) t)"
						+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, rowMaker.getStartRow());
		st.setInt(3, rowMaker.getLastRow());
		ResultSet rs=st.executeQuery();
		RentCarDTO rentCarDTO=null;
		while(rs.next()){
			rentCarDTO=new RentCarDTO();
			rentCarDTO.setNum(rs.getInt("num"));
			rentCarDTO.setName(rs.getString("name"));
			rentCarDTO.setPrice(rs.getInt("price"));
			rentCarDTO.setGoods(rs.getInt("goods"));
			rentCarDTO.setImg(rs.getString("img"));
			rentCarDTO.setLocation(rs.getInt("location"));
			rentCarDTO.setKind(rs.getString("kind"));
			ar.add(rentCarDTO);
		}
		
		return ar;
	}
	
	public List<GoodsDTO> selectList(Connection con, String kind, int location, RowMaker rowMaker) throws Exception {
		PreparedStatement st=null;
		List<GoodsDTO> ar=new ArrayList<>();
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from rentcar where kind=? and location=? order by num asc) t)"
						+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setString(1, kind);
		st.setInt(2, location);
		st.setInt(3, rowMaker.getStartRow());
		st.setInt(4, rowMaker.getLastRow());
		ResultSet rs=st.executeQuery();
		RentCarDTO rentCarDTO=null;
		while(rs.next()){
			rentCarDTO=new RentCarDTO();
			rentCarDTO.setNum(rs.getInt("num"));
			rentCarDTO.setName(rs.getString("name"));
			rentCarDTO.setPrice(rs.getInt("price"));
			rentCarDTO.setGoods(rs.getInt("goods"));
			rentCarDTO.setImg(rs.getString("img"));
			rentCarDTO.setLocation(rs.getInt("location"));
			rentCarDTO.setKind(rs.getString("kind"));
			ar.add(rentCarDTO);
		}
		
		return ar;
	}

	@Override
	public GoodsDTO selectOne(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		RentCarDTO rentCarDTO=null;
		String sql="select * from rentcar where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		if(rs.next()){
			rentCarDTO=new RentCarDTO();
			rentCarDTO.setNum(rs.getInt("num"));
			rentCarDTO.setName(rs.getString("name"));
			rentCarDTO.setPrice(rs.getInt("price"));
			rentCarDTO.setGoods(rs.getInt("goods"));
			rentCarDTO.setImg(rs.getString("img"));
			rentCarDTO.setLocation(rs.getInt("location"));
			rentCarDTO.setKind(rs.getString("kind"));
		}
		return rentCarDTO;
	}

	@Override
	public int insert(Connection con, GoodsDTO goodsDTO) throws Exception {
		PreparedStatement st=null;
		int result=0;
		String sql="insert into rentcar values(rentcar_seq.nextval,?,?,3,?,?,?)";
		st=con.prepareStatement(sql);
		st.setString(1, goodsDTO.getName());
		st.setInt(2, ((RentCarDTO)goodsDTO).getPrice());
		st.setString(3, goodsDTO.getImg());
		st.setInt(4, ((RentCarDTO)goodsDTO).getLocation());
		st.setString(5, ((RentCarDTO)goodsDTO).getKind());
		result=st.executeUpdate();
		
		sql="select max(num) from rentcar";
		st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		return result;
	}

	@Override
	public int update(Connection con, GoodsDTO goodsDTO) throws Exception {
		PreparedStatement st=null;
		String sql="update rentcar set name=?, price=?";
		st=con.prepareStatement(sql);
		st.setString(1, goodsDTO.getName());
		st.setInt(2, ((RentCarDTO)goodsDTO).getPrice());
		int result=0;
		result=st.executeUpdate();
		return result;
	}

	@Override
	public int delete(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		String sql="delete from rentcar where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=0;
		result=st.executeUpdate();
		return result;
	}

	@Override
	public int getTotalCount(Connection con, String kind, String search) throws Exception {
		PreparedStatement st=null;
		String sql="select count(num) from rentcar where "+kind+" like ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		int result=0;
		result=rs.getInt(1);
		return result;
	}

	@Override
	public int selectFileNum(Connection con, int num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
