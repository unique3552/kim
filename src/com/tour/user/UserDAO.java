package com.tour.user;

import java.sql.Connection;

public interface UserDAO {
	
	// login
	public UserDTO login(Connection con, UserDTO userDTO) throws Exception;
	
	// delete
	public int delete(Connection con, int num) throws Exception;
	
	// update
	public int update(Connection con, UserDTO userDTO) throws Exception;
	
	// selectOne
	public int selectOne(Connection con, String id) throws Exception;
}
