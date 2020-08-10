<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>

 
<%

	request.setCharacterEncoding("UTF-8");

	MemberBean memberBean = new MemberBean();	
	MemberDAO dao = new MemberDAO();


	ServletContext ctx = getServletContext();
	String realPath =  ctx.getRealPath("profile");
	int max = 10 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
	Enumeration e =	multi.getFileNames();
	String P = (String)e.nextElement();
	String profile_new = multi.getFilesystemName(P);

	String id = (String)session.getAttribute("id");
	
	String passwd = multi.getParameter("passwd");
	String name = multi.getParameter("name");
	String email = multi.getParameter("email");
	String addr_zipcode = multi.getParameter("addr_zipcode");
	String addr1 = multi.getParameter("addr1");
	String addr2 = multi.getParameter("addr2");
	String addr3 = multi.getParameter("addr3");
	String mtel = multi.getParameter("mtel");
	String introduce = multi.getParameter("introduce");
	String profile = multi.getParameter("profile");

	memberBean.setId(id);
	memberBean.setPasswd(passwd);
	memberBean.setName(name);
	memberBean.setEmail(email);
	memberBean.setAddr_zipcode(addr_zipcode);
	memberBean.setAddr1(addr1);
	memberBean.setAddr2(addr2);
	memberBean.setAddr3(addr3);
	memberBean.setMtel(mtel);
	memberBean.setIntroduce(introduce);
	
	
	if(profile_new==null){

		memberBean.setProfile(profile);
	}else{
		memberBean.setProfile(profile_new);
	}
	dao.updateMember(memberBean);

	response.sendRedirect("user.jsp");

	
	
	
	
%> 