package org.api.cabs.controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.api.cabs.dao.CabDAO;
import org.api.cabs.model.Cabs;

/**
 * Servlet implementation class GetCabController
 */
public class GetCabController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Float source_Lat = Float.parseFloat(request.getParameter("source_Lat"));
		Float source_Long = Float.parseFloat(request.getParameter("source_Long"));
		if(source_Lat != null && source_Long != null) {
			CabDAO dao = new CabDAO();
			Cabs cab = dao.getClosestCab(source_Lat, source_Long);
			
			request.setAttribute("cab", cab);
			RequestDispatcher rd = request.getRequestDispatcher("booking_confirmed.jsp");
			rd.forward(request, response);
		}
	}

}
