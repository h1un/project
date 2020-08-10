<%@page import="gallery.GalleryDAO"%>
<%@page import="gallery.GalleryBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String id = (String)session.getAttribute("id");
		

		if(id == null){
			response.sendRedirect("../member/login.jsp");
		}
		
		request.setCharacterEncoding("UTF-8");

		GalleryBean gbean = new GalleryBean();
		GalleryDAO gdao = new GalleryDAO();
		
		ServletContext ctx = getServletContext();
		String realPath =  ctx.getRealPath("upload_board");
		int max = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, realPath, max, "utf-8", new DefaultFileRenamePolicy());
		Enumeration e =	multi.getFileNames();
		String f = (String)e.nextElement();
		String file_new = multi.getFilesystemName(f); //업로드한 파일
		String file_name_new =  multi.getOriginalFileName(f); //실제 업로드 경로
		
		String subject = multi.getParameter("subject");
		String content = multi.getParameter("content");
		int num = Integer.parseInt(multi.getParameter("num"));
		String file = multi.getParameter("file");
		String file_name = multi.getParameter("file_name");
		
		
		gbean.setNum(num);
		gbean.setSubject(subject);
		gbean.setContent(content);				
		
		if(file_new==null){ //업로드한 파일이 없을때

			gbean.setFile(file); 
			gbean.setFile_name(file_name); //기존 파일, 기존파일이름 넣기
			
		}else{
			gbean.setFile(file_new); 
			gbean.setFile_name(file_name_new); // 새로운 파일, 새로운 이름 넣기
			
		}

		
		gdao.editGallery(gbean);

		response.sendRedirect("read.jsp?num="+request.getParameter("num"));


%>