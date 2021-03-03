package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.model.MemberDAO;
import com.model.MemberDTO;

@WebServlet("/usersearch")
public class usersearch extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/x-json; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		JSONObject totalObjext = new JSONObject();
		JSONArray array = new JSONArray();	
		String id = request.getParameter("id");
		String key = request.getParameter("keyword");
		id = new String(id.getBytes("iso-8859-1"), "utf-8");
		key = new String(key.getBytes("iso-8859-1"), "utf-8");
		/*인코팅 확인하기
		String originalStr = key; // 테스트 
		String [] charSet = {"utf-8","euc-kr","ksc5601","iso-8859-1","x-windows-949"};
		for (int i=0; i<charSet.length; i++) {
		 for (int j=0; j<charSet.length; j++) {
		  try {
		   System.out.println("[" + charSet[i] +"," + charSet[j] +"] = " + new String(originalStr.getBytes(charSet[i]), charSet[j]));
		  } catch (Exception e) {
		   e.printStackTrace();
		  }
		 }
		}	
		*/
		MemberDAO dao = new MemberDAO();
		System.out.println(id);
		System.out.println(key);
		
		ArrayList<String[]> list = dao.usersearch(id,key);
		
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			JSONObject data = new JSONObject();
			data.put("friendId" ,list.get(i)[0]);
			data.put("friendName" ,list.get(i)[1]);
			array.add(data);
		}
		totalObjext.put("class", array);
		
		String jsonInfo = totalObjext.toJSONString();
		out.print(jsonInfo);
	}

}
