package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
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
	
	
	public void insertBoard(BoardBean boardbean) {
		int num=0;
		try {
			con = getConnection();
			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}else {
				num = 1;
			}
			sql ="insert into board (num,id,subject,content,file,date,readcount,file_name) values(?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, boardbean.getId());
			pstmt.setString(3, boardbean.getSubject());
			pstmt.setString(4, boardbean.getContent());
			pstmt.setString(5, boardbean.getFile());
			pstmt.setInt(6, 0);
			pstmt.setString(7, boardbean.getFile_name());
			pstmt.executeUpdate();								
		} catch (Exception e) {
			System.out.println("insertBoard메서드에서 예외 발생 :" + e);
		}finally {
			fsource();
		}
	}
	
	
	public Vector<BoardBean>  getBoardList(String keyField, String keyWord){

		Vector<BoardBean>  BoardBean = new Vector<BoardBean>();
		
		try {
			con = getConnection();
			String sql="";
			if(keyWord == null || keyWord.isEmpty() || keyWord.equals("null")){
				sql = "select * from board order by num desc";
			}else{
				sql ="select * from board where " +keyField+
				" like '%" + keyWord + "%' order by num desc";
			}
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardBean bbean = new BoardBean();
				bbean.setId(rs.getString("id"));
				bbean.setContent(rs.getString("content"));
				bbean.setDate(rs.getTimestamp("date"));	
				bbean.setNum(rs.getInt("num"));	
				bbean.setReadcount(rs.getInt("readcount"));
				bbean.setSubject(rs.getString("subject"));
				bbean.setFile(rs.getString("file"));
				bbean.setFile_name(rs.getString("file_name"));
				
				BoardBean.add(bbean);				
			}//while
					
		} catch (Exception e) {
			System.out.println("getBoardList 실패 : "+e);
		} finally {
			fsource();
		}
		
		return BoardBean;
	}//getBoardList 끝
	
	public int gettotal(String search) {
        int total=0;
        try {
           con = getConnection();
           String sql="select * from board where subject like ?";
           pstmt = con.prepareStatement(sql);
           pstmt.setString(1, "%"+search+"%");
           rs = pstmt.executeQuery();
           
           while(rs.next()) {
              total++;
           }
        } catch (Exception e) {
           System.out.println("gettotal메서드 내부에서 오류:" + e);
        }finally {
			fsource();
        }
        return total;
     }
	
	public int getBoardCount() {
		int count = 0;
		try {
			con = getConnection();
			String sql ="select count(*) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getBoardCount 메서드에서 예외발생 : " +e);
		}finally {
			fsource();
		}
			return count;
	}
	
	public BoardBean getBoard(int num) {
		BoardBean b = new BoardBean();		
		try {
			con = getConnection();						
			String sql ="select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				b.setId(rs.getString("id"));
				b.setNum(rs.getInt("num"));
				b.setSubject(rs.getString("subject"));
				b.setContent(rs.getString("content"));
				b.setDate(rs.getTimestamp("date"));
				b.setFile(rs.getString("file"));
				b.setFile_name(rs.getString("file_name"));
				b.setReadcount(rs.getInt("readcount"));			
			}
			
		} catch (Exception e) {
			System.out.println("getBoard메서드에서 예외 발생 : " +e);
		}finally {
			fsource();
		}
		return b;
	}
	
	public void updateReadCount(int num) {
		try {
			con =getConnection();
			String sql ="update board set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadCount메서드에서 예외 발생 : " + e);
		}finally {
			fsource();
		}
	}
	
	
	
	
	
	public void editBoard(BoardBean boardbean) {
		try {
			con = getConnection();
			String sql ="update board set subject =?, content =?, file=? , file_name=? where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,boardbean.getSubject());
			pstmt.setString(2,boardbean.getContent());
			pstmt.setString(3,boardbean.getFile());
			pstmt.setString(4,boardbean.getFile_name());
			pstmt.setInt(5, boardbean.getNum());
			pstmt.executeUpdate();								
		} catch (Exception e) {
			System.out.println("editBoard메서드에서 예외 발생 :" + e);
		}finally {
			fsource();
		}
	}
	public void deleteBoard(int num) {
		try {
			con = getConnection();
			String sql ="delete from board where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();								
		} catch (Exception e) {
			System.out.println("deleteBoard메서드에서 예외 발생 :" + e);
		}finally {
			fsource();
		}
	}
}
