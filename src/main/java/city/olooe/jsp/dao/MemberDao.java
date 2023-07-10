package city.olooe.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import city.olooe.jsp.domain.Member;
import city.olooe.jsp.util.DBConn;

public class MemberDao {
	private Connection conn = DBConn.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int insert(Member vo) {
		conn = DBConn.getConnection();
		
		int result = 0;
		
		String sql = "insert into city_member(id, pw, name, address, email) values ('"
				+ vo.getId() + "', '" + vo.getPw() + "', '"
				+ vo.getName() + "', '" + vo.getAddress() + "', '"
				+ vo.getEmail() + "')";
		
		try {
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
			close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Member selectOne(String id) {
		
		conn = DBConn.getConnection();
		Member vo = null;
		String sql = "select * from city_member where id = '" + id + "'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = 1;
				vo = new Member(
					rs.getString(idx++),
					rs.getString(idx++),
					rs.getString(idx++),
					rs.getString(idx++),
					rs.getString(idx++),
					rs.getDate(idx++)
				);
			}
			close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}

	public Member selectOne(String name, String email) {
		
		conn = DBConn.getConnection();
		Member vo = null;
		String sql = "select * from city_member where name = '" + name + "' and email = '" + email + "'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = 1;
				vo = new Member(
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getDate(idx++)
						);
			}
			close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	public Member selectOne(String id, String name, String email) {
		
		conn = DBConn.getConnection();
		Member vo = null;
		String sql = "select * from city_member where id = '" + id + "' and name = '" + name + "' and email = '" + email + "'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = 1;
				vo = new Member(
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getDate(idx++)
						);
			}
			close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	public List<Member> selectList() {
		conn = DBConn.getConnection();
		List<Member> vo = new ArrayList<Member>();
		String sql = "select * from city_member";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int idx = 1;
				Member member = new Member(
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getDate(idx++)
					);
				vo.add(member);
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	

	
	public void update(Member member) {
		conn = DBConn.getConnection();
		
		String sql = "update city_member set\r\n"
				+ "pw = ?,\r\n"
				+ "address = ?, \r\n"
				+ "email = ? \r\n"
			    + "where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getPw());
			pstmt.setString(2, member.getAddress());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getId());
			pstmt.executeUpdate();
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public int updatePw(Member vo) {
		conn = DBConn.getConnection();
		int result = 0;
		String sql = "update city_member set pw = ? where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setString(idx++, vo.getPw());
			pstmt.setString(idx++, vo.getId());
			result = pstmt.executeUpdate();
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	public void delete(String id) {
		conn = DBConn.getConnection();
		
		String sql = "delete from city_member where id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	public void close() {
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
		}
	}
	
}
