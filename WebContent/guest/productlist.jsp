<%@page import="product.ProductDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="productmanager" class="product.ProductManager"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript" src="../js/script.js?ver=1.0"></script>
</head>
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
.carousel-control{
background-image:none;
}
.carousel-control.right{
background-image:none;
}

</style>
<body>
	
	<%@ include file="../guest/guest_top.jsp" %>
	
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
	<%	
		ArrayList<ProductDto> list = productmanager.getProductAll(); 
		for(ProductDto dto : list){
	%>
	<div class="responsive">
  	<div class="gallery">
  	
    		<a target="_blank" href="javascript:productDetail('<%=dto.getPno()%>')">
      	<img src="/JSP2/chap04/jongwon/<%=dto.getImage() %>" alt="Cinque Terre"  VSPACE=10 HSPACE=30>
    		</a>
  		  	<div class="desc"><%=dto.getPname() %>
  		  	<br><br>
  		  	<%=dto.getPrice() %><br>
  		  	
  		  	</div>
  		  	
  	</div>
	</div>
		<%	} %>
	</div>

	<%@ include file="../guest/guest_bottom.jsp" %>
	
	<!-- 제품번호를 상세보기로 넘기기 위한 form -->
	<form action="productdetail_guest.jsp" name="detailFrm" method="post">
		<input type="hidden" name="pno">
	</form>
	
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>