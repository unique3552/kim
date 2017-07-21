package com.tour.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;

public class ServiceLogout implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		request.getSession().invalidate();		
		
		actionForward.setCheck(false);
		actionForward.setPath("../../index.jsp");
		
		return actionForward;
	}

}
