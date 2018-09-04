<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
		
<title>@SUBMIT</title>
<style>
	body {
    background-color:white;
}
.navbar{
 background-color:white;
}

div.gallery {
	margin: 5px;
    border: 1px solid #ccc;
    float: left;
    border: 1px solid #ccc;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}

* {
    box-sizing: border-box;
}

.responsive {
    padding: 0 20px;
    float: left;
    width: 24.99999%;
}

@media only screen and (max-width: 700px) {
    .responsive {
        width: 49.99999%;
        margin: 6px 0;
    }
}

@media only screen and (max-width: 500px) {
    .responsive {
        width: 100%;
    }
}

.clearfix:after {
    content: "";
    display: table;
    clear: both;
}

<!-- 이미지 슬라이드 음영제거 -->
.carousel-control.{
background-image:none;
}
.carousel-control.right{
background-image:none;
}


</style>
</head>
	<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;	//기본페이지 1페이지라는 것을 의미
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
						// parseInt 정수형으로바꿔주는 함수
						
	// 밑에 파라미터 가져오는거 추가해주고, 페이징처리 하는거 추가하셈!
	}
	%>
	
	
	<nav>
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
            <li class="active"><a href="#">ALL</a></li>
            <li><a href="#">-</a></li>
            <li><a href="productNew.jsp">NEW</a></li>
            <li><a href="productBest.jsp">BEST</a></li>
            <li class="divider"></li>
            <li><a href="#">OUTER</a></li>
            <li><a href="#">TOP</a></li>
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
</nav>
	    				<br><br>
	    				
	<!-- 이미지슬라이드 -->
	<div class="container" >
		<div id="myCarousel" class="carousel slide" data-ride="carousel"style="max-width: 1000px; margin: 0 auto">
			<oi class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
			</oi>
			<div class="carousel-inner" >
				<div class="item active" >
					<img src="/JSP2/chap04/jongwon/1.jpeg" width="400" height="300">   <!-- 이미지 -->
					<div class="carousel-caption d-none d-md-block">
						<h1 style="color:red">SUBMIT</h1>
						<p>All PRODUCT</p>
					</div>
				</div>
				<div class="item">
					<img src="/JSP2/chap04/jongwon/1.jpeg" width="400" height="300">
					<div class="carousel-caption d-none d-md-block">
						<h1 style="color:red">SUBMIT</h1>
						<p>All PRODUCT</p>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev"> <!-- 넘겨지는 화살표 -->
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>

		
	<!-- 이미지갤러리 -->
	<div class= "container">
	<h1 class="text-center">item.</h1>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/30.jpeg" alt="Cinque Terre"  VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/31.jpeg" alt="Cinque Terre"  VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/32.jpeg" alt="Cinque Terre"  VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/33.jpeg" alt="Cinque Terre"  VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/34.jpeg" alt="Cinque Terre"  VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/35.jpeg" alt="Cinque Terre"  VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/36.jpeg" alt="Cinque Terre"  VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/37.jpeg" alt="Cinque Terre" VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/36.jpeg" alt="Cinque Terre" VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/35.jpeg" alt="Cinque Terre" VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/34.jpeg" alt="Cinque Terre" VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	<div class="responsive">
  	<div class="gallery">
    		<a target="_blank" href="#">
      	<img src="/JSP2/chap04/jongwon/33.jpeg" alt="Cinque Terre" VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc">Add a description of the image here</div>
  	</div>
	</div>
	</div>
	<ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#!" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </li>
    <li class="page-item"><a class="page-link" href="#!">1</a></li>
    <li class="page-item"><a class="page-link" href="#!">2</a></li>
    <li class="page-item"><a class="page-link" href="#!">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#!" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </li>
  </ul>
	<br><br>
	<hr>
	<br><br>
	<footer class="text-center" style="color:gray;">Copyright &copy; 2018 김다현 All Rights Reserved.
	<br>-<br>+82 10 4630 2769</footer>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>	
	
	
	</body>
</html>