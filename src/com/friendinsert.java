package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/friendinsert")
public class friendinsert extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String f_id = request.getParameter("f_id");
		String f_name = request.getParameter("f_name");
		
		id = new String(id.getBytes("iso-8859-1"), "utf-8");
		f_id = new String(f_id.getBytes("iso-8859-1"), "utf-8");
		f_name = new String(f_name.getBytes("iso-8859-1"), "utf-8");
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.friendinsert(id, f_id, f_name);
		out.print(cnt);
	}

}
