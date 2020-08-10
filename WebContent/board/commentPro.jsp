<%@page import="comment.CommentBean"%>
<%@page import="comment.CommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	
	String id = (String)session.getAttribute("id");
	
	CommentBean cBean = new CommentBean();
	CommentDAO cDao = new CommentDAO();
	
	int num = Integer.parseInt(request.getParameter("num"));
	String comment = request.getParameter("comment");
	cBean.setId(id);
	cBean.setComment(comment);
	cBean.setNum(num);
	cBean.setBoard("board");
	cDao.insertComment(cBean);
	
	response.sendRedirect("read.jsp?num="+request.getParameter("num"));

	%>
