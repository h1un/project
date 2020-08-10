<%@page import="board.BoardDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("../member/login.jsp");
		}

		BoardBean boardBean = new BoardBean();
		BoardDAO bDAO = new BoardDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		bDAO.deleteBoard(num);
		response.sendRedirect("board.jsp");


%>