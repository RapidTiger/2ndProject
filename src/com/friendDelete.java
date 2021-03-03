package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;

@WebServlet("/friendDelet")
public class friendDelete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String f_id = request.getParameter("f_id");
		
		id = new String(id.getBytes("iso-8859-1"), "utf-8");
		f_id = new String(f_id.getBytes("iso-8859-1"), "utf-8");
		
		MemberDAO dao = new MemberDAO();
		int cnt = dao.frienddelete(id, f_id);
		out.print(cnt);
	}

}
