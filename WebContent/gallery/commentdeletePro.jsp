
<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("../member/login.jsp");
		}

		CommentBean cBean = new CommentBean();
		CommentDAO cDAO = new CommentDAO();

		int num = Integer.parseInt(request.getParameter("num"));
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		
		
		cDAO.deleteComment(cnum);
		response.sendRedirect("read.jsp?num="+num);


%>