<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
		
<title>@SUBMIT</title>
<style>

/* carousel */
.media-carousel 
{
  margin-bottom: 0;
  padding: 0 40px 30px 40px;
  margin-top: 30px;
}
/* Previous button  */
.media-carousel .carousel-control.left 
{
  left: -12px;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px 23px 23px 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px
}
/* Next button  */
.media-carousel .carousel-control.right 
{
  right: -12px !important;
  background-image: none;
  background: none repeat scroll 0 0 #222222;
  border: 4px solid #FFFFFF;
  border-radius: 23px 23px 23px 23px;
  height: 40px;
  width : 40px;
  margin-top: 30px
}
/* Changes the position of the indicators */
.media-carousel .carousel-indicators 
{
  right: 50%;
  top: auto;
  bottom: 0px;
  margin-right: -19px;
}
/* Changes the colour of the indicators */
.media-carousel .carousel-indicators li 
{
  background: #c0c0c0;
}
.media-carousel .carousel-indicators .active 
{
  background: #333333;
}
.media-carousel img
{
  width: auto;
  height: auto;
}
/* End carousel */

</style>
</head>
	<body>
	<% 
		String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      <li class="dropdown">
          <a href="#" class="active dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="font-size:30px; color:black;">SUBMIT <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="index.jsp">MAIN</a></li>
            <li class="divider"></li>
            <li ><a href="productAll.jsp">ALL</a></li>
            <li><a href="#">-</a></li>
            <li><a href="productNew.jsp">NEW</a></li>
            <li class="active"><a href="productBest.jsp">BEST</a></li>
            <li class="divider"></li>
            <li><a href="#">OUTER</a></li>
            <li><a href="productTop.jsp">TOP</a></li>
            <li><a href="#">BOTTOM</a></li>
            <li><a href="#">DRESS</a></li>
            <li><a href="#">ETC</a></li>
          </ul>
        </li>
        <li ><a href="notice.jsp" style="color:gray;">NOTICE <span class="sr-only">(current)</span></a></li>
        <li><a href="bbs.jsp" style="color:gray;">Q&A</a></li>
      </ul>
  
		<%
		 	if(userID == null){	//  로그인이 되어 있지 않다면
		%>
		 <ul class="nav navbar-nav navbar-right">
        <li><a href="http://instagram.com/daaahyun" style="color:gray;">INSTAGRAM</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color:red;">Connection <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="login.jsp">LOGIN</a></li>
            <li><a href="join.jsp">JOIN</a></li>
       
          </ul>
        </li>
      </ul>
		
		<%
		 	}else {
		%>
		
		<ul class="nav navbar-nav navbar-right">
			<li class="dorpdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">MemberManagement<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">LOGOUT</a></li>
				</ul>
			</li>
		</ul>
		<%
		 	}
		%>
		</div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->

	    				<br><br>
	
		
	<!-- 베스트 상품 캐러셀 -->
<div class="container">
  <div class="row">
    <h2>WEEKEND BEST ITEM</h2>
  </div>
  <div class='row'>
    <div class='col-md-8'>
      <div class="carousel slide media-carousel" id="media">
        <div class="carousel-inner">
          <div class="item  active">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/37.jpeg"></a>
              </div>          
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/36.jpeg"></a>
              </div>
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/35.jpeg"></a>
              </div>        
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/34.jpeg"></a>
              </div>          
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/33.jpeg"></a>
              </div>
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/32.jpeg"></a>
              </div>        
            </div>
          </div>
          <div class="item">
            <div class="row">
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/31.jpeg"></a>
              </div>          
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/38.jpeg"></a>
              </div>
              <div class="col-md-4">
                <a class="thumbnail" href="#"><img alt="" src="/JSP2/chap04/jongwon/39.jpeg"></a>
              </div>      
            </div>
          </div>
        </div>
        <a data-slide="prev" href="#media" class="left carousel-control">‹</a>
        <a data-slide="next" href="#media" class="right carousel-control">›</a>
      </div>                          
    </div>
  </div>
</div>
	
	
	
	<br><br>
	<hr>
	<br><br>
	<footer class="text-center" style="color:gray;">Copyright &copy; 2018 김다현 All Rights Reserved.
	<br>-<br>+82 10 4630 2769</footer>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>	
	
	
	</body>
</html>