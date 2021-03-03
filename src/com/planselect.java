package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.model.MemberDTO;
import com.model.planDAO;
import com.model.planDTO;

@WebServlet("/planselect")
public class planselect extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/x-json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		JSONObject totalObjext = new JSONObject();
		JSONArray array = new JSONArray();
		
		String id = request.getParameter("id");
		planDTO dto = new planDTO(id);
		planDAO ado = new planDAO();
		
		ArrayList<String[]> plan = ado.select(dto);
		
		for (int i = 0; i < plan.size(); i++) {
			JSONObject data = new JSONObject();
			data.put("id" ,plan.get(i)[0]);
			data.put("date" ,plan.get(i)[1]);
			data.put("time" ,plan.get(i)[2]);
			data.put("name" ,plan.get(i)[3]);
			data.put("add" ,plan.get(i)[4]);
			data.put("lat" ,plan.get(i)[5]);
			data.put("lng" ,plan.get(i)[6]);
			array.add(data);
		}
		
		out.print(array);
	}
}
