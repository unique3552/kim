package com.tour.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tour.action.Action;
import com.tour.action.ActionForward;

/**
 * Servlet implementation class FlightController
 */
@WebServlet("/FlightController")
public class FlightController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FlightController() {
        super();
        // TODO Auto-generated constructor stub
    }

private HashMap<String, Object> commands;
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	commands=new HashMap<>();
    	String fileName=config.getInitParameter("properties");
    	String realPath=config.getServletContext().getRealPath("WEB-INF");
    	FileInputStream fi=null;
    	Properties prop=new Properties();
    	try {
			fi=new FileInputStream(new File(realPath,fileName));
			prop.load(fi);
			Iterator<Object> it=prop.keySet().iterator();
			while(it.hasNext()){
				String key=(String)it.next();
				String value=(String)prop.get(key);
				Class obj=Class.forName(value);
				Object instance=obj.newInstance();
				commands.put(key, instance);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				fi.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command=request.getRequestURI();
		command=command.substring(request.getContextPath().length(), command.lastIndexOf("."));
		Action action=(Action)commands.get(command);
		ActionForward actionForward=action.execute(request, response);
		
		if(actionForward.isCheck()){
			RequestDispatcher view=request.getRequestDispatcher(actionForward.getPath());
			view.forward(request, response);
		}else{
			response.sendRedirect(actionForward.getPath());
		}
	}

}
