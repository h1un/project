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
	<script type="text/javascript">
	
	function result(){
		opener.document.fr.idDuplication.value = "idcheck";
		opener.document.fr.id.value = document.nfr.chkid.value;
		window.close();
	}
	</script>

</head>
<body>


<div style="padding:20px;">
<%
	String id = request.getParameter("chkid");

	MemberDAO mdao = new MemberDAO();
	
	int check = mdao.idCheck(id);
	
	if(check==1){
		out.println("이미 사용중인 ID입니다.");
	}else{
		out.println("사용가능한 ID입니다.");
%>
		<%--사용가능한 ID이면 사용함 버튼을 눌러서 부모창에 사용가능한 ID뿌려주기  --%>
		
	 	<input type="button" value="사용하기" class="readmore" onclick="result();">
	 	
<%	
	}

%>

	<br><br>
	<form action="IDcheck.jsp" method="post" name="nfr">
		<table><tr><td>ID </td><td><input type="text" name="chkid" id="chkid" value="<%=id%>" class="form-control"></td>
		<td><input type="submit" value="중복확인" class="readmore"></td></tr></table>
	</form>

</div>
</body>
</html>