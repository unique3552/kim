package com.tour.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tour.board.BoardDAO;
import com.tour.board.BoardDTO;
import com.tour.util.RowMaker;

public class NoticeDAO implements BoardDAO {

	@Override
	public List<BoardDTO> selectList(Connection con, String kind, String search, RowMaker rowMaker) throws Exception {
		List<BoardDTO> ar=new ArrayList<>();
		PreparedStatement st=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from notice where "+kind+" like ? order by num desc) t)"
				+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, rowMaker.getStartRow());
		st.setInt(3, rowMaker.getLastRow());
		ResultSet rs=st.executeQuery();
		NoticeDTO noticeDTO=null;
		while(rs.next()){
			noticeDTO=new NoticeDTO();
			noticeDTO.setNum(rs.getInt("num"));
	        noticeDTO.setTitle(rs.getString("title"));
	        noticeDTO.setWriter(rs.getString("writer"));
	        noticeDTO.setContents(rs.getString("contents"));
	        noticeDTO.setReg_date(rs.getDate("reg_date"));
	        noticeDTO.setHit(rs.getInt("hit"));
	        noticeDTO.setFnum(rs.getInt("fnum"));
	        ar.add(noticeDTO);
		}
		return ar;
	}

	@Override
	public BoardDTO selectOne(Connection con, int num) throws Exception {
		 PreparedStatement st = null;
	      ResultSet rs = null;
	      NoticeDTO noticeDTO = new NoticeDTO();
	      
	      String sql;
	      
	      sql = "select * from notice where num=?";
	      
	      st = con.prepareStatement(sql);
	      st.setInt(1, num);
	      rs = st.executeQuery();
	      
	      if(rs.next()) {
	         noticeDTO = new NoticeDTO();
	         noticeDTO.setNum(rs.getInt("num"));
	         noticeDTO.setTitle(rs.getString("title"));
	         noticeDTO.setWriter(rs.getString("writer"));
	         noticeDTO.setContents(rs.getString("contents"));
	         noticeDTO.setReg_date(rs.getDate("reg_date"));
	         noticeDTO.setHit(rs.getInt("hit"));
	         noticeDTO.setFnum(rs.getInt("fnum"));
	         this.hitUpdate(con, num, true);
	      }
	      
	      return noticeDTO;
	}

	@Override
	public int insert(Connection con, BoardDTO boardDTO) throws Exception {
		PreparedStatement st=null;
		String sql="insert into notice values(notice_seq.nextval,?,?,?,sysdate,0,file_seq.nextval)";
		st=con.prepareStatement(sql);
		st.setString(1, boardDTO.getTitle());
		st.setString(2, boardDTO.getContents());
		st.setString(3, boardDTO.getWriter());
		int result=0;
		result=st.executeUpdate();
		
		sql="select max(num) from notice";
		st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}

	@Override
	public int update(Connection con, BoardDTO boardDTO) throws Exception {
		 PreparedStatement st = null;
	      int result = 0;
	      
	      NoticeDTO noticeDTO = (NoticeDTO)boardDTO;
	      
	      String sql;
	      sql = "update notice set title=?, contents=? where num=?";
	      st = con.prepareStatement(sql);
	      st.setString(1, noticeDTO.getTitle());
	      st.setString(2, noticeDTO.getContents());
	      st.setInt(3, noticeDTO.getNum());
	      this.hitUpdate(con, noticeDTO.getNum(), false);
	      result = st.executeUpdate();
	      
	      return result;

	}

	@Override
	public int hitUpdate(Connection con, int num, boolean check) throws Exception {
		PreparedStatement st=null;
		String sql="";
		if(check){
			sql="update notice set hit=hit+1 where num=?";
		}else{
			sql="update notice set hit=hit-1 where num=?";
		}
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=st.executeUpdate();
		
		return result;
	}

	@Override
	public int delete(Connection con, int num) throws Exception {
		  PreparedStatement st = null;
	      
	      String sql;
	      sql = "delete notice where num=?";
	      
	      st = con.prepareStatement(sql);
	      st.setInt(1, num);
	      num = st.executeUpdate();
	      
	      return num;

	}

	@Override
	public int getTotalCount(Connection con, String kind, String search) throws Exception {
		int result=0;
		PreparedStatement st=null;
		String sql="select count(num) from notice where "+kind+" like ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}

	@Override
	public int selectFileNum(Connection con, int num) throws Exception {
		int result=0;
		PreparedStatement st=null;
		String sql="select fnum from notice where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}

}
