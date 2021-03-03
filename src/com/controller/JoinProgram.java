package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/JoinProgram")
public class JoinProgram extends HttpServlet {

	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		String id = request.getParameter("id");
		id = new String(id.getBytes("iso-8859-1"), "euc-kr");
		String pw = request.getParameter("pw");
		pw = new String(pw.getBytes("iso-8859-1"), "euc-kr");
		String name = request.getParameter("name");
		name = new String(name.getBytes("iso-8859-1"), "euc-kr");
		String address = request.getParameter("address");
		address = new String(address.getBytes("iso-8859-1"), "euc-kr");
		String detail = request.getParameter("detail");		
		detail = new String(detail.getBytes("iso-8859-1"), "euc-kr");
		
		int sum_favor = 0;
		int sum_mood = 0;
		int sum_convenience = 0;
		
		try {			
			String[] favor = request.getParameterValues("favor");
			for(int i = 0; i<favor.length; i++) {
				sum_favor += Integer.parseInt(favor[i]);
			}
		}catch (Exception e) {
			
		}
		
		try{			
			String[] mood = request.getParameterValues("mood");
			for(int i = 0; i<mood.length; i++) {
				sum_mood += Integer.parseInt(mood[i]);
			}
		}catch (Exception e) {
		}
		
		try {
			String[] convenience = request.getParameterValues("convenience");
			for(int i = 0; i<convenience.length; i++) {
				sum_convenience += Integer.parseInt(convenience[i]);
			}			
		}catch (Exception e) {
		}

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id, pw, name, address, detail, sum_favor, sum_mood, sum_convenience);
		cnt = dao.join(dto);
		if(cnt>0){
			System.out.println("회원가입 성공");
			response.sendRedirect("main.jsp");
		}else{
			System.out.println("회원가입 실패");
			response.sendRedirect("join.jsp");
		}

	}

}
