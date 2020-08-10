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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">




//아이디 중복 체크 버튼 클릭시 호출 되는 함수 
	function winopen() {
		 
	//id입력란이 공백일경우  아이디를 입력하세요 !! 메세지를 띄우고  아이디입력란에 포커스가 깜박이게 
	if(document.fr.id.value == ""){
		window.alert("아이디를 입력해주세요");
		document.fr.id.focus();
		return;
	}	
	//창열기 
	var chkid = document.fr.id.value; //아이디입력란에 작성한 값 얻기 
	window.open("IDcheck.jsp?chkid="+ chkid, "", "width=300, height=200");
	
}



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





function inputIdChk(){
    document.fr.idDuplication.value ="idUncheck";
}

function checkVlaue() {
	
	if(!fr.pass.value){
		alert("비밀번호를 입력해주세요");
		return false;
	}
	
	if(!fr.name.value){
		alert("이름을 입력해주세요");
		return false;
	}
	
	if(!fr.phone.value){
		alert("전화번호를 입력해주세요");
		return false;
	}
	
	if(!fr.email.value){
		alert("이메일을 입력해주세요");
		return false;
	}
	
	
	if(fr.idDuplication.value != "idcheck"){
		alert("아이디 중복체크를 해주세요");
		return false;
	}
	
	else{
		document.fr.submit();
	}
}
</script>
<style type="text/css">
	#join span{
		color: #ff6666;
		font-size: 12px;
	}
	
	</style>

</head>

<body>

  <jsp:include page="../inc/top.jsp"/>

  <main id="main">

    <div class="site-section site-portfolio">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-5 mx-auto" data-aos="fade-up">
            <h2>Join</h2>
            <p>가입하기</p>
          <form action="joinPro.jsp" method="post" id="join" name="fr">
              
              <div class="row">
              	<div class="col-md-12 form-group">
                  <label for="id">ID  <span id="id_sp2"> 4~12자의 영문 대소문자와 숫자만 가능합니다</span></label>
                  <table><tr><td><input type="text" name="id" id="id" class="form-control" placeholder="아이디" required="required" onkeydown="inputIdChk()"/></td>
                  <td><button type="button" class="readmore" id="BTN_USERID_CHECK" onclick="winopen();">ID 중복체크</button></td></tr></table>
                  <input type="hidden" name="idDuplication" value="idUncheck"> </li>
	
                </div>
                <div class="col-md-12 form-group">
                  <label for="passwd">Password<span id="pass_sp1"> 4~12자의 영문 대소문자와 숫자만 가능합니다 <br/></span>
    <span id="pass_sp2"> 하나이상의 문자와 숫자가 포함되어야 합니다</span></label>
                  <input type="password" name="passwd" id="pass" class="form-control" placeholder="비밀번호" required="required" />
                </div>
                
                <div class="col-md-12 form-group">
                  <label for="passwd2">Repeat Password<span id="pass_sp3"> 비밀번호가 다릅니다</span></label>
                  <input type="password" name="passwd2" id="pass-repeat" class="form-control" placeholder="비밀번호 확인" required="required" />
                   
                </div>
                
                <div class="col-md-12 form-group">
                  <label for="name">Name</label>
                  <input type="text" name="name" id="name" class="form-control" placeholder="이름" required="required" />
                   
                </div>
                <div class="col-md-12 form-group">
                  <label for="birth">Birth<span id="birth_sp"> 생일은 형식이 올바르지 않습니다</span></label>
                  <input type="text" name = "birth" id="birth" class="form-control"  placeholder="생일 ex)970226" required="required" />
                   
                </div>
                <div class="col-md-12 form-group">
                  <label for="mtel">Phone number<span id="ph_sp"> 전화번호 형식이 잘못되었습니다.</span></label>
                  <input type="text" name = "mtel" id="phone" class="form-control"  placeholder="핸드폰 번호" required="required" />
                   
                </div>
  
                <div class ="col-md-12 form-group">
                <label for="address">Address</label>
                <table style="width: 100%">
               	<tr>
               		<td><input type="text" name = "addr_zipcode" id="sample6_postcode" class="form-control"  placeholder="우편번호" required="required" /></td>
  			    	<td><input type="button" class="readmore"  value ="우편번호 찾기" onclick="sample6_execDaumPostcode()" /></td></tr>
                <tr>
                	<td><input type="text" name = "addr1" id="sample6_address" class="form-control"  placeholder="주소" required="required" /></td>
                	<td><input type="text" name = "addr2" id="sample6_extraAddress" class="form-control"  placeholder="상세주소" required="required" /></td></tr>         
                <tr><td colspan="2"><input type="text" name = "addr3" id="sample6_detailAddress" class="form-control"  placeholder="상세주소" required="required" /> </td></tr>
                </table>        
                </div>
				
				<div class="col-md-12 form-group">
                  <label for="email">Email<span id="email_sp"> 이메일 형식이 잘못되었습니다.</span></label>
                  <input type="email" name = "email" id="email" class="form-control" placeholder="이메일" required="required" />
                   
                </div>
				
				<input type = "hidden" name = "introduce" value = "환영합니다.">
				<input type = "hidden" name = "profile" value = "avatar.png">

				
                <div class="col-md-12 form-group">
                  <input type="submit" class="readmore d-block w-100" value="가입하기">
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
<script type="text/javascript">
$(document).ready(function() {
	
	var getName= RegExp(/^[A-Za-z가-힣]{2}/);
	var re = RegExp(/[a-zA-Z0-9]{4,12}$/);
	var getPass = RegExp(/[a-zA-Z]{1}[0-9]{1}/);
	var re2 = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
	var getPhone = RegExp(/^(010|011)[-\s]?\d{3,4}[-\s]?\d{4}$/);
	var getEmail = RegExp(/^[\w\.-]{1,64}@[\w\.-]{1,252}\.\w{2,4}$/);	
	var getBirth = RegExp(/^[0-9]{2}[0,1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/);
	
	
	$("#id_sp2").hide()
	$("#pass_sp1").hide()
	$("#pass_sp2").hide()
	$("#pass_sp3").hide()
	$("#name_sp").hide()
	$("#ph_sp").hide()
	$("#email_sp").hide()
	$("#birth_sp").hide()
	
	
	$("#id").blur(function() {
				 
		 if(!re.test($("#id").val())){
			 $("#id_sp2").show('fast');
			 $("#id").val("");
			/* alert("id는 4자이상 입력해야 합니다."); */
		 }else{$("#id_sp2").hide('fast');}
	
	});//id
	
	$("#pass").blur(function() {
		 if(!re.test($("#pass").val())){
			 $("#pass_sp1").show('fast');
			 $("#pass").val("");
		 }else{$("#pass_sp1").hide('fast');}
	 
		 if(!getPass.test($("#pass").val())){
			 $("#pass_sp2").show('fast');
			 $("#pass").val("");
		 }else{$("#pass_sp2").hide('fast');}
	
	});//pass
	
	$("#pass-repeat").blur(function() {
		var pass1 = $("#pass").val();
		var pass2 = $("#pass-repeat").val();
		 if(pass1!=pass2){
			 $("#pass_sp3").show('fast');
			 $("#pass-repeat").val("");
		 }else{$("#pass_sp3").hide('fast');}
	
	});//pass

	
	$("#name").blur(function() {		
		 if(!getName.test($("#name").val())){
			 $("#name_sp").show('fast');
			 $("#name").val("");
		 }else{$("#name_sp").hide('fast');} 
	});//name

	$("#phone").blur(function() {	
		 if(!getPhone.test($("#phone").val())){
			 $("#ph_sp").show('fast');
			 $("#phone").val("");
		 }else{$("#ph_sp").hide('fast');} 	 
	});//phone
	
	$("#email").blur(function() {	
		 if(!getEmail.test($("#email").val())){
			 $("#email_sp").show('fast');
			 $("#email").val("");
		 }else{$("#email_sp").hide('fast');} 	 
	});//email
	
	$("#birth").blur(function() {	
		 if(!getBirth.test($("#birth").val())){
			 $("#birth_sp").show('fast');
			 $("#birth").val("");
		 }else{$("#birth_sp").hide('fast');} 	 
	});//birth

});

</script>
</body>

</html>
