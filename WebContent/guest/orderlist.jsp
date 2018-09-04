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
<style>
#out {
 width: 100%;
 text-align: center;
 }
#in {
 display: inline-block;
 }
 </style>
</head>
<body>
	<%@ include file="../guest/guest_top.jsp" %>
	<div class="container text-center">
		<h1><br>Order<br><br></h1><br><hr><br>
		<div class="container out">
		
	<div class="container in">
		<table class="table table-hover text-center">
					<thead>
						<tr>
							<th>NAME</th>
							<th class="text-center">PRICE</th>
							<th class="text-center">QTY</th>
							
						</tr>
					</thead>
					<tbody>
		
	<%	
		ArrayList<ProductDto> list = productmanager.getProductAll(); 
		for(ProductDto dto : list){
	%>
			<tr>
				<td class="align-self-center">
					<img src="/JSP2/chap04/jongwon/<%=dto.getImage() %>" width="150" align="left">
					<a href="javascript:productDetail('<%=dto.getPno()%>')" style="color:red; position:center;"><h4><%=dto.getPname() %></h4></a>
				</td>
				<td><%=dto.getPrice() %></td>
				<td><%=dto.getStock() %></td>
				
				
			</tr>
			
	<%	} %>
	</tbody>
	</table>
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

