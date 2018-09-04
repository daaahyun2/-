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
<body>
	
	<%@ include file="../guest/guest_top.jsp" %>
	
		<br><br>
		
	<!-- 이미지갤러리 -->
	<div class= "container">
	<h1 class="text-center" style="padding-bottom:2em; color:red;">NEW*</h1>
	
	 <!------------------ Hover Effect Style : Demo - 4 --------------->
 
        <div class="container mt-40">
        	<hr>
        <h3 class="text-center">item.</h3>
        <br>
        <div class="row mt-30">
    <%	
		ArrayList<ProductDto> list = productmanager.getProductAll(); 
		for(ProductDto dto : list){
	%>
                <div class="col-md-4 col-sm-6">
                 
                    <div class="box4">
                    
                        <img src="/JSP2/chap04/jongwon/<%=dto.getImage() %>">
                        <div class="box-content desc">
                        <a href="javascript:productDetail('<%=dto.getPno()%>')">
                            <h2 class="title"><%=dto.getPname() %></h2>
                            </a>
                            <span class="post"><%=dto.getPrice() %></span>
                            
                        </div>
                    </div>
                </div>
                <%	} %>
  		  	</div>	
  	</div>
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