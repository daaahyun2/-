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
<script src="../js/script.js?ver=0.1"></script>
</head>
<style>
#out {
 width: 100%;
 text-align: center;
 }
#in {
 display: inline-block;
 }
</style>
<body>

<%@ include file="admin_top.jsp"%>
	<div class="container text-center">
	<h1><br>Product<br>Manager<br></h1><br><hr><br>
	<div class="container out">
		
	<div class="container in">
		<table class="table table-hover text-center">
					<thead style="color:red;">
						<tr>
							<th>No</th>
							<th class="text-center">PRODUCT</th>
							<th class="text-center">PRICE</th>
							<th class="text-center">DATE</th>
							<th class="text-center">QTY</th>
							
						</tr>
					</thead>
					<tbody>
	<%
		ArrayList<ProductDto> list = productmanager.getProductAll();
	
		if(list.size() == 0){
	%>
		<tr><td class="text-center" colspan="6"><h3>등록된 상품이 없습니다.</h3></td></tr>
	<%		
		} else {
			for(ProductDto dto:list){
	%>
				<tr>
					<td><%=dto.getPno() %></td>
					<td><a href="javascript:productDetail_admin('<%=dto.getPno() %>')" style="color:black"><%=dto.getPname() %></a></td>
					<td><%=dto.getPrice() %></td>
					<td><%=dto.getSdate() %></td>
					<td><%=dto.getStock() %></td>
				</tr>
	<%
			}		
		}
	%>
		<tr>
			<td colspan="6"><a href="product_insert.jsp" style="color:red"><h3>[ 상품등록 ]</h3></a></td>
		</tr>
	</table>
	</div>
	</div>
	</div>
	<%@ include file = "admin_bottom.jsp" %>
	<form action="productdetail_admin.jsp" name="detailFrm" method="post">
		<input type="hidden" name="pno">
	</form>
	
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>
