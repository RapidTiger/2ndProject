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

@WebServlet("/point")
public class point extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/x-json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		double centerLat = Double.parseDouble(request.getParameter("lat"));
		double centerLng = Double.parseDouble(request.getParameter("lng"));
		
		
		JSONObject totalObjext = new JSONObject();
		JSONArray array = new JSONArray();
		JSONArray array2 = new JSONArray();		
					
		double[][] center = new double[2400][2];
		double lat = 35.19504198752256;
		int cnt = 0;
		for (int i = 0; i < 60; i++) {
			double lng = 126.98273017581398;
			lat -= 0.002480652494899/2;
			for (int j = 0; j < 40; j++) {
				lng -= 0.007156227038385/2;
				center[cnt][0] = lat;				
				center[cnt++][1] = lng;				
			}
		}

		ArrayList<double[]> centerlist = new ArrayList<double[]>();
		for (int i = 0; i < center.length; i++) {
			double powlat = centerLat-center[i][0];
			double powlng = centerLng-center[i][1];
			powlat = Math.pow(powlat, 2);
			powlng = Math.pow(powlng, 2);
			System.out.println();
			if(powlat+powlng < 0.00008) {
				double[] latlng = {center[i][0],center[i][1]};
				centerlist.add(latlng);
			}
		}
		
		for (int i = 0; i < centerlist.size(); i++) {
			JSONObject data = new JSONObject();
			data.put("lat" ,centerlist.get(i)[0]);
			data.put("lng" ,centerlist.get(i)[1]);
			array.add(data);
		}
		totalObjext.put("class", array);
		
		String jsonInfo = totalObjext.toJSONString();
		out.print(jsonInfo);
	}

}
