package gallery;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class GalleryDAO {

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
		
	public void insertGallery(GalleryBean galleryBean) {
		int num=0;
		try {
			con = getConnection();
			String sql = "select max(num) from gallery";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt(1)+1;
			}else {
				num = 1;
			}
			sql ="insert into gallery (num,id,subject,content,file,date,readcount,file_name) values(?,?,?,?,?,now(),?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, galleryBean.getId());
			pstmt.setString(3, galleryBean.getSubject());
			pstmt.setString(4, galleryBean.getContent());
			pstmt.setString(5, galleryBean.getFile());
			pstmt.setInt(6, 0);
			pstmt.setString(7, galleryBean.getFile_name());
			pstmt.executeUpdate();								
		} catch (Exception e) {
			System.out.println("insertBoard메서드에서 예외 발생 :" + e);
		}finally {
			fsource();
		}
	}
	
	
	public Vector<GalleryBean>  getGalleryList(String keyField, String keyWord){

		Vector<GalleryBean>  GalleryBean = new Vector<GalleryBean>();
		
		try {
			con = getConnection();
			String sql="";
			if(keyWord == null || keyWord.isEmpty() || keyWord.equals("null")){
				sql = "select * from gallery order by num desc";
			}else{
				sql ="select * from gallery where " +keyField+
				" like '%" + keyWord + "%' order by num desc";
			}
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				GalleryBean gbean = new GalleryBean();
				gbean.setId(rs.getString("id"));
				gbean.setContent(rs.getString("content"));
				gbean.setDate(rs.getTimestamp("date"));	
				gbean.setNum(rs.getInt("num"));	
				gbean.setReadcount(rs.getInt("readcount"));
				gbean.setSubject(rs.getString("subject"));
				gbean.setFile(rs.getString("file"));
				gbean.setFile_name(rs.getString("file_name"));
				
				GalleryBean.add(gbean);				
			}//while
					
		} catch (Exception e) {
			System.out.println("getgalleryList 실패 : "+e);
		} finally {
			fsource();
		}
		
		return GalleryBean;
	}
	
	
	
	public GalleryBean getGallery(int num) {
		GalleryBean g = new GalleryBean();		
		try {
			con = getConnection();						
			String sql ="select * from gallery where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				g.setId(rs.getString("id"));
				g.setNum(rs.getInt("num"));
				g.setSubject(rs.getString("subject"));
				g.setContent(rs.getString("content"));
				g.setDate(rs.getTimestamp("date"));
				g.setFile(rs.getString("file"));
				g.setFile_name(rs.getString("file_name"));
				g.setReadcount(rs.getInt("readcount"));			
			}
			
		} catch (Exception e) {
			System.out.println("getBoard메서드에서 예외 발생 : " +e);
		}finally {
			fsource();
		}
		return g;
	}
	
	public int gettotal(String search) {
        int total=0;
        try {
           con = getConnection();
           String sql="select * from gallery where subject like ?";
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
			String sql ="select count(*) from gallery";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("getgalleryCount 메서드에서 예외발생 : " +e);
		}finally {
			fsource();
		}
			return count;
	}
	
	public GalleryBean getBoard(int num) {
		GalleryBean g = new GalleryBean();		
		try {
			con = getConnection();						
			String sql ="select * from gallery where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				g.setId(rs.getString("id"));
				g.setNum(rs.getInt("num"));
				g.setSubject(rs.getString("subject"));
				g.setContent(rs.getString("content"));
				g.setDate(rs.getTimestamp("date"));
				g.setFile(rs.getString("file"));
				g.setFile_name(rs.getString("file_name"));
				g.setReadcount(rs.getInt("readcount"));			
			}
			
		} catch (Exception e) {
			System.out.println("getgallery메서드에서 예외 발생 : " +e);
		}finally {
			fsource();
		}
		return g;
	}
	
	public void updateReadCount(int num) {
		try {
			con =getConnection();
			String sql ="update gallery set readcount=readcount+1 where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateReadCount메서드에서 예외 발생 : " + e);
		}finally {
			fsource();
		}
	}
	
	
	
	public void editGallery(GalleryBean gbean) {
		try {
			con = getConnection();
			String sql ="update gallery set subject =?, content =?, file=? , file_name=? where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,gbean.getSubject());
			pstmt.setString(2,gbean.getContent());
			pstmt.setString(3,gbean.getFile());
			pstmt.setString(4,gbean.getFile_name());
			pstmt.setInt(5, gbean.getNum());
			pstmt.executeUpdate();								
		} catch (Exception e) {
			System.out.println("editgallery메서드에서 예외 발생 :" + e);
		}finally {
			fsource();
		}
	}
	
	public void deleteGallery(int num) {
		try {
			con = getConnection();
			String sql ="delete from gallery where num =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();								
		} catch (Exception e) {
			System.out.println("deletegallery메서드에서 예외 발생 :" + e);
		}finally {
			fsource();
		}
	}

}
