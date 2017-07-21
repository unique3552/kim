package com.tour.tPackage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tour.goods.GoodsDAO;
import com.tour.goods.GoodsDTO;
import com.tour.util.RowMaker;

public class TPackageDAO implements GoodsDAO {

	// admin Package
	public List<TPackageDTO> selectAdminList(Connection con, int anum) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		List<TPackageDTO> ar = new ArrayList<>();
		TPackageDTO tPackageDTO = null;
		
		String sql = "select * from tpackage where admin=?";
		st = con.prepareStatement(sql);
		st.setInt(1, anum);
		result = st.executeQuery();
		
		while (result.next()) {
			tPackageDTO = new TPackageDTO();
			tPackageDTO.setNum(result.getInt("num"));
			tPackageDTO.setName(result.getString("name"));
			tPackageDTO.setFnum(result.getInt("fnum"));
			tPackageDTO.setHnum(result.getInt("hnum"));
			tPackageDTO.setPrice(result.getInt("price"));
			tPackageDTO.setAdmin(result.getInt("admin"));
			tPackageDTO.setNation(result.getString("nation"));
			tPackageDTO.setPnum(result.getInt("pnum"));
			tPackageDTO.setGoods(result.getInt("goods"));
			tPackageDTO.setFnum(result.getInt("fnum"));
			ar.add(tPackageDTO);
		}
		return ar;
	}
	
	public int notImgUpdate(Connection con, TPackageDTO tPackageDTO) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="update tpackage set name=?, afnum=?, hnum=?, dfnum=?, price=?, nation=?, pnum=? where num=?";
		st=con.prepareStatement(sql);
		st.setString(1, tPackageDTO.getName());
		st.setInt(2, tPackageDTO.getAfnum());
		st.setInt(3, tPackageDTO.getHnum());
		st.setInt(4, tPackageDTO.getDfnum());
		st.setInt(5, tPackageDTO.getPrice());
		st.setString(6, tPackageDTO.getNation());
		st.setInt(7, tPackageDTO.getPnum());
		st.setInt(8, tPackageDTO.getNum());
		result=st.executeUpdate();
		
		return result;
	}
	
	@Override
	public List<GoodsDTO> selectList(Connection con, String kind, String search, RowMaker rowMaker) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<TPackageDTO> selectList(Connection con, RowMaker rowMaker, String nation) throws Exception{
		List<TPackageDTO> ar=new ArrayList<>();
		TPackageDTO tPackageDTO=null;
		PreparedStatement st=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from tpackage where nation like ? order by num asc) t)"
				+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setString(1, nation);
		st.setInt(2, rowMaker.getStartRow());
		st.setInt(3, rowMaker.getLastRow());
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			tPackageDTO=new TPackageDTO();
			tPackageDTO.setNum(rs.getInt("num"));
			tPackageDTO.setName(rs.getString("name"));
			tPackageDTO.setAfnum(rs.getInt("afnum"));
			tPackageDTO.setDfnum(rs.getInt("dfnum"));
			tPackageDTO.setHnum(rs.getInt("hnum"));
			tPackageDTO.setPrice(rs.getInt("price"));
			tPackageDTO.setAdmin(rs.getInt("admin"));
			tPackageDTO.setGoods(rs.getInt("goods"));
			tPackageDTO.setFnum(rs.getInt("fnum"));
			tPackageDTO.setImg(rs.getString("img"));
			tPackageDTO.setNation(rs.getString("nation"));
			tPackageDTO.setPnum(rs.getInt("pnum"));
			ar.add(tPackageDTO);
		}
		return ar;
	}

	@Override
	public GoodsDTO selectOne(Connection con, int num) throws Exception {
		TPackageDTO tPackageDTO=null;
		PreparedStatement st=null;
		String sql="select * from tpackage where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		if(rs.next()){
			tPackageDTO=new TPackageDTO();
			tPackageDTO.setNum(rs.getInt("num"));
			tPackageDTO.setName(rs.getString("name"));
			tPackageDTO.setAfnum(rs.getInt("afnum"));
			tPackageDTO.setDfnum(rs.getInt("dfnum"));
			tPackageDTO.setHnum(rs.getInt("hnum"));
			tPackageDTO.setPrice(rs.getInt("price"));
			tPackageDTO.setAdmin(rs.getInt("admin"));
			tPackageDTO.setGoods(rs.getInt("goods"));
			tPackageDTO.setFnum(rs.getInt("fnum"));
			tPackageDTO.setImg(rs.getString("img"));
			tPackageDTO.setNation(rs.getString("nation"));
			tPackageDTO.setPnum(rs.getInt("pnum"));
		}
		return tPackageDTO;
	}

	@Override
	public int insert(Connection con, GoodsDTO goodsDTO) throws Exception {
		PreparedStatement st=null;
		String sql="insert into tpackage values(tpackage_seq.nextval,?,?,?,?,?,?,?,?,5,file_seq.nextval,?)";
		int result=0;
		st=con.prepareStatement(sql);
		st.setString(1, ((TPackageDTO)goodsDTO).getName());
		st.setInt(2, ((TPackageDTO)goodsDTO).getAfnum());
		st.setInt(3, ((TPackageDTO)goodsDTO).getHnum());
		st.setInt(4, ((TPackageDTO)goodsDTO).getPnum());
		st.setInt(5, ((TPackageDTO)goodsDTO).getPrice());
		st.setInt(6, ((TPackageDTO)goodsDTO).getAdmin());
		st.setString(7, ((TPackageDTO)goodsDTO).getNation());
		st.setInt(8, ((TPackageDTO)goodsDTO).getDfnum());
		st.setString(9, ((TPackageDTO)goodsDTO).getImg());
		result=st.executeUpdate();
		return result;
	}

	@Override
	public int update(Connection con, GoodsDTO goodsDTO) throws Exception {
		int result=0;
		PreparedStatement st=null;
		String sql="update tpackage set name=?, afnum=?, hnum=?, dfnum=?, price=?, nation=?, pnum=?, img=? where num=?";
		st=con.prepareStatement(sql);
		st.setString(1, ((TPackageDTO)goodsDTO).getName());
		st.setInt(2, ((TPackageDTO)goodsDTO).getAfnum());
		st.setInt(3, ((TPackageDTO)goodsDTO).getHnum());
		st.setInt(4, ((TPackageDTO)goodsDTO).getDfnum());
		st.setInt(5, ((TPackageDTO)goodsDTO).getPrice());
		st.setString(6, ((TPackageDTO)goodsDTO).getNation());
		st.setInt(7, ((TPackageDTO)goodsDTO).getPnum());
		st.setString(8, ((TPackageDTO)goodsDTO).getImg());
		st.setInt(9, ((TPackageDTO)goodsDTO).getNum());
		result=st.executeUpdate();
		
		return result;
	}

	@Override
	public int delete(Connection con, int num) throws Exception {
		int result=0;
		PreparedStatement st=null;
		String sql="delete from tpackage where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		result=st.executeUpdate();
		return result;
	}

	@Override
	public int getTotalCount(Connection con, String kind, String search) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectFileNum(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		String sql="select fnum from tpackage where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		rs.next();
		int result=rs.getInt(1);
		return result;
	}

}
