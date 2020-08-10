<%@page import="gallery.GalleryDAO"%>
<%@page import="gallery.GalleryBean"%>

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

		GalleryBean gbean = new GalleryBean();
		GalleryDAO gDAO = new GalleryDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		gDAO.deleteGallery(num);
		response.sendRedirect("gallery.jsp");


%>