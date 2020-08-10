<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
      <script type="text/javascript">
	function logout() {
		var result = confirm("정말 로그아웃 하시겠습니까?");
		if (result == true) {
			location.href = "../member/logout.jsp";
		} else {
			return;
		}
	}
	</script>
    
    
    
<div class="collapse navbar-collapse custom-navmenu" id="main-navbar">
    <div class="container py-2 py-md-5">
      <div class="row align-items-start">
        <div class="col-md-2">
          <ul class="custom-menu">
            <li class="active"><a href="../index.jsp">Home</a></li>
			<li><a href="../board/board.jsp">Board</a></li> 
			<li><a href="../gallery/gallery.jsp">Gallery</a></li> 
          </ul>
        </div>
        <div class="col-md-6 d-none d-md-block  mr-auto">
          
        </div>
        <div class="col-md-3 d-none d-md-block">
          <div class="tweet d-flex">
          	<%
			    String id = (String) session.getAttribute("id");
		
				//세션영역에 세션값이 존재하지 않으면
				if (id == null) {
				%>
			<span class="icofont-sign-in text-white mt-2 mr-3">
          	<a href="../member/login.jsp">Login</a> | <a href = "../member/join.jsp">Join</a></span>
          <%
				}else{
          %>
          	
          	
          	<br>
          	<label style="font-size: 20px; color : #ffffff;"><%=id %></label>
          	<span class="icofont-user text-white mt-2 mr-3">
         	<a href="../member/user.jsp">  MyPage</a> | <span class="icofont-sign-out text-white mt-2 mr-3">
          	<a href = "#" onclick="logout(); return false;">Logout</a></span>  
          	  
          <%
				}
          %>
 
          </div>
        </div>
      </div>

    </div>
  </div>
  
  <nav class="navbar navbar-light custom-navbar">
    <div class="container">
      <a class="navbar-brand" href="../index.jsp">MyPortfolio.</a>

      <a href="#" class="burger" data-toggle="collapse" data-target="#main-navbar">
        <span></span>
      </a>

    </div>
  </nav>