
<%@page import="member.MemberDAO"%>
<%@page import="member.MemberBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		
		MemberBean gbean = new MemberBean();
		MemberDAO mDAO = new MemberDAO();
		
		mDAO.deleteMember(id);
		
		session.invalidate();	

		response.sendRedirect("../gallery/gallery.jsp");


%>