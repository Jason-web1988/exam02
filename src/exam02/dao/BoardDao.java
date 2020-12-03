package exam02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import exam02.ds.JdbcUtil;
import exam02.dto.Board;

public class BoardDao {
	private static final BoardDao instance = new BoardDao();

	public BoardDao() {
		super();
	}

	public static final BoardDao getInstance() {
		return instance;
	}

	public List<Board> selectBoardByAll(){
		String sql = "select idx, writer, subject, content, regdate from board_tbl_01 order by idx desc";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					List<Board> list = new ArrayList<>();
					do {
						list.add(getBoard(rs));
					}while(rs.next());
					return list;
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Board getBoard(ResultSet rs) throws SQLException {
		int idx = rs.getInt("idx");
		String writer = rs.getString("writer");
		String subject = rs.getString("subject");
		String content = rs.getString("content");
		Timestamp regDate = rs.getTimestamp("regdate");
		return new Board(idx, writer, subject, content, regDate);
	}
	
	public int countList() {
		String sql = "select count(*) from board_tbl_01 ";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt =con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public Board selectBoardByNo(int idx) {
		String sql = "select idx, writer, subject, content, regdate from board_tbl_01 where idx=? ";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, idx);
			try(ResultSet rs = pstmt.executeQuery()){
				if(rs.next()) {
					return getBoard(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int updateBoard(Board board) {
		String sql="UPDATE board_tbl_01 SET WRITER=?, SUBJECT=?, CONTENT=? WHERE IDX=?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
				pstmt.setString(1, board.getWriter());
				pstmt.setString(2, board.getSubject());
				pstmt.setString(3, board.getContent());
				pstmt.setInt(4, board.getIdx());
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int insertBoard(Board board) {
		String sql="INSERT INTO board_tbl_01 VALUES(board_seq01.nextval, ?, ?, ?, sysdate) ";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteBoard(int idx) {
		String sql="DELETE board_tbl_01 where idx=?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
