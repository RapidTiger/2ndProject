package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	
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
	
	public int update(MemberDTO dto) {
		conn();
		
		
		try {
			String sql = "update mac_member set favor=?, mood = ?, convenience=? where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getFavor());
			psmt.setInt(2, dto.getMood());
			psmt.setInt(3, dto.getConvenience());
			psmt.setString(4, dto.getId());
			
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	public int join(MemberDTO dto) {
		
		conn();
		
		try {
			String sql = "insert into mac_member values(?,?,?,?,?,null,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getDetail());
			psmt.setInt(6, dto.getFavor());
			psmt.setInt(7, dto.getMood());
			psmt.setInt(8, dto.getConvenience());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
		
	}
	public MemberDTO login(MemberDTO dto) {
		MemberDTO list = null;
		conn();
		try {
			String sql = "select * from mac_member where id = ? and pw =?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				id = rs.getString("id");
				address = rs.getString("address");
				name = rs.getString("NAME");
				list = new MemberDTO(id,address,name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public ArrayList<String[]> usersearch(String Id, String f_id) {
		conn();
		ArrayList<String[]> array = new ArrayList<String[]>();
		try {
			String sql = "select * from mac_member where id != '"+Id+"' and name like '%"+f_id+"%'";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				String id = rs.getString("id");
				String name = rs.getString("name");
				String[] user = {id,name};
				array.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			close();
		}
		return array;
	}
	
	public int friendinsert(String id, String f_id, String f_name) {
		conn();
		int cnt = 0;
		try {
			String sql = "insert into mac_friend(id,friend_id,friend_name)values(?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, f_id);
			psmt.setString(3, f_name);
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			close();
		}
		return cnt;
	}
	
	public ArrayList<String> friendSearch(MemberDTO dto) {
		conn();
		ArrayList<String> array = new ArrayList<String>();
		try {
			String sql = "select * from mac_friend where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			rs = psmt.executeQuery();
			while(rs.next()) {
				String friend = rs.getString("friend_id");
				array.add(friend);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return array;
	}
	
	public String[] friendAdd(MemberDTO dto) {
		conn();
		String[] friend = new String[3];
		try {
			String sql = "select * from mac_member where id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				friend[0] = rs.getString("id");
				friend[1] = rs.getString("name");
				friend[2] = rs.getString("address");
				}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return friend;
	}
	
	public int frienddelete(String id, String f_id) {
		conn();
		int cnt = 0;
		try {
			String sql = "delete from mac_friend where id=? and friend_id=?";
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
