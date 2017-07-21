package com.tour.user.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.admin.AdminDAO;
import com.tour.admin.AdminDTO;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.member.MemberDAO;
import com.tour.member.MemberDTO;
import com.tour.point.PointDAO;
import com.tour.point.PointDTO;
import com.tour.util.DBConnector;

public class ServiceLoginProcess implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
				
		// admin
		AdminDAO adminDAO = new AdminDAO();
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setId(request.getParameter("id"));
		adminDTO.setPw(request.getParameter("pw"));
		
		// member
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setPw(request.getParameter("pw"));
		
		int mnum = 0;
		Connection con = DBConnector.getConnect();
		
		try {
			memberDTO = (MemberDTO) memberDAO.login(con, memberDTO);
			adminDTO = (AdminDTO) adminDAO.login(con, adminDTO);			
		} catch (Exception e) {
			memberDTO = null;
			adminDTO = null;
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
		
		if (memberDTO != null) {
			// member num
			mnum = memberDTO.getNum();
			
			System.out.println("mnum : " + mnum);
			
			// 오늘 날짜
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String today = format.format(cal.getTime());
			
			System.out.println("today : " + today);
					
			PointDTO pointDTO = null;
			PointDAO pointDAO = new PointDAO();
			int point = 0;
			String loginDate = null;
			BookDAO bookDAO = new BookDAO();
			BookDTO bookDTO = null;
			
			Connection con2 = DBConnector.getConnect();
			
			try {
				loginDate = pointDAO.selectDate(con2, mnum);
				System.out.println("loginDate : " + loginDate);
				
				if (loginDate == null) { // 가입 후 첫 로그인
					System.out.println("가입 후 첫 로그인");
					point = pointDAO.selectOne(con2, mnum);
					System.out.println("point : " + point);
					pointDTO = new PointDTO();
					pointDTO.setCategory("적립");
					pointDTO.setContents("로그인");
					pointDTO.setUsePoint(100);
					pointDTO.setMnum(mnum);
					pointDTO.setCurPoint(point + pointDTO.getUsePoint());
					
					System.out.println("가용 포인트 : " + pointDTO.getCurPoint());
					
					mnum = pointDAO.insert(con2, pointDTO); //변수 재활용
					
					/*java.util.Date udate = format.parse(loginDate);
					Date sdate = new Date(udate.getTime());
					
					
					System.out.println("sdate : "+sdate);
					// bookDAO.update(con2, sdate, "예약취소");
*/					
				} else {				
					if (loginDate.equals(today)) {
						System.out.println("오늘 첫 로그인 아님");
						
					} else {					
						point = pointDAO.selectOne(con2, mnum);
						System.out.println("point : " + point);
						pointDTO = new PointDTO();
						pointDTO.setCategory("적립");
						pointDTO.setContents("로그인");
						pointDTO.setUsePoint(100);
						pointDTO.setMnum(mnum);
						pointDTO.setCurPoint(point + pointDTO.getUsePoint());
						
						if (pointDTO.getUsePoint() > 0) {
							pointDTO.settPoint(pointDTO.getUsePoint() + point);
						} else {
							pointDTO.settPoint(point);
						}
												
						System.out.println("가용 포인트 : " + pointDTO.getCurPoint());
						
						mnum = pointDAO.insert(con2, pointDTO); //변수 재활용					
						
						
						// 멤버 등급 조정 // 새싹  -> 잎새(5000) -> 열매 (20000) -> 나무(50000)
						String grade = "새싹";
						String mGrade = memberDTO.getGrade();
						int tPoint = pointDAO.selectTPoint(con2, memberDTO.getNum());
						if (tPoint > 5000) {
							grade = "잎새";
						} else if (tPoint > 20000) {
							grade = "열매";
						} else if (tPoint > 50000) {
							grade = "나무";
						}
						
						if (!mGrade.equals(grade)) {
							memberDAO.updateGrade(con, grade, memberDTO.getNum());
						}
						////
					}
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					con2.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			request.getSession().setAttribute("member", memberDTO);
			
		} else if (adminDTO != null) {
			request.getSession().setAttribute("admin", adminDTO);
		} else {
			// 로그인 오류 페이지
		}
		
		request.setAttribute("path", "../index.jsp");
		actionForward.setCheck(true);
		actionForward.setPath("../common/commonResult.jsp");
		
		return actionForward;
	}

}
