package city.olooe.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import city.olooe.jsp.domain.Board;
import city.olooe.jsp.domain.Criteria;
import city.olooe.jsp.util.DBConn;

public class BoardDao {

	private Connection conn = DBConn.getConnection();
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public int insert(Board board) {
		conn = DBConn.getConnection();	
		int result = 0;
		String sql = "insert into city_board(title, content, writer, category, lockpw) values (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getWriter());
			pstmt.setInt(4, board.getCategory());
			pstmt.setString(5, board.getLockpw());
			
			pstmt.executeUpdate();
			close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	
	public void increaseHitCount(Long bno) {
		conn = DBConn.getConnection();	
		int result = 0;
		String sql = "update city_board set hitcount = hitcount + 1 where bno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, bno);
			
			pstmt.executeUpdate();
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	
	public Board selectOne(Long bno) {
		conn = DBConn.getConnection();

		Board board = null;
		
		String sql = "select cb.*, (select count(*) from city_reply cr where cr.bno = cb.bno) replyCnt\r\n"
				+ "from city_board cb where bno = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, bno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int idx = 1;
				
				board = new Board(
						rs.getLong(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getDate(idx++),
						rs.getString(idx++),
						rs.getInt(idx++), 
						rs.getInt(idx++), 
						rs.getString(idx++),
						rs.getInt(idx++)
						);
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return board;
	}
	
	
	public List<Board> selectList(Criteria cri) {
		conn = DBConn.getConnection();
		
		List<Board> boards = new ArrayList<Board>();
		
		String sql = "";
		sql = "select cb.*, (select count(*) from city_reply cr where cr.bno = cb.bno) replyCnt\r\n"
				+ "from city_board cb where category = ?";		
		//검색
		sql += getSearchSqlBy(cri);
		sql += " order by bno desc limit ? offset ?;";
		try {
			int i = 1;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(i++, cri.getCategory());
			pstmt.setLong(i++, cri.getAmount());
			pstmt.setLong(i++, (cri.getPageNum() - 1) * cri.getAmount());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int idx = 1;
				
				Board board = new Board(
						rs.getLong(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getString(idx++),
						rs.getDate(idx++),
						rs.getString(idx++),
						rs.getInt(idx++), 
						rs.getInt(idx++), 
						rs.getString(idx++),
						rs.getInt(idx++)
						);
				boards.add(board);
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boards;
	}

	
	public void update(Board board) {
		conn = DBConn.getConnection();	

		String sql = "update city_board set\r\n"
				+ "	title = ?,\r\n"
				+ "	content = ?,\r\n"
				+ " lockpw = ?,\r\n"
				+ "	updatedate = now()\r\n"
				+ "where bno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getLockpw());
			pstmt.setLong(4, board.getBno());
			
			pstmt.executeUpdate();
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void update(String writer) {
		conn = DBConn.getConnection();	
		
		String sql = "update city_board set\r\n"
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

	
	public void delete(Long bno) {
		conn = DBConn.getConnection();
		
		String sql = "delete from city_board where bno = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, bno);
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
	
	
	public int selectListCount(Criteria cri) {
		conn = DBConn.getConnection();
		
		int count = 0;
		
		String sql = "select count(*) from city_board where category = ?";
		
		sql += getSearchSqlBy(cri);
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, cri.getCategory());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int idx = 1;
				count = rs.getInt(1);
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	
	private String getSearchSqlBy(Criteria cri) {
		String sql = "";
		
		if(cri.getType() != null && cri.getKeyword() != null && String.join("", cri.getType()).length() > 0) {
			
			sql += " and ( ";
			
			List<String> list = Arrays.asList(cri.getType());
			
			List<String> typeList = list.stream().map(s->" " + s +  " like '%" + cri.getKeyword() +"%' ").collect(Collectors.toList());
			
			sql += String.join(" or ", typeList);
			
			sql += ")";
		}
		
		return sql;
	}


	
	
}
