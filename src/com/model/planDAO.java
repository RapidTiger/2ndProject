package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class planDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	int cnt = 0;
	String id = null;
	String pw = null;
	String name = null;
	String address = null;
	ResultSet rs = null;
	
	public void conn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			
			conn = DriverManager.getConnection(db_url,db_id,db_pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int insert(planDTO dto) {
		conn();
		try {
			String sql = "insert into mac_plan values(?,?,?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getDate());
			psmt.setString(3, dto.getTime());
			psmt.setString(4, dto.getName());
			psmt.setString(5, dto.getAddress());
			psmt.setDouble(6, dto.getLat());
			psmt.setDouble(7, dto.getLng());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public ArrayList<String[]> select(planDTO dto) {
		conn();
		ArrayList<String[]> array = new ArrayList<String[]>();
		try {
			String sql = "select * from mac_plan where id = ? and TO_DATE(plan_date, 'YYYY/MM/DD') >= SYSDATE - 1 order by plan_date,plan_time";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			rs = psmt.executeQuery();
			while(rs.next()) {
				String[] list = new String[7];
				for (int i = 0; i < list.length; i++) {
					list[i] = rs.getString(i+1);
				}
				array.add(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return array;
	}
	public int frienddelete(String id, String f_id) {
		conn();
		int cnt = 0;
		try {
			String sql = "delete from mac_plan where id=? and friend_id=?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, f_id);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			close();
		}
		return cnt;
	}
}
