package com.tour.ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tour.goods.GoodsDAO;
import com.tour.goods.GoodsDTO;
import com.tour.util.RowMaker;

public class TicketDAO implements GoodsDAO {
   
   public List<GoodsDTO> selectListName(Connection con, int location, RowMaker rowMaker) throws Exception {
      PreparedStatement st = null;
      List<GoodsDTO> ar = new ArrayList<>();
      TicketDTO ticketDTO = null;
      ResultSet result = null;
      
      String sql = "select * from "
            + "(select rownum r, t2.* from "
            + "(select t.name, t.img, min(price) from "
            + "(select num, name, img, price from ticket where location=?) t "
            + "group by t.name, img) t2) "
            + "where r between ? and ?";
      st = con.prepareStatement(sql);
      st.setInt(1, location);
      st.setInt(2, rowMaker.getStartRow());
      st.setInt(3, rowMaker.getLastRow());
      result = st.executeQuery();
      
      while (result.next()) {
         ticketDTO = new TicketDTO();
         ticketDTO.setName(result.getString("name"));
         ticketDTO.setImg(result.getString("img"));
         ticketDTO.setPrice(result.getInt("min(price)"));
         ar.add(ticketDTO);
      }
      
      return ar;
   }
   
   @Override
   public List<GoodsDTO> selectList(Connection con, String kind, String search, RowMaker rowMaker) throws Exception {
      PreparedStatement st = null;
      List<GoodsDTO> ar = new ArrayList<>();
      TicketDTO ticketDTO = null;
      ResultSet result = null;
      
      String sql = "select * from "
            + "(select rownum r, t.* from "
            + "(select * from ticket where "+kind+" like ? order by num asc) t) "
            + "where r between ? and ?";
      st = con.prepareStatement(sql);
      st.setString(1, "%"+search+"%");
      st.setInt(2, rowMaker.getStartRow());
      st.setInt(3, rowMaker.getLastRow());
      result = st.executeQuery();
      
      while (result.next()) {
         ticketDTO = new TicketDTO();
         ticketDTO.setNum(result.getInt("num"));
         ticketDTO.setName(result.getString("name"));
         ticketDTO.setGoods(result.getInt("good"));
         ticketDTO.setImg(result.getString("img"));
         ticketDTO.setLocation(result.getInt("location"));
         ticketDTO.setKind(result.getString("kind"));
         ticketDTO.setPrice(result.getInt("price"));
         ar.add(ticketDTO);
      }
      
      return ar;
   }

   public GoodsDTO selectKind(Connection con, String name) throws Exception {
      PreparedStatement st = null;
      ResultSet result = null;
      TicketDTO ticketDTO = null;
      
      String sql = "select * from ticket where name=?";
      st = con.prepareStatement(sql);
      st.setString(1, name);
      result = st.executeQuery();
      
      if (result.next()) {
         ticketDTO = new TicketDTO();
         ticketDTO.setNum(result.getInt("num"));
         ticketDTO.setName(result.getString("name"));
         ticketDTO.setGoods(result.getInt("goods"));
         ticketDTO.setImg(result.getString("img"));
         ticketDTO.setLocation(result.getInt("location"));
         ticketDTO.setKind(result.getString("kind"));
         ticketDTO.setPrice(result.getInt("price"));   
      }
      
      return ticketDTO; 
   }
   
   @Override
   public GoodsDTO selectOne(Connection con, int num) throws Exception {
      PreparedStatement st = null;
      ResultSet result = null;
      TicketDTO ticketDTO = null;
      
      String sql = "select * from ticket where num=?";
      st = con.prepareStatement(sql);
      st.setInt(1, num);
      result = st.executeQuery();
      
      while (result.next()) {
         ticketDTO = new TicketDTO();
         ticketDTO.setNum(result.getInt("num"));
         ticketDTO.setName(result.getString("name"));
         ticketDTO.setGoods(result.getInt("goods"));
         ticketDTO.setImg(result.getString("img"));
         ticketDTO.setLocation(result.getInt("location"));
         ticketDTO.setKind(result.getString("kind"));
         ticketDTO.setPrice(result.getInt("price"));
      }
      
      return ticketDTO;
   }

   @Override
   public int insert(Connection con, GoodsDTO goodsDTO) throws Exception {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int update(Connection con, GoodsDTO goodsDTO) throws Exception {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int delete(Connection con, int num) throws Exception {
      // TODO Auto-generated method stub
      return 0;
   }

   public int getTotalCount(Connection con, int location) throws Exception {
		PreparedStatement st = null;
		int rs = 0;
		ResultSet result = null;
		String sql="select count(num) from ticket where location=?";
		
		st = con.prepareStatement(sql);
		st.setInt(1, location);
		result = st.executeQuery();
		
		if (result.next()) {
			rs = result.getInt(1);
		}
		return rs;
	}
   
   @Override
   public int getTotalCount(Connection con, String kind, String search) throws Exception {
      // TODO Auto-generated method stub
      return 0;
   }

   @Override
   public int selectFileNum(Connection con, int num) throws Exception {
      // TODO Auto-generated method stub
      return 0;
   }

}