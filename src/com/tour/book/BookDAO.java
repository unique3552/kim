package com.tour.book;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tour.util.RowMaker;

public class BookDAO {
	
	public int selectGoods(Connection con, int num) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		int goods = 0;
		
		String sql = "select goods from book where num=?";
		st = con.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeQuery();
		
		result.next();
		goods=result.getInt(1);
		
		return goods;
	}

	public int update(Connection con, String status, int usePoint, int num) throws Exception {
		PreparedStatement st = null;
		int result = 0;
		
		String sql = "update book set status=?, usepoint=? where num=?";
		st = con.prepareStatement(sql);
		st.setString(1, status);
		st.setInt(2, usePoint);
		st.setInt(3, num);
		result = st.executeUpdate();
		
		return result;
	}
	
	public List<BookDTO> selectList(Connection con, RowMaker rowMaker, int goods, int member) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		BookDTO bookDTO = null;
		List<BookDTO> ar = new ArrayList<>();
		
		String sql = "select * from "
				+ "(select rownum r, b.* from "
				+ "(select * from book where goods=? and member=? order by num desc) b) "
				+ "where r between ? and ?";
		st = con.prepareStatement(sql);
		st.setInt(1, goods);
		st.setInt(2, member);
		st.setInt(3, rowMaker.getStartRow());
		st.setInt(4, rowMaker.getLastRow());
		result = st.executeQuery();
		
		while (result.next()) {
			bookDTO = new BookDTO();
			bookDTO.setNum(result.getInt("num"));
			bookDTO.setGoods(result.getInt("goods"));
			bookDTO.setPnum(result.getInt("pnum"));
			bookDTO.setTprice(result.getInt("tprice"));
			bookDTO.setMember(result.getInt("member"));
			bookDTO.setGnum(result.getInt("gnum"));
			bookDTO.setDay(result.getDate("day"));
			bookDTO.setSdate(result.getDate("sdate"));
			bookDTO.setLdate(result.getDate("ldate"));
			bookDTO.setStatus(result.getString("status"));
			bookDTO.setBank(result.getString("bank"));
			bookDTO.setDname(result.getString("dname"));
			bookDTO.setUsepoint(result.getInt("usepoint"));
			bookDTO.setWon(result.getInt("won"));
			bookDTO.setPmethod(result.getString("pmethod"));
			ar.add(bookDTO);
		}
		
		return ar;
	}
	
	public int insert(Connection con, BookDTO bookDTO) throws Exception {
		PreparedStatement st = null;
		int result = 0;
		
		String sql = "insert into book values(book_seq.nextval, ?, ?, ?, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, ?, ?)";
		st = con.prepareStatement(sql);
		st.setInt(1, bookDTO.getGoods());
		st.setInt(2, bookDTO.getPnum());
		st.setInt(3, bookDTO.getTprice());
		st.setInt(4, bookDTO.getMember());
		st.setInt(5, bookDTO.getGnum());
		st.setDate(6, bookDTO.getSdate());
		st.setDate(7, bookDTO.getLdate());
		st.setString(8, bookDTO.getStatus());
		st.setString(9, bookDTO.getBank());
		st.setString(10, bookDTO.getDname());
		st.setInt(11, bookDTO.getUsepoint());
		st.setInt(12, bookDTO.getWon());
		st.setString(13, bookDTO.getPmethod());
		result = st.executeUpdate();
		
		return result;		
	}
	
	public BookDTO selectOne(Connection con, int num) throws Exception {
		PreparedStatement st = null;
		ResultSet result = null;
		BookDTO bookDTO = null;
		
		String sql ="select * from book where num=?";
		st = con.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeQuery();
		
		if (result.next()) {
			bookDTO = new BookDTO();
			bookDTO.setNum(result.getInt("num"));
			bookDTO.setGoods(result.getInt("goods"));
			bookDTO.setPnum(result.getInt("pnum"));
			bookDTO.setTprice(result.getInt("tprice"));
			bookDTO.setMember(result.getInt("member"));
			bookDTO.setGnum(result.getInt("gnum"));
			bookDTO.setDay(result.getDate("day"));
			bookDTO.setSdate(result.getDate("sdate"));
			bookDTO.setLdate(result.getDate("ldate"));
			bookDTO.setStatus(result.getString("status"));
			bookDTO.setBank(result.getString("bank"));
			bookDTO.setDname(result.getString("dname"));
			bookDTO.setUsepoint(result.getInt("usepoint"));
			bookDTO.setWon(result.getInt("won"));
			bookDTO.setPmethod(result.getString("pmethod"));
		}
		
		return bookDTO;
	}
	
	public Date selectDate(Connection con, int num) throws Exception {
		PreparedStatement st = null;
		Date date = null;
		ResultSet result = null;
		
		String sql ="select day from book where num=?";
		st = con.prepareStatement(sql);
		st.setInt(1, num);
		result = st.executeQuery();
		
		if (result.next()) {
			date = result.getDate("day");
		}
		
		return date;
	}
	
	public int getTotalCount(Connection con , int num, int member) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="select count(num) from book where goods=? and member=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		st.setInt(2, member);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}
}
