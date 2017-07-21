package com.tour.freeBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tour.board.BoardDAO;
import com.tour.board.BoardDTO;
import com.tour.util.RowMaker;

public class FreeBoardDAO implements BoardDAO {


	@Override
	public List<BoardDTO> selectList(Connection con, String kind, String search, RowMaker rowMaker) throws Exception {
		PreparedStatement st=null;
		String sql="select * from "
				+ "(select rownum r, t.* from "
				+ "(select * from freeboard where "+kind+" like ? order by ref desc, step asc) t)"
				+ " where r between ? and ?";
		st=con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, rowMaker.getStartRow());
		st.setInt(3, rowMaker.getLastRow());
		List<BoardDTO> ar=new ArrayList<>();
		FreeBoardDTO freeboardDTO=null;
		ResultSet rs=st.executeQuery();
		while(rs.next()){
			freeboardDTO=new FreeBoardDTO();
			freeboardDTO.setNum(rs.getInt("num"));
			freeboardDTO.setTitle(rs.getString("title"));
			freeboardDTO.setContents(rs.getString("contents"));
			freeboardDTO.setWriter(rs.getString("writer"));
			freeboardDTO.setReg_date(rs.getDate("reg_date"));
			freeboardDTO.setHit(rs.getInt("hit"));
			freeboardDTO.setRef(rs.getInt("ref"));
			freeboardDTO.setStep(rs.getInt("step"));
			freeboardDTO.setDepth(rs.getInt("depth"));
			freeboardDTO.setFnum(rs.getInt("fnum"));
			ar.add(freeboardDTO);
		}
		return ar;
	}

	@Override
	public BoardDTO selectOne(Connection con, int num) throws Exception {
		PreparedStatement st=null;
		ResultSet rs=null;
		FreeBoardDTO freeboardDTO=null;
		String sql="select * from freeboard where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		rs=st.executeQuery();
		if(rs.next()){
			freeboardDTO=new FreeBoardDTO();
			freeboardDTO.setNum(rs.getInt("num"));
			freeboardDTO.setTitle(rs.getString("title"));
			freeboardDTO.setContents(rs.getString("contents"));
			freeboardDTO.setWriter(rs.getString("writer"));
			freeboardDTO.setReg_date(rs.getDate("reg_date"));
			freeboardDTO.setHit(rs.getInt("hit"));
			freeboardDTO.setRef(rs.getInt("ref"));
			freeboardDTO.setStep(rs.getInt("step"));
			freeboardDTO.setDepth(rs.getInt("depth"));
			freeboardDTO.setFnum(rs.getInt("fnum"));
			this.hitUpdate(con, num, true);
		}
		return freeboardDTO;
	}

	@Override
	public int insert(Connection con, BoardDTO boardDTO) throws Exception {
		int result=0;
		PreparedStatement st=null;
		String sql="insert into freeboard values(freeboard_seq.nextval,?,?,?,sysdate,0,freeboard_seq.currval,0,0,file_seq.nextval)";
		st=con.prepareStatement(sql);
		st.setString(1, boardDTO.getTitle());
		st.setString(2, boardDTO.getContents());
		st.setString(3, boardDTO.getWriter());
		result=st.executeUpdate();
		
		sql="select max(num) from freeboard";
		st=con.prepareStatement(sql);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}

	@Override
	public int update(Connection con, BoardDTO boardDTO) throws Exception {
		int result=0;
		PreparedStatement st=null;
		String sql="update freeboard set title=?, contents=? where num=?";
		st=con.prepareStatement(sql);
		st.setString(1, boardDTO.getTitle());
		st.setString(2, boardDTO.getContents());
		st.setInt(3, boardDTO.getNum());
		this.hitUpdate(con, boardDTO.getNum(), false);
		result=st.executeUpdate();
		
		return result;
	}

	@Override
	public int hitUpdate(Connection con, int num, boolean check) throws Exception {
		PreparedStatement st=null;
		String sql="";
		if(check){
			sql="update freeboard set hit=hit+1 where num=?";
		}else{
			sql="update freeboard set hit=hit-1 where num=?";
		}
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		int result=0;
		result=st.executeUpdate();
		
		return result;
	}

	@Override
	public int delete(Connection con, int num) throws Exception {
		int result=0;
		PreparedStatement st=null;
		String sql="delete from freeboard where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		result=st.executeUpdate();
		
		return result;
	}
	
	public int reply(Connection con,FreeBoardDTO freeboardDTO) throws Exception {
		int result=0;
		PreparedStatement st=null;
		FreeBoardDTO parentDTO=(FreeBoardDTO)this.selectOne(con, freeboardDTO.getNum());
		result=this.stepUpdate(con, parentDTO);
		String sql="insert into freeboard values(freeboard_seq.nextval,?,?,?,sysdate,0,?,?,?,file_seq.nextval)";
		st=con.prepareStatement(sql);
		st.setString(1, freeboardDTO.getTitle());
		st.setString(2, freeboardDTO.getContents());
		st.setString(3, freeboardDTO.getWriter());
		st.setInt(4, parentDTO.getRef());
		st.setInt(5, parentDTO.getStep()+1);
		st.setInt(6, parentDTO.getDepth()+1);
		result=st.executeUpdate();
		
		return result;
	}
	
	public int stepUpdate(Connection con, FreeBoardDTO parentDTO) throws Exception{
		int result=0;
		PreparedStatement st=null;
		String sql="update freeboard set step=step+1 where ref=? and step>?";
		st=con.prepareStatement(sql);
		st.setInt(1, parentDTO.getRef());
		st.setInt(2, parentDTO.getStep());
		result=st.executeUpdate();
		
		return result;
	}

	@Override
	public int getTotalCount(Connection con, String kind, String search) throws Exception {
		int result=0;
		PreparedStatement st=null;
		String sql="select count(num) from freeboard where "+kind+" like ?";
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
		String sql="select fnum from freeboard where num=?";
		st=con.prepareStatement(sql);
		st.setInt(1, num);
		ResultSet rs=st.executeQuery();
		rs.next();
		result=rs.getInt(1);
		
		return result;
	}

}
