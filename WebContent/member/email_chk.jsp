
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

request.setCharacterEncoding("UTF-8");
	String content = (String)session.getAttribute("content");
	String id= request.getParameter("id");
	
	MemberDAO mdao = new MemberDAO();
	MemberBean mbean = mdao.getMember(id);
	String pass = mbean.getPasswd();

	
%>

<script type="text/javascript">
function check() {
	var code = document.fr.con_chk.value;
	var authNum = <%=content %>;
	
	if(!code) {
		alert("인증번호를 입력해주세요");
		return false;
	}
	
	if(authNum == code) {
		
		alert("인증 성공!");
		
	<%
		session.removeAttribute("content");
	%>
		document.fr.submit();
		
	} else {
		alert("인증번호가 틀립니다. 다시 입력해 주세요.");
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
            <h2>ID/Password 찾기</h2>
            <p><%=id %>님 인증번호를 입력해주세요</p>
          	<form name="fr" action="confirmpass.jsp" method="post" role="form">
              <div class="row">
              	<div class="col-md-12 form-group">
		 			<label>인증번호</label> 
					<input type="text" class="form-control" name="con_chk" placeholder="인증번호 6자리" required="required">
					<input type="hidden" name="pass" value="<%=pass%>"> 
					<input type="hidden" name="id" value="<%=id%>"> 
                </div>
 
                


                <div class="col-md-6 form-group">
              <input type="button" class="readmore d-block w-100" onclick="check(); return false;" value="입력">
   
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
