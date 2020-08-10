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



<!-- ajax - 파일태그 숨겨서 span태그에 표시하기  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<%
String id = (String)session.getAttribute("id");
if(id == null){
	response.sendRedirect("../member/login.jsp");
}
%>


</head>

<body>

	<jsp:include page="../inc/top.jsp"/>


  <main id="main">

    <div class="site-section site-portfolio">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-8 mx-auto" data-aos="fade-up">
            <h2>Gallery</h2>
            <p>게시판</p>
          <form action="writePro.jsp" method="post" enctype="multipart/form-data">
              
              	<div class="col-md-12 form-group">
                  <label>Subject</label>
                  <input type="text" class="form-control" name="subject" id="subject" />
                  <div class="validate"></div>
                </div>

                <div class="col-md-12 form-group">
                	<label for="name">file</label>
           			<input id="fileinput" type="file" accept="image" name="file" style="display:none; required="required"/>
					<input type = "button" id="falseinput" value = "선택" class="readmore" style="padding: 5px 15px;"/>
					<span id="selected_filename">선택된 파일 없음</span>
           		</div>
           		
           		
           		<script type="text/javascript">
					$(document).ready( function() {
						  $('#falseinput').click(function(){
						    $("#fileinput").click();
						  });
						});
						$('#fileinput').change(function() {
						  $('#selected_filename').text($('#fileinput')[0].files[0].name);
						});
					
					</script>
                
    
                <div class="col-md-12 form-group">
                  <label for="name">Content</label>
                  <textarea class="form-control" name="content" cols="30" rows="10" ></textarea>
                  <div class="validate"></div>
                </div>
                <div class="col-md-12 form-group mx-center">
                  <input type="submit" class="readmore d-block w-50" value="등록">
                </div>

                
                </div>
              </div>

            </form>
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
