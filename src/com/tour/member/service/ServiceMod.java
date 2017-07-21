package com.tour.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.member.MemberDAO;
import com.tour.member.MemberDTO;
import com.tour.util.DBConnector;

public class ServiceMod implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(request.getParameter("id"));
		memberDTO.setNum(Integer.parseInt(request.getParameter("num")));
		memberDTO.setPw(request.getParameter("pw"));
		memberDTO.setName(request.getParameter("name"));
		memberDTO.setPhone(request.getParameter("phone"));
		memberDTO.setNation(request.getParameter("nation"));
		int result = 0;
		
		Connection con = DBConnector.getConnect();
		
		try {
			result = memberDAO.update(con, memberDTO);
			memberDTO = (MemberDTO) memberDAO.login(con, memberDTO);
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
			request.getSession().setAttribute("member", memberDTO);
			request.setAttribute("message", "회원 정보 수정 완료");
		} else {
			// 오류페이지
			request.setAttribute("message", "회원 정보 수정 오류");
		}
		
		request.setAttribute("path", "./memberMyInfo.jsp");
		actionForward.setCheck(true);
		actionForward.setPath("../../common/commonResult.jsp");
		
		return actionForward;
	}

}
