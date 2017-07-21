package com.tour.book.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;

public class ServicePayAgree implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int price = Integer.parseInt(request.getParameter("price"));
		String name = request.getParameter("name");
		int point = Integer.parseInt(request.getParameter("point"));
		int num = Integer.parseInt(request.getParameter("num"));
		String day = request.getParameter("day");
		
		System.out.println("price : " + price);
		System.out.println("name : " + name);
		System.out.println("point : " + point);
		
		request.setAttribute("price", price);
		request.setAttribute("name", name);
		request.setAttribute("point", point);
		request.setAttribute("num", num);
		request.setAttribute("day", day);
		
		actionForward.setCheck(true);		
		actionForward.setPath("./memberPayAgree.jsp");
	
		return actionForward;
	}

}
