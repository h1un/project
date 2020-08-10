<%@page import="gallery.GalleryDAO"%>
<%@page import="gallery.GalleryBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
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
  <script type="text/javascript">
	function logout() {
		var result = confirm("정말 로그아웃 하시겠습니까?");
		if (result == true) {
			location.href = "member/logout.jsp";
		} else {
			return;
		}
	}

</script>

<%
request.setCharacterEncoding("utf-8");	

String id = (String)session.getAttribute("id");

GalleryDAO gdao = new GalleryDAO();

String keyWord = "", keyField = "";

int totalRecord = 0;
int numPerPage = 9;
int pagePerBlock = 3;

int totalPage = 0;
int totalBlock = 0;
int nowPage = 0;
int nowBlock = 0;
int beginPerPage = 0;



//만약 검색어가 입력되었다면~~
if(request.getParameter("keyWord") != null ){
	//검색기준값 받아와 변수에 저장
	keyField = request.getParameter("keyField");
	//검색어 받아와 변수에 저장
	keyWord = request.getParameter("keyWord");
	
}

if(request.getParameter("reload")!=null){
	   //만약에 List.jsp페이지로 다시 요청 받은 값이 true와 같을때..
	   if(request.getParameter("reload").equals("true")){
	      keyWord = "";
	   }
	} 



Vector<GalleryBean> v = gdao.getGalleryList(keyField, keyWord);

totalRecord = v.size();

totalPage = (int)Math.ceil((double)totalRecord / numPerPage);

totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);

if(request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}/* else {
	nowPage = 1;
} */

if(request.getParameter("nowBlock") != null) {
	nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
}

beginPerPage = nowPage * numPerPage;
%>

  
</head>

<body>

   
<jsp:include page="../inc/top.jsp"/>


  <main id="main">
<div class="site-section site-portfolio">
      <div class="container">
       <form action="write.jsp" method="post">
        <div class="row mb-5 align-items-center">
          <div class="col-md-12 col-lg-6 mb-4 mb-lg-0" data-aos="fade-up">
            <h2>Gallery</h2>
            <p>갤러리</p>
          </div>
        </div>
        
       
        <div id="portfolio-grid" class="row no-gutter" data-aos="fade-up" data-aos-delay="200">
           <%
			
			if(v.isEmpty()) {
%>				
			<tr>
				<td colspan="5" align="center">등록된 글이 없습니다.</td>
			</tr>			
<% 
			}else {
			 	for(int i=beginPerPage; i < (beginPerPage + numPerPage); i++) {
					if(i == totalRecord) {
						break;
					}
					GalleryBean gbean = (GalleryBean)v.get(i);
%>
   
   
   			<div class="item web col-sm-6 col-md-4 col-lg-4 mb-4">
            
            
            
            <a href="read.jsp?num=<%=gbean.getNum() %>" class="item-wrap fancybox">
              <div class="work-info">
                <h3><%=gbean.getSubject()%></h3>
                <span><%=gbean.getId() %></span>
              </div>
              <img class="img-fluid" src="../upload_board/<%=gbean.getFile() %>">
            </a>
          </div>
          
          <%
              }
			 	
			}
              
              
              
              %>
                    
        </div>
          <div class = "row">
				<div class="col-md-10 form-group">
                </div>
                <%if(id!=null){ %>
                <div class="col-md-2 form-group">
                  <input type="submit" class="readmore d-block w-100" value="글쓰기">
                </div>
                <%}else{ %>
                <div class="col-md-2 form-group">
                </div>
                
                
                <%} %>
          </div>
          
          </form>

      </div>
    </div>
    
  </main>




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
