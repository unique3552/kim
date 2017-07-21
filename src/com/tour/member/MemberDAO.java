package com.tour.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.tour.user.UserDAO;
import com.tour.user.UserDTO;

public class MemberDAO implements UserDAO {

   @Override
   public int selectOne(Connection con, String id) throws Exception {
      PreparedStatement st = null;
      ResultSet result = null;
      int num = 0;
      
      String sql = "select num from member where id=?";
      st = con.prepareStatement(sql);
      st.setString(1, id);
      result = st.executeQuery();
      
      if (result.next()) {
         num = result.getInt("num");
      }
      
      return num;
   }
   
   // join
   public int join(Connection con, UserDTO userDTO) throws Exception {
      PreparedStatement st = null;
      MemberDTO memberDTO = (MemberDTO) userDTO;
      int result = 0;
      
      String sql = "insert into member values(user_seq.nextval, ?, ?, ?, ?, ?, '새싹')";
      st = con.prepareStatement(sql);
      st.setString(1, memberDTO.getId());
      st.setString(2, memberDTO.getPw());
      st.setString(3, memberDTO.getName());
      st.setString(4, memberDTO.getPhone());
      st.setString(5, memberDTO.getNation());
      result = st.executeUpdate();
      
      return result;
   }

   @Override
   public UserDTO login(Connection con, UserDTO userDTO) throws Exception {
      PreparedStatement st = null;
      MemberDTO memberDTO = null;
      ResultSet result = null;      
      
      String sql = "select * from member where id=? and pw=?";
      st = con.prepareStatement(sql);
      st.setString(1, userDTO.getId());
      st.setString(2, userDTO.getPw());
      result = st.executeQuery();
      
      if (result.next()) {
         memberDTO = new MemberDTO();
         memberDTO.setNum(result.getInt("num"));
         memberDTO.setId(result.getString("id"));
         memberDTO.setPw(result.getString("pw"));
         memberDTO.setName(result.getString("name"));
         memberDTO.setPhone(result.getString("phone"));
         memberDTO.setNation(result.getString("nation"));
         memberDTO.setGrade(result.getString("grade"));
      }
      
      return memberDTO;
   }

   @Override
   public int delete(Connection con, int num) throws Exception {
      PreparedStatement st = null;
      int result = 0;
      
      String sql = "delete from member where num=?";
      st = con.prepareStatement(sql);
      st.setInt(1, num);
      result = st.executeUpdate();
      
      return result;
   }

   public int updateGrade(Connection con, String grade, int num) throws Exception {
      PreparedStatement st = null;
      int result = 0;
      
      String sql = "update member set grade=? where num=?";
      st = con.prepareStatement(sql);
      st.setString(1, grade);
      st.setInt(2, num);
      result = st.executeUpdate();
      
      return result;
   }
   @Override
   public int update(Connection con, UserDTO userDTO) throws Exception {
      PreparedStatement st = null;
      int result = 0;
      MemberDTO memberDTO = (MemberDTO) userDTO;
      
      String sql = "update member set pw=?, phone=?, nation=? where num=?";
      st = con.prepareStatement(sql);
      st.setString(1, memberDTO.getPw());
      st.setString(2, memberDTO.getPhone());
      st.setString(3, memberDTO.getNation());
      st.setInt(4, memberDTO.getNum());
      result = st.executeUpdate();
      
      return result;
   }
   
   public boolean idCheck(Connection con, String id) throws Exception {
      PreparedStatement st = null;
      ResultSet result = null;
      boolean check = true;
      
      String sql = "select id from member where id=?";
      st = con.prepareStatement(sql);
      st.setString(1, id);
      result = st.executeQuery();
      
      if (result.next()) {
         check = false; // 동일한 아이디가 디비에 존재하므로 사용 못 함.
      }
      
      return check;
   }
   
}