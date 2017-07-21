package com.tour.ticket.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;

public class ServiceTicketMethod implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		String mChecked = request.getParameter("mChecked");
		
		request.setAttribute("mChecked", mChecked);
		ActionForward actionForward = new ActionForward();
		actionForward.setCheck(true);
		actionForward.setPath("../common/ticketMethod.jsp");
		
		return actionForward;
	}

}
