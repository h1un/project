<%@page import="member.MemberBean"%>
<%@page import="member.MemberDAO"%>
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
	
	MemberDAO dao = new MemberDAO();
	MemberBean mBean = dao.getMember(id);
	
	
	String passwd = mBean.getPasswd();
	
	%>


<script type="text/javascript">

function del() {
	
	 if(document.fr.passwd.value==<%=passwd%>){
		
		
		var result = confirm("탈퇴하시겠습니까?");
		if (result == true) {
			location.href = "deletePro.jsp?passwd="+document.fr.passwd.value;
		} else {
			return;
		}
	}else{
		
		alert("비밀번호가 맞지 않습니다.")
		return false;
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
          <div class="col-md-5 mx-auto" data-aos="fade-up">
            <h2>탈퇴하기</h2>
            <p>탈퇴하기 위해 비밀번호를 입력하세요</p>
          	<form action="deletePro.jsp" method="post" role="form" name = "fr">
              <div class="row">
              	<div class="col-md-12 form-group">
                  <label>ID</label>
                  <label> <p style="font-size: 25px;"><%=id %></p></label>
                  </div>
                  
                <div class="col-md-12 form-group">
                  <label for="name">Password</label>
                  <input type="password" name="passwd" class="form-control" placeholder="비밀번호" required="required"  />
                 </div>


                <div class="col-md-12 form-group">
                  <input type="button" class="readmore d-block w-100" value="탈퇴하기" onclick="del(); return false;">
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
