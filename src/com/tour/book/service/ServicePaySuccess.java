package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.member.MemberDAO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.point.PointDTO;
import com.tour.util.DBConnector;

public class ServicePaySuccess implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      ActionForward actionForward = new ActionForward();
      
      
      int price = Integer.parseInt(request.getParameter("price"));
      String bank = request.getParameter("bank");
      String name = request.getParameter("name");
      int point = Integer.parseInt(request.getParameter("point"));
      int num = Integer.parseInt(request.getParameter("num"));
      String day = request.getParameter("day");
      
      MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
      PointDAO pointDAO = new PointDAO();
      PointDTO pointDTO = new PointDTO();
      int result = 0;
      
      pointDTO.setCategory("사용");
      pointDTO.setContents("상품 결제");
      pointDTO.setUsePoint(0-point);
      pointDTO.setMnum(memberDTO.getNum());
      
      Connection con = DBConnector.getConnect();      
      int curPoint = 0;
      int tPoint = 0;
      
      try {
         curPoint = pointDAO.selectOne(con, memberDTO.getNum());
         tPoint = pointDAO.selectTPoint(con, memberDTO.getNum());
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      pointDTO.setCurPoint(curPoint + pointDTO.getUsePoint());
      pointDTO.settPoint(tPoint);
      
      try {
         if (point != 0) {
            result = pointDAO.insert(con, pointDTO);
         }
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      // 구매에 따른 포인트 적립
      int savingPoint = (int) (price * 0.01);
      
      PointDTO pointDTO2 = new PointDTO();
      pointDTO2.setCategory("적립");
      pointDTO2.setContents("상품구매");
      pointDTO2.setUsePoint(savingPoint);
      pointDTO2.setMnum(memberDTO.getNum());
      pointDTO2.setCurPoint(pointDTO.getCurPoint() + savingPoint);
      pointDTO2.settPoint(pointDTO.gettPoint() + savingPoint);
      
      try {
         result = pointDAO.insert(con, pointDTO2);
      } catch (Exception e1) {
         // TODO Auto-generated catch block
         e1.printStackTrace();
      }
      
      // 멤버 등급 조정 // 새싹  -> 잎새(5000) -> 열매 (20000) -> 나무(50000)
      String grade = "새싹";
      String mGrade = memberDTO.getGrade();
      tPoint = pointDTO.gettPoint() + savingPoint;
      if (tPoint > 5000) {
         grade = "잎새";
      } else if (tPoint > 20000) {
         grade = "열매";
      } else if (tPoint > 50000) {
         grade = "나무";
      }
      
      MemberDAO memberDAO = new MemberDAO();
      try {
         if (!mGrade.equals(grade)) {
            result = memberDAO.updateGrade(con, grade, memberDTO.getNum());
         }
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      ////
      
      
      BookDAO bookDAO = new BookDAO();
      int goods = 0;
      try {
         result = bookDAO.update(con, "예약확정", pointDTO.getUsePoint(), num);
         goods = bookDAO.selectGoods(con, num);
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         try {
            con.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      
      
      if (result > 0) {            
         request.setAttribute("name", name);
         request.setAttribute("bank", bank);
         request.setAttribute("price", price);
         request.setAttribute("point", pointDTO);
         request.setAttribute("bnum", num);
         request.setAttribute("day", day);
         request.setAttribute("goods", goods);
      }
      
      actionForward.setCheck(true);
      actionForward.setPath("./memberPaySuccess.jsp");
      
      return actionForward;
   }

}