package comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CommentDAO {

	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;	
	
	
	private Connection getConnection() throws Exception{		
		Connection con = null;
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		con = ds.getConnection();
		return con;
	}
	
	public void fsource() {
		if(rs != null) try{rs.close(); }catch (Exception e){}
		if(pstmt != null) try {rs.close();} catch(Exception e) {}
		if(con != null) try {con.close();} catch(Exception e) {}
	}
	
	public void insertComment(CommentBean cBean) {
		try {
		con = getConnection();
		String sql = "select max(cnum) from comment";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int cnum=0;
		if(rs.next()) {
			cnum = rs.getInt(1)+1;
		}else {
			cnum = 1;
		}
		
		sql ="insert into comment (cnum, id, num, comment, date,board) values(?,?,?,?,now(),?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cnum);
		pstmt.setString(2, cBean.getId());
		pstmt.setInt(3, cBean.getNum());
		pstmt.setString(4, cBean.getComment());
		pstmt.setString(5, cBean.getBoard());
		pstmt.executeUpdate();		
		}catch (Exception e) {
			System.out.println("insertComment메서드에서 예외 발생 :" + e);
			
		}finally{

			fsource();
			}
		}
	public List<CommentBean> getCommentList(int num, String board){
		List<CommentBean> commentlist = new ArrayList<CommentBean>();
		try {
			con = getConnection();
			String sql = "select * from comment where num =? && board = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,num);
			pstmt.setString(2, board);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CommentBean c = new CommentBean();
				c.setId(rs.getString("id"));
				c.setNum(rs.getInt("num"));
				c.setComment(rs.getString("comment"));
				c.setDate(rs.getTimestamp("date"));
				c.setCnum(rs.getInt("cnum"));
				commentlist.add(c);
			}
		} catch (Exception e) {
			System.out.println("getCommentList메서드에서 예외발생 : " + e);
		}finally {
			fsource();
		}
		return commentlist;
	}
	
	public void deleteComment(int cnum) {
		try {
			con = getConnection();
			String sql = "delete from comment where cnum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("deleteComment메서드에서 예외발생 : " + e);
		}finally{
			fsource();
		}
	}
	
}
