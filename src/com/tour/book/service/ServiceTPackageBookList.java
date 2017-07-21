package com.tour.book.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;
import com.tour.book.BookDAO;
import com.tour.book.BookDTO;
import com.tour.member.MemberDTO;
import com.tour.tPackage.TPackageDAO;
import com.tour.tPackage.TPackageDTO;
import com.tour.util.DBConnector;
import com.tour.util.PageMaker;
import com.tour.util.PageResult;
import com.tour.util.RowMaker;

public class ServiceTPackageBookList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward actionForward=new ActionForward();
		BookDAO bookDAO=new BookDAO();
		Connection con=DBConnector.getConnect();
		int curPage=1;
		List<BookDTO> ar=null;
		List<TPackageDTO> tPackage=new ArrayList<>();
		TPackageDTO tPackageDTO=null;
		TPackageDAO tPackageDAO=new TPackageDAO();
		int member=(((MemberDTO)request.getSession().getAttribute("member")).getNum());
		
		PageResult pr=null;
		
		try{
			curPage=Integer.parseInt(request.getParameter("curPage"));
		}catch(Exception e){
			e.printStackTrace();
		}
		PageMaker pm=new PageMaker(curPage);
		RowMaker rowMaker=pm.getRowMaker();
		try {
			ar=bookDAO.selectList(con, rowMaker, 5 , member);
			pr=pm.paging(bookDAO.getTotalCount(con,5 , member));
			
			for (int i=0; i<ar.size(); i++) {
				int gnum = ar.get(i).getGnum();
				tPackageDTO=(TPackageDTO)tPackageDAO.selectOne(con, gnum);
				tPackage.add(tPackageDTO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		actionForward.setCheck(true);
		if(ar!=null){
			actionForward.setPath("/user/member/memberTPackageBookList.jsp");
			request.setAttribute("book", ar);
			request.setAttribute("curPage", curPage);
			request.setAttribute("pageResult", pr);
			request.setAttribute("tPackage", tPackage);
		}
		
		return actionForward;
	}

}
