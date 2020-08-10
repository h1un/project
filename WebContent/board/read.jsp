<%@page import="java.util.List"%>
<%@page import="comment.CommentDAO"%>
<%@page import="comment.CommentBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>MyPortfolio</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="../img/favicon.png" rel="icon">
  <link href="../img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Inconsolata:400,700|Raleway:400,700&display=swap"
    rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="../vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet">
  <link href="../vendor/aos/aos.css" rel="stylesheet">
  <link href="../vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../css/style.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: MyPortfolio
    Template URL: https://bootstrapmade.com/myportfolio-bootstrap-portfolio-website-template/
    Author: BootstrapMade.com
    Author URL: https://bootstrapmade.com/
  ======================================================= -->
<%

String id = (String)session.getAttribute("id");


request.setCharacterEncoding("utf-8");

int num = Integer.parseInt(request.getParameter("num"));
BoardBean bbean = new BoardBean();
BoardDAO bdao = new BoardDAO();

bbean = bdao.getBoard(num);
bdao.updateReadCount(num);

String bid = bbean.getId();
String subject = bbean.getSubject();
String content = bbean.getContent();
String file = bbean.getFile();
String file_name = bbean.getFile_name();

SimpleDateFormat s = new SimpleDateFormat("yy.MM.dd HH:mm");
Timestamp date = bbean.getDate();
int readcount = bbean.getReadcount();


%>


<%

CommentDAO cdao = new CommentDAO();


List<CommentBean> c = cdao.getCommentList(num,"board");

%>
<script type="text/javascript">
function del() {
	var result = confirm("게시글을 삭제하시겠습니까?");
	if (result == true) {
		location.href = "deletePro.jsp?num="+<%=num%>;
	} else {
		return;
	}
}


</script>



</head>

<body>

	<jsp:include page="../inc/top.jsp"/>


  <main id="main">

    <div class="site-section site-portfolio">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-8 mx-auto" data-aos="fade-up">
            <h2>Board</h2>
            <p>게시판</p>
          <form action="edit.jsp" method="post" role="form" name="f">
              	<input type ="hidden" name = "num" value="<%=num %>">
              	<div class="col-md-12 form-group">
                  <p>num : <%=num %> <h4><%=subject %></h4>
                 	 id : <%=bid%> | date : <%=s.format(date) %> | read : <%=readcount %></p>
                </div>
                <hr>
	                <%
	                if(file != null){
	                %>
	                <img src ="../upload_board/<%=file%>" class = "col-md-12 ">
	                <%
	                }%>

                <div class="col-md-12 form-group">
                	<label><%=content %></label>
                </div>
               
               
               <!-- 다운로드 -->
                 <%
	                if(file != null){
	                %>
                <div class="col-md-12 form-group">
                	<a href='filedownload.jsp?fileName=<%=bbean.getFile()%>'><%=bbean.getFile_name()%></a>
				</div>
              	<%
	                }%>
              	
              	
              	<div class="col-md-12 form-group text-right">
	  	            <%
	                if(bid.equals(id)){
	                %>
	                <input type="submit" class="readmore bg-white border-white" value="수정">
	                <input type="button" class="readmore bg-white border-white" value="삭제" onclick="del(); return false;">
					<%
	                }
	                %>
			</div>
		</form>

                <hr>
                
                <%--댓글창 --%>
                
                <div class="col-md-12 form-group">
	                <table style="width: 100%">
		                <%
		                for(int i = 0;i<c.size();i++){
		                	CommentBean cbean = (CommentBean)c.get(i);
		                	 %>
		                <tr><td style="width: 15%"><label><%=cbean.getId() %></label></td>
		                <td style="width: 40%"><%=cbean.getComment() %></td>
		                <td style="width: 20%"><%=s.format(cbean.getDate()) %></td>
		                <td style="width: 15%">
			                <%if(cbean.getId().equals(id)){ %>
			                <a href="#" >수정</a> | <a href="commentdeletePro.jsp?cnum=<%=cbean.getCnum()%>&num=<%=num%>" >삭제</a> 
			                <%} %>
		                </td></tr>
		                
				                
				               	
		               <%} %>
		               
				                
	                </table>
                </div>
               

                
                <%if(id!=null){%>
                
                <div class="col-md-12 form-group"> 
                <form action="commentPro.jsp" method="post">
                <input type="hidden" name="num" value="<%=num %>">
                <table style="width: 100%">
                <tr><td style="width: 15%"><label><%=id %></label></td>
                <td><input type="text" class="form-control" name="comment" placeholder="댓글" ></td>
                <td><input type="submit" class="readmore d-block w-100" value="등록"></td>
                </table>
                </form>
                </div>
                <% } %>
                <div class="col-md-12 form-group">
                  <input type="button" class="readmore d-block w-50" value="목록" onclick="location.href='board.jsp'"></td>
                  
                  
                </div>
                </div>
              </div>
            
        </div>
        </div>
      </div>
    </div>
  </main>

  <!-- 하단바 -->
  <footer class="footer" role="contentinfo">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p class="mb-1">&copy; Copyright MyPortfolio. All Rights Reserved</p>
          <div class="credits">
            <!--
              All the links in the footer should remain intact.
              You can delete the links only if you purchased the pro version.
              Licensing information: https://bootstrapmade.com/license/
              Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=MyPortfolio
            -->
            Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
          </div>
        </div>

        
        <div class="col-sm-6 social text-md-right">
          <a href="#"><span class="icofont-twitter"></span></a>
          <a href="#"><span class="icofont-facebook"></span></a>
          <a href="#"><span class="icofont-dribbble"></span></a>
          <a href="#"><span class="icofont-behance"></span></a>
        </div>
      </div>
    </div>
  </footer>

  <!-- Vendor JS Files -->
  <script src="../vendor/jquery/jquery.min.js"></script>
  <script src="../vendor/jquery/jquery-migrate.min.js"></script>
  <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
  <script src="../vendor/easing/easing.min.js"></script>
  <script src="../vendor/php-email-form/validate.js"></script>
  <script src="../vendor/isotope/isotope.pkgd.min.js"></script>
  <script src="../vendor/aos/aos.js"></script>
  <script src="../vendor/owlcarousel/owl.carousel.min.js"></script>

  <!-- Template Main JS File -->
  <script src="../js/main.js"></script>

</body>

</html>
