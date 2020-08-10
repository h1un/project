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
<!--이미지 미리보기 -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<!--주소 -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<!-- 이미지 css -->
<style type="text/css">
.img_regi {
	text-align: center;
	padding: 6em 0 4em 0;
}

.img_regi {
	border-radius: 100%;
	display: inline-block;
	padding: 0.5em;
	border: solid 1px rgba(255, 255, 255, 0.25);
	background-color: rgba(255, 255, 255, 0.075);
}

.img_regi img {
	border-radius: 100%;
	display: block;
	width: 10em;
	height: 10em;
}

.img_regi input[type="file"] {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	filter: alpha(opacity = 0);
	opacity: 0;
	cursor: pointer;
	z-index: 5;
}
.img_regi { position:relative; display:inline-block; }

.img_regi input[type="file"] { position:absolute;  }


</style>
<%

	String id = (String)session.getAttribute("id");
	
	MemberDAO dao = new MemberDAO();
	MemberBean memberBean = dao.getMember(id);
	
	
	String name = memberBean.getName();
	String passwd = memberBean.getPasswd();
	String email = memberBean.getEmail();
	String addr_zipcode = memberBean.getAddr_zipcode();
	String addr1 = memberBean.getAddr1();
	String addr2 = memberBean.getAddr2();
	String addr3 = memberBean.getAddr3();
	String mtel = memberBean.getMtel();
	String profile = memberBean.getProfile();
	String introduce = memberBean.getIntroduce();
	String birth = memberBean.getBirth();
	
	%>

</head>

<body>

 <jsp:include page="../inc/top.jsp"/>

  

  <main id="main" >

    <div class="site-section site-portfolio ">
      <div class="container ">
        <div class="row mb-5 align-items-center">
          <div class="col-md-5 mx-auto  " data-aos="fade-up">
          	<h2>MyPage</h2>
          	<p>회원정보</p>
          <form action="edit.jsp" method="post" enctype="multipart/form-data" >
            <div class="row">
            <div class="col-md-12 form-group text-center">
            <div class="img_regi">
				<img src="../profile/<%=profile %>" alt="" />
			</div>
			 	<h3><%=id %> | <%=name %></h3>
                <h6><%=introduce %></h6>
			</div>
              	  <input type="hidden" name="id" id="id" class="form-control" value="<%=id %>" />
                  <input type="hidden" name = "birth" id="birth" class="form-control"  value="<%=birth %>" />
                  <input type="hidden" name = "passwd" id="passwd" class="form-control"  value="<%=passwd %>" />

              <table>
              <tr ><td><label>Birth</label></td>
              <td> <label><%=birth %></label></td></tr>
              <tr><td><label>Tel</label></td>
              <td><label><%=mtel %></label></td></tr>
		      <tr><td><label for="address">Address</label></td>
              <td><label>(<%=addr_zipcode %>)<%=addr1 %><%=addr2 %> <%=addr3 %></label></td></tr>
              <tr><td><label>Email</label></td>
              <td><label><%=email %></label></td></tr>
              </table>
				
				
                <div class="col-md-12 form-group">
                  <input type="submit" class="readmore d-block w-100" value="수정하기">
                </div>
                 <div class="col-md-12 form-group text-right">
                 
                <a href = "delete.jsp" class > 탈퇴하기 </a>
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
