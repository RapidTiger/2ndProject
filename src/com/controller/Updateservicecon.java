package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Updateservicecon")
public class Updateservicecon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
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
		
		
		System.out.println(sum_favor);
		System.out.println(sum_mood);
		System.out.println(sum_convenience);
	}

}
