package city.olooe.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import city.olooe.jsp.domain.Reply;
import city.olooe.jsp.domain.Criteria;
import city.olooe.jsp.domain.Member;
import city.olooe.jsp.util.DBConn;

public class ReplyDao {
		
	private Connection conn = DBConn.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	

	public int insert(Reply reply) {
		conn = DBConn.getConnection();	
		int result = 0;
		String sql = "insert into city_Reply(content, writer, bno) values (?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reply.getContent());
			pstmt.setString(2, reply.getWriter());
			pstmt.setLong(3, reply.getBno());
			result = pstmt.executeUpdate();
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public Reply selectOne(Long rno) {
		conn = DBConn.getConnection();
		
		Reply reply = null;
		
		String sql = "";
		sql += "select * from city_Reply where rno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setLong(idx++, rno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				idx = 1;
				reply = new Reply(
						rs.getLong(idx++),
						rs.getString(idx++),
						rs.getDate(idx++),
						rs.getString(idx++),
						rs.getLong(idx++)
						);
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return reply;
	}
	
	
	
	public List<Reply> selectList(Long bno) {
		conn = DBConn.getConnection();
		
		List<Reply> replies = new ArrayList<Reply>();
		
		String sql = "";
		sql += "select * from city_Reply where bno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			int idx = 1;
			pstmt.setLong(idx++, bno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				idx = 1;
				
				Reply reply = new Reply(
						rs.getLong(idx++),
						rs.getString(idx++),
						rs.getDate(idx++),
						rs.getString(idx++),
						rs.getLong(idx++)
						);
				replies.add(reply);
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return replies;
	}
	
	
	public int delete(Long rno) {
		
		int ret = 0;
		
		conn = DBConn.getConnection();
		
		String sql = "delete from city_Reply where rno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, rno);
			ret = pstmt.executeUpdate();
			
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public int deleteAll(Long bno) {
		
		int ret = 0;
		
		conn = DBConn.getConnection();
		
		String sql = "delete from city_Reply where bno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, bno);
			ret = pstmt.executeUpdate();
			
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public void update(String writer) {
		conn = DBConn.getConnection();	
		
		String sql = "update city_reply set\r\n"
				+ "	writer = ? \r\n"
				+ "where writer = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "withdrawal");
			pstmt.setString(2, writer);
			
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
