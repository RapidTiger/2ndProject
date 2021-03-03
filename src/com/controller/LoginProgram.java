package com.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/LoginProgram")
public class LoginProgram extends HttpServlet {

	String name = null;
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String[] food =request.getParameterValues("food");
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id,pw);
		MemberDTO list = dao.login(dto);
		
		

		
		if (list != null) {
			System.out.print("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("dto", list);
			response.sendRedirect("main.jsp"); // 
		} else {
			System.out.print("로그인 실패");
			response.sendRedirect("login.jsp");
		}

	}
}