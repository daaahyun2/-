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

/*********************** Demo - 4 *******************/
.box4{position:relative}
.box4:before{width:0;height:200%;background:rgba(0,0,0,.5);position:absolute;top:0;left:-250px;bottom:0;transform:skewX(-36deg);transition:all .5s ease 0s}
.box4:hover:before{width:200%}
.box4 img{width:100%;height:auto; padding-bottom:10%;}
.box4 .box-content{width:100%;height:100%;padding-top:20%;position:absolute;top:0;left:0;transform:scale(0);transition:all .3s ease 0s}
.box4 .icon,.box5 .icon{list-style:none;padding:0}
.box4:hover .box-content{transform:scale(1)}
.box4 .title{font-size:22px;font-weight:700;color:#fff;margin:0 0 10px}
.box4 .post{display:block;font-size:15px;font-weight:600;color:#fff;margin-bottom:20px}
.box4 .icon{margin:0}
.box4 .icon li{display:inline-block}
.box4 .icon li a{display:block;width:35px;height:35px;line-height:35px;font-size:20px;background:#fff;color:#ee4266;margin-right:10px;transition:all .3s ease 0s}
.box5 .icon,.box5 .icon li{display:inline-block}
@media only screen and (max-width:990px){.box4{margin-bottom:30px}
}
@media only screen and (max-width:767px){.box4:before{left:-400px}
.box4:hover:before{width:300%}
}


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
            <li class="active"><a href="productNew.jsp">NEW</a></li>
            <li><a href="productBest.jsp">BEST</a></li>
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
	
		
	<!-- 이미지갤러리 -->
	<div class= "container">
	<h1 class="text-center" style="padding-bottom:2em; color:red;">TOP</h1>
	 <!------------------ Hover Effect Style : Demo - 4 --------------->
        <div class="container mt-40">
            <h3 class="text-center">item.</h3>
            <div class="row mt-30">
                <div class="col-md-4 col-sm-6">
                    <div class="box4">
                        <img src="/JSP2/chap04/jongwon/12.jpeg">
                        <div class="box-content">
                            <h3 class="title">Williamson</h3>
                            <span class="post">Web Developer</span>
                            <ul class="icon">
                                <li><a href="#" class="fa fa-search"></a></li>
                                <li><a href="#" class="fa fa-link"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="box4">
                        <img src="/JSP2/chap04/jongwon/19.jpeg">
                        <div class="box-content">
                            <h3 class="title">Kristiana</h3>
                            <span class="post">Web Designer</span>
                            <ul class="icon">
                                <li><a href="#" class="fa fa-search"></a></li>
                                <li><a href="#" class="fa fa-link"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="box4">
                        <img src="/JSP2/chap04/jongwon/13.jpeg">
                        <div class="box-content">
                            <h3 class="title">Kristiana</h3>
                            <span class="post">Web Designer</span>
                            <ul class="icon">
                                <li><a href="#" class="fa fa-search"></a></li>
                                <li><a href="#" class="fa fa-link"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="box4">
                        <img src="/JSP2/chap04/jongwon/31.jpeg">
                        <div class="box-content">
                            <h3 class="title">Kristiana</h3>
                            <span class="post">Web Designer</span>
                            <ul class="icon">
                                <li><a href="#" class="fa fa-search"></a></li>
                                <li><a href="#" class="fa fa-link"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="box4">
                        <img src="/JSP2/chap04/jongwon/30.jpeg">
                        <div class="box-content">
                            <h3 class="title">Kristiana</h3>
                            <span class="post">Web Designer</span>
                            <ul class="icon">
                                <li><a href="#" class="fa fa-search"></a></li>
                                <li><a href="#" class="fa fa-link"></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
	
	
	
	<br><br>
	<hr>
	<br><br>
	<footer class="text-center" style="color:gray;">Copyright &copy; 2018 김다현 All Rights Reserved.
	<br>-<br>+82 10 4630 2769</footer>

	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>	
	
	
	</body>
</html>