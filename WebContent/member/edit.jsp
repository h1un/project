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

<script type="text/javascript">
$(document).ready(function(){
	$("#img_file").change(function(){
		readURL(this);
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function (e) {
				$('#ph').attr('src', e.target.result);
				$('#ph').css('visibility', 'visible');
				$('#ph').parent().parent().addClass('on');
			}                    
			reader.readAsDataURL(input.files[0]);
		}
	}

});

function sample6_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.userSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== ''
								&& /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== ''
								&& data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;

					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress")
							.focus();
				}
			}).open();
}

</script>


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
          	<h2>Edit</h2>
          	<p>회원정보 수정</p>
          <form action="editPro.jsp" method="post" enctype="multipart/form-data" >
            <div class="row">
            <div class="col-md-12 form-group text-center">
            <div class="img_regi">
				<div class="ph"><img id="ph" src="../profile/<%=profile %>" alt="" /></div>
			    
			    <input type="hidden" name = "profile" value="<%=profile %>">
			    <input type="file" id="img_file" name="profile_new" onclick="click" accept="image/*"/>
			</div>
			 	<h3><%=id %></h3>
			    <h6><%=birth %></h6>
			</div>
              	  <input type="hidden" name="id" id="id" class="form-control" value="<%=id %>" />
                  <input type="hidden" name = "birth" id="birth" class="form-control"  value="<%=birth %>" />
                  <input type="hidden" name = "passwd" id="passwd" class="form-control"  value="<%=passwd %>" />
                
                
                <div class="col-md-12 form-group">
                  <label for="name">Name</label>
                  <input type="text" name="name" id="name" class="form-control" value="<%=name %>" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-12 form-group">
                  <label for="introduce">Info</label>
                  <textarea class="form-control" name="introduce" id ="introduce" rows="3" ><%=introduce %></textarea>
                  <div class="validate"></div>
                </div>
                <div class="col-md-12 form-group">
                  <label for="mtel">Phone number</label>
                  <input type="text" name = "mtel" id="mtel" class="form-control"  value="<%=mtel %>" />
                  <div class="validate"></div>
                </div>
  
                <div class ="col-md-12 form-group">
                <label for="address">Address</label>
                <table style="width: 100%">
               	<tr>
               		<td><input type="text" name = "addr_zipcode" id="sample6_postcode" class="form-control"  value ="<%=addr_zipcode %>" /></td>
  			    	<td><input type="button" class="readmore d-block w-100"  value ="우편번호 찾기" onclick="sample6_execDaumPostcode()" /></td></tr>
                <tr>
                	<td><input type="text" name = "addr1" id="sample6_address" class="form-control"  value ="<%=addr1 %>" /></td>
                	<td><input type="text" name = "addr2" id="sample6_extraAddress" class="form-control"  value="<%=addr2 %>" /></td></tr>         
                <tr><td colspan="2"><input type="text" name = "addr3" id="sample6_detailAddress" class="form-control"  value="<%=addr3 %>" /></td></tr>         
                </table>
                </div>
				<div class="col-md-12 form-group">
                  <label for="email">email</label>
                  <input type="email" name = "email" id="email" class="form-control" value = "<%=email %>" />
                  <div class="validate"></div>
                </div>
                <div class="col-md-12 form-group">
                  <input type="submit" class="readmore d-block w-100" value="수정하기">
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
