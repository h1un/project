package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.util.ArrayList;

import java.util.List;

//DB작업
public class MemberDAO {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs;

	String sql = "";

	//커넥션풀(DataSource)을 얻은후 Connection DB접속
	private Connection getConnection() throws Exception{
		
		Context init = new InitialContext();
		//커넥션풀 얻기 
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/jspbeginner");
		//커넥션풀에 존재하는 커넥션 얻기
		Connection con = ds.getConnection();
		//커넥션 반환
		return con;
	}
	
	/*insertMember()메소드 : 
	   가입할할 회원정보들을? MemberBean객체의 각변수에 저장한후 매개변수로 전달받아 DB에 INSERT*/
	public void insertMember(MemberBean memberBean) {
		

		try {
			//커넥션풀로부터 커넥션 얻기 (DB접속)
			con = getConnection();
			
			sql = "insert into member(id,passwd,name,reg_date,birth,email,addr_zipcode,addr1,addr2,addr3,mtel,profile,introduce)"
			    + "values(?,?,?,now(),?,?,?,?,?,?,?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getId());
			pstmt.setString(2, memberBean.getPasswd());
			pstmt.setString(3, memberBean.getName());
			pstmt.setString(4, memberBean.getBirth());
			pstmt.setString(5, memberBean.getEmail());
			pstmt.setString(6, memberBean.getAddr_zipcode());
			pstmt.setString(7, memberBean.getAddr1());
			pstmt.setString(8, memberBean.getAddr2());
			pstmt.setString(9, memberBean.getAddr3());
			pstmt.setString(10, memberBean.getMtel());
			pstmt.setString(11, memberBean.getProfile());
			pstmt.setString(12, memberBean.getIntroduce());
		
			pstmt.executeUpdate();//INSERT실행
								
		} catch (Exception e) {
			System.out.println("insertMember메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			
			 try {
				 if(pstmt != null) { pstmt.close();  }
				 if(con != null) { con.close();  }
			} catch (SQLException e) {
				e.printStackTrace();
			}		 
		}//finally
		
	}//insertMember메소드 

	//회원가입 로그인
	public int idCheck(String id) {
		
		//Connection을 담을 변수 선언
		Connection con = null;
		//PreparedStatement를 담을 변수 선언
		PreparedStatement pstmt = null;
		//SQL문을 생성해서 저장할 변수 선언
		String sql = "";
		//검색한 결과 데이터를 저장할 임시공간인? ResultSet을 담을 변수 선언
		ResultSet rs = null;
		
		int check = 0; //아이디 중복이냐 아니냐 판단 하는 값 
		
		try {
			//커넥션풀로부터 커넥션 얻기
			con = getConnection();
			//매개변수로 전달받은 id에 해당하는 레코드 검색 SQL문 만들기
			sql = "select * from member where id=?";
			//SELECT구문을 실행할 PreparedStatement객체 얻기
			pstmt = con.prepareStatement(sql);
			// ? 값 설정
			pstmt.setString(1, id);
			//SELECT문 실행후 검색한 결과를 ResultSet에 저장후 얻기
			rs =  pstmt.executeQuery();
			
			//검색한 데이터가 존재하면
			if(rs.next()) {
				//check변수값을 1로 저장
				check = 1;
			}else {//검색한 데이터가 존재하지 않으면
				//check변수값을 0으로 저장	
				check = 0;
			}
		} catch (Exception e) {
			System.out.println("idCheck메소드 예외발생:" + e);
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}			
		}		
		return check;//아이디중복이면 1을 반환 중복이아니면 0을 반환 ---> join_IDCheck.jsp로 ~
	}
	
	//로그인처리
	public int userCheck(String id,String passwd) {
		
		int check = -1;  //1 -> 아이디, 비밀번호 맞음
						 //0 -> 아이디맞음, 비밀번호 틀림
						 //-1 -> 아이디 틀림
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		
		try {
			con = getConnection();
			sql = "select * from member where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();			
			if(rs.next()) {//id가 존재함			
				if(passwd.equals(rs.getString("passwd"))) {//비밀번호 존재함			
					check = 1;// 아이디 맞음 비밀번호 맞음		
				}else {//비밀번호 X			
					check = 0;//아이디 맞음 비밀번호 틀림
				}		
			}else {//id가 존재하지 않음		
				check = -1;
			}
		} catch (Exception e) {
			System.out.println("userCheck메소드 내부에서 예외 :" + e);
		} finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}			
		}
		return check; //loginPro.jsp로 반환
	}//userCheck메소드 
	
	//회원정보 가져오기
	public MemberBean getMember(String id) {
		
		MemberBean member = new MemberBean();
		
		try {
			
			con = getConnection();
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setPasswd(rs.getString("passwd"));
				member.setName(rs.getString("name"));
				member.setReg_date(rs.getTimestamp("reg_date"));
				member.setBirth(rs.getString("birth"));
				member.setEmail(rs.getString("email"));
				member.setAddr_zipcode(rs.getString("addr_zipcode"));
				member.setAddr1(rs.getString("addr1"));
				member.setAddr2(rs.getString("addr2"));
				member.setAddr3(rs.getString("addr3"));
				member.setMtel(rs.getString("Mtel"));
				member.setProfile(rs.getString("profile"));
				member.setIntroduce(rs.getString("introduce"));
				
			}
			
			
		}catch (Exception e) {	
			System.out.println("getMember메서드에서 예외 발생 :" + e);

		}finally {
			if(rs != null) try{rs.close();}catch(Exception e) {e.printStackTrace();}
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}			
	
		}//getMember 메소드
		
		return member;
		
	}
	
	
		
public void editMember(MemberBean memberBean) {
		

		try {
			//커넥션풀로부터 커넥션 얻기 (DB접속)
			con = getConnection();
			
			sql = "update member set profile = ? where id =?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberBean.getProfile());
			pstmt.setString(2, memberBean.getId());


			pstmt.executeUpdate();
								
		} catch (Exception e) {
			System.out.println("editMember메소드 내부에서 예외발생 : " + e.toString());
		} finally {
			if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
			if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}			
			 
		}//finally
}
		public void updateMember(MemberBean memberBean) {
			

			try {
				//커넥션풀로부터 커넥션 얻기 (DB접속)
				con = getConnection();
				
				sql = "update member set passwd = ?, name = ?, email = ?, addr_zipcode = ?, addr1 = ?, addr2 =?, addr3 = ?, mtel =?, profile =?, introduce =? where id =?";
				
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, memberBean.getPasswd());
				pstmt.setString(2, memberBean.getName());
				pstmt.setString(3, memberBean.getEmail());
				pstmt.setString(4, memberBean.getAddr_zipcode());
				pstmt.setString(5, memberBean.getAddr1());
				pstmt.setString(6, memberBean.getAddr2());
				pstmt.setString(7, memberBean.getAddr3());
				pstmt.setString(8, memberBean.getMtel());
				pstmt.setString(9, memberBean.getProfile());
				pstmt.setString(10, memberBean.getIntroduce());
				pstmt.setString(11, memberBean.getId());
				pstmt.executeUpdate();
									
			} catch (Exception e) {
				System.out.println("updateMember메소드 내부에서 예외발생 : " + e.toString());
			} finally {
				if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
				if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}			
		
						 
			}//finally
			
	
		}
		
		public int getPass(String id,String passwd) { 
			int check = 0;
			try {
				con = getConnection();
				sql = "select passwd from member where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()){
					if(passwd.equals(rs.getString("passwd"))){
						check = 1;
					}
				}
				
			} catch (Exception e) {
				System.out.println("비밀번호 얻기 실패 :"+e);
			}finally {
				if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
				if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}			
		
			}
		
			return check;
		}
		
		
		public int confirm(String name, String email) {

	        int check = 0;

	        try {
	            con = getConnection();

	            sql = "select * from member where name=? and email=?";

	            pstmt = con.prepareStatement(sql);

	            pstmt.setString(1, name);
	            pstmt.setString(2, email);

	            rs = pstmt.executeQuery();

	            if(rs.next()){
	                check = 1;
	            }

	        } catch (Exception e) {
	            System.out.println("insert 실패 : "+e);
	        }finally {
	        	if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
				if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}		
	        }

	        return check;
	    }
		
		
		public String getID(String name, String email) {
			
			String id="";
			
			try {
				con = getConnection();
				
				sql = "select id from member where name=? and email=?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				id=rs.getString(1);
				
			} catch (Exception e) {
				System.out.println("insert 실패 : "+e);
			}finally {
				if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
				if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}		
	      
			}
			
			return id;
		}
		
		
		public void deleteMember(String id) {
			try {
				con = getConnection();
				String sql ="delete from member where id =?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();								
			} catch (Exception e) {
				System.out.println("deleteMember메서드에서 예외 발생 :" + e);
			}finally {
				if(pstmt != null) try{pstmt.close();}catch(Exception e) {e.printStackTrace();}
				if(con != null) try{con.close();}catch(Exception e) {e.printStackTrace();}		
	      
			}
		}
		
}//MemberDAO클래스 





