package com.tour.book.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;

public class ServicePayInput implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward = new ActionForward();
		
		int price = Integer.parseInt(request.getParameter("price"));
		String bank = request.getParameter("bank");
		String name = request.getParameter("name");
		int point = Integer.parseInt(request.getParameter("point"));
		int num = Integer.parseInt(request.getParameter("num"));
		String day = request.getParameter("day");
		
		System.out.println("p : " + price);
		System.out.println("b : " + bank);
		System.out.println("n : " + name);
		System.out.println("point : " + point);
		
		request.setAttribute("name", name);
		request.setAttribute("bank", bank);
		request.setAttribute("price", price);
		request.setAttribute("point", point);
		request.setAttribute("num", num);
		request.setAttribute("day", day);
		
		actionForward.setCheck(true);
		actionForward.setPath("./memberPayInput.jsp");
		
		return actionForward;
	}

}
