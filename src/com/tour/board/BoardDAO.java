package com.tour.board;

import java.sql.Connection;
import java.util.List;
import com.tour.util.RowMaker;

public interface BoardDAO {

	// list
	public List<BoardDTO> selectList(Connection con,String kind, String search, RowMaker rowMaker) throws Exception;
	
	// select one
	public BoardDTO selectOne(Connection con, int num) throws Exception;
	
	// insert
	public int insert(Connection con, BoardDTO boardDTO) throws Exception;
	
	// update
	public int update(Connection con, BoardDTO boardDTO) throws Exception;
	
	// hit update
	public int hitUpdate(Connection con, int num, boolean check) throws Exception;
	
	// delete
	public int delete(Connection con, int num) throws Exception;
	
	
	public int getTotalCount(Connection con, String kind, String search) throws Exception;
	
	
	public int selectFileNum(Connection con, int num) throws Exception;
	
}
