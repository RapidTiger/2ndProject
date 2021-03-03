package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.planDAO;
import com.model.planDTO;

/**
 * Servlet implementation class planinsert
 */
@WebServlet("/planinsert")
public class planinsert extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/x-json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String name = request.getParameter("name");
		String address = request.getParameter("add");
		double lat = Double.parseDouble(request.getParameter("lat"));
		double lng = Double.parseDouble(request.getParameter("lng"));
		
		planDTO dto = new planDTO(id, date, time, name, address, lat, lng);
		planDAO ado = new planDAO();
		
		int cnt = ado.insert(dto);
		
		if(cnt>0) {
			out.print(1);
		}
		else {
			out.print(0);
		}
	}

}
