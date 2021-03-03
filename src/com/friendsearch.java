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

import com.model.MemberDAO;
import com.model.MemberDTO;

/**
 * Servlet implementation class friendserch
 */
@WebServlet("/friendsearch")
public class friendsearch extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/x-json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		JSONObject totalObjext = new JSONObject();
		JSONArray array = new JSONArray();
					
		String id = request.getParameter("id");
		ArrayList<String[]> list = new ArrayList<String[]>();
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id);
		
		ArrayList<String> friend = dao.friendSearch(dto);
		
		for (int i = 0; i < friend.size(); i++) {
			MemberDTO dto2 = new MemberDTO(friend.get(i));
			list.add(dao.friendAdd(dto2));
		}
		
		for (int i = 0; i < list.size(); i++) {
			JSONObject data = new JSONObject();
			data.put("friendId" ,list.get(i)[0]);
			data.put("friendName" ,list.get(i)[1]);
			data.put("friendAddress" ,list.get(i)[2]);
			array.add(data);
		}
		totalObjext.put("class", array);
		
		String jsonInfo = totalObjext.toJSONString();
		out.print(jsonInfo);
	}

}
