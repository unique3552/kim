package com.tour.goods;

import java.sql.Connection;
import java.util.List;

import com.tour.util.RowMaker;

public interface GoodsDAO {

	// list
	public List<GoodsDTO> selectList(Connection con, String kind, String search, RowMaker rowMaker) throws Exception;

	// select one
	public GoodsDTO selectOne(Connection con, int num) throws Exception;

	// insert
	public int insert(Connection con, GoodsDTO goodsDTO) throws Exception;

	// update
	public int update(Connection con, GoodsDTO goodsDTO) throws Exception;

	// delete
	public int delete(Connection con, int num) throws Exception;


	public int getTotalCount(Connection con, String kind, String search) throws Exception;
	
	
	public int selectFileNum(Connection con, int num) throws Exception;

}
