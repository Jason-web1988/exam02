package exam02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import exam02.ds.JdbcUtil;
import exam02.dto.Comment;

public class CommentDao {
	private static final CommentDao instance = new CommentDao();

	public CommentDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static final CommentDao getInstance() {
		return instance;
	}
	
	public List<Comment> selectCommentByAll(){
		String sql="select idx, bidx, writer, content, regdate from comment_tbl_01 ";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			if(rs.next()) {
				List<Comment> list = new ArrayList<>();
				do {
					list.add(getComment(rs));
				}while(rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Comment getComment(ResultSet rs) throws SQLException {
		int idx = rs.getInt("idx");
		int bidx = rs.getInt("bidx");
		String writer = rs.getString("writer");
		String content = rs.getString("content");
		Timestamp regDate = rs.getTimestamp("regDate");
		return new Comment(idx, bidx, writer, content, regDate);
	}
	
	public List<Comment> selectCommentByNo(int bidx) {
		String sql = "select idx, bidx, writer, content, regdate from comment_tbl_01 where bidx=? ";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
				pstmt.setInt(1, bidx);
				try(ResultSet rs = pstmt.executeQuery()){
					if(rs.next()) {
						List<Comment> list = new ArrayList<>();
						do {
							list.add(getComment(rs));
						}while(rs.next());
						return list;
					}
				}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int insertComment(Comment comment) {
		String sql="insert into comment_tbl_01 values(comment_seq01.nextval, ?, ?, ?, sysdate)";
		
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
				pstmt.setInt(1, comment.getBidx());
				pstmt.setString(2, comment.getWriter());
				pstmt.setString(3, comment.getContent());
				return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteComment(int idx) {
		String sql="DELETE comment_tbl_01 WHERE IDX= ? ";
		try(Connection con = JdbcUtil.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, idx);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public int deleteBetweenCandB(int bidx) {
		String sql="DELETE comment_tbl_01 WHERE BIDX= ? ";
		try(Connection con = JdbcUtil.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, bidx);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
