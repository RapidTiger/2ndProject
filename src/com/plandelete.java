package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/plandelet")
public class plandelete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String name = request.getParameter("name");
		
		id = new String(id.getBytes("iso-8859-1"), "utf-8");
		time = new String(time.getBytes("iso-8859-1"), "utf-8");
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.frienddelete(id, time);
		out.print(cnt);
	}

}
