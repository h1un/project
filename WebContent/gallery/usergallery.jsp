<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<script type="text/javascript">

function check(){
    if(document.search.keyWord.value == ""){
        alert("검색어를 입력하세요.");
        document.search.keyWord.focus();
        return;
    }
    document.search.submit();
}

//추가2. 처음으로 링크 클릭했을때 호출 되는 함수 
function fnList() {

    document.list.action = "rv_main.jsp";
    document.list.submit();

}

//추가6. 현재 글리스트 정보중.. 글제목을 클릭 했을떄.. 글번호를 넘겨받아..
//      form의 input의 value값을 설정
//      설정후 form 전송
function fnRead(num) {
    document.read.num.value = num;
    document.read.submit();
}



</script>


<%
request.setCharacterEncoding("utf-8");	

String id = (String)session.getAttribute("id");

BoardDAO bdao = new BoardDAO();

String keyWord = "", keyField = "";

int totalRecord = 0;
int numPerPage = 5;
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


Vector<BoardBean> v = bdao.getBoardList(keyField, keyWord);

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




SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");

%>


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
          	<h2><%=id %></h2>
          	<p></p>
          <form action="edit.jsp" method="post" enctype="multipart/form-data" >
            <div class="row">
            <div class="col-md-12 form-group text-center">
            <div class="img_regi">
				<img src="../profile/<%=profile %>" alt="" />
			</div>
			 	<h3><%=name %></h3>
                <h6><%=introduce %></h6>
                <h6><%=birth %></h6>
			</div>
            <div class="col-md-12 form-group">
            
            <div class="site-section site-portfolio">
      <div class="container">
        <div class="row mb-5 align-items-center">
          <div class="col-md-12 mx-auto" data-aos="fade-up">
            <h2>Board</h2>
            <p>게시판</p>
          <form action="write.jsp" method="post" role="form">
              
              <table class="col-md-11 form-group mr auto">
              <tr>
              	<th>no.</th>
              	<th>subject</th>
              	<th>id</th>
              	<th>date</th>
              	<th>read</th>
              </tr>
              	
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
					BoardBean bbean = (BoardBean)v.get(i);
%>
              
              <tr>
               	<td><%= bbean.getNum() %></td>
              	<td><a href = "read.jsp?num=<%=bbean.getNum()%>"><%= bbean.getSubject() %></a></td>
              	<td><%= bbean.getId() %></td>
              	<td><%= s.format(bbean.getDate()) %></td>
              	<td><%= bbean.getReadcount() %></td>
              </tr>
              
              
              <%
              }
			 	
			}
              
              
              
              %>
              </table>
   
				<div class = "row">
				<div class="col-md-10 form-group">
                </div>
                <%if(id!=null){ %>
                <div class="col-md-2 form-group">
                  <input type="submit" class="readmore d-block w-100" value="글쓰기">
                </div>
                <%} %>
                <div class="col-md-2 form-group">
			
			<%	
				if(totalBlock > 0){
					
					if(nowBlock > 0){
			%>			
				<a href="board.jsp?nowBlock=<%=nowBlock-1%>&nowPage=<%=(nowBlock-1)*pagePerBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">
					&laquo;
					</a>
			<%			
					}
			}
			%>

			<%
			  
			  for(int i=0; i<pagePerBlock; i++){
					
					if((nowBlock*pagePerBlock) + i == totalPage){
						break;
					}		
			  
			  		
			%>		
					<%--페이지 번호 링크  --%>
					<a href="board.jsp?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock)+i%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">			
						<%=(nowBlock * pagePerBlock) + 1 + i %>	
					</a>					
			<%
					if( ((nowBlock*pagePerBlock) + 1 + i) == totalRecord ){
						break;
					}			
				}
			  %>
				
				<%
				
				if(totalBlock > nowBlock + 1){
			%>	
				 <a href="board.jsp?nowBlock=<%=nowBlock+1%>&nowPage=<%=(nowBlock+1)*pagePerBlock%>&keyWord=<%=keyWord%>&keyField=<%=keyField%>">
				  &raquo;
				 </a>
			<%
				}
				%>
			</div>
                </div>
                
                
                </form>
              </div>
<form action="board.jsp" name="search" method="post">
							

			<select name="keyField" >
					<option value="subject">subject</option>
					<option value="content">content</option>
					<option value="name">id</option>
				</select>
				

  				<input type="text" placeholder="Search.." name="keyWord">
  				<button type="button" class = "readmore" onClick="check();">검색</button>

				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				
</form>
            
        </div>

          

        </div>
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
