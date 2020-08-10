<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>	

<jsp:useBean id="memberBean" class="member.MemberBean"/>
<jsp:setProperty property="*" name="memberBean"/>
	
<%	

MemberDAO dao = new MemberDAO();
dao.insertMember(memberBean);
response.sendRedirect("login.jsp");

%>


