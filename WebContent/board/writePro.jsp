<%@page import="board.BoardDAO"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = (String)session.getAttribute("id");


		if(id == null){
			response.sendRedirect("../member/login.jsp");
		}
		
		request.setCharacterEncoding("UTF-8");

		BoardBean boardBean = new BoardBean();
		BoardDAO bDAO = new BoardDAO();
		
		ServletContext ctx = getServletContext();
		String realPath =  ctx.getRealPath("upload_board");
		int max = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
		Enumeration e =	multi.getFileNames();
		String f = (String)e.nextElement();
		String file = multi.getFilesystemName(f);
		String file_name =  multi.getOriginalFileName(f);
		
		
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
	
		boardBean.setId(id);
		boardBean.setSubject(subject);
		boardBean.setContent(content);				
		boardBean.setFile(file);
		boardBean.setFile_name(file_name);
		bDAO.insertBoard(boardBean);
		response.sendRedirect("board.jsp");


%>