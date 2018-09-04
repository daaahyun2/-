<%@page import="product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productmanager" class="product.ProductManager"/>
<% request.setCharacterEncoding("utf-8"); %>
<% 
	String pno = request.getParameter("pno");
	ProductDto dto = productmanager.getProduct(pno);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>상세보기</title>
<script type="text/javascript" src="../js/script.js"></script>
</head>
<style>
/* Customize container */
@media (min-width: 768px) {
  .container {
    max-width: outo;
  }
}
.container-narrow > hr {
  margin: 30px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
  text-align: center;
  border-bottom: 1px solid #e5e5e5;
}
.jumbotron .btn {
  padding: 14px 20px;
  font-size: 20px;
}
p {
    font-family: "Times New Roman";
    font-size: 7px;
}

</style>
<body>
	<%@ include file = "guest_top.jsp" %>
	
		<div class="container">
		<div class="jumbotron" style="background-color:white;">
			<div class="container">
			<form action="cartprocess.jsp">
			<img src="/JSP2/chap04/jongwon/<%=dto.getImage() %>" ALIGN=left WIDTH="400" HEIGHT="400" padding="2em">
				<%=dto.getPno() %>
				<input type="hidden" name="product_no" value="<%=dto.getPno() %>">
				<h3 style="color:#00107a;"><%=dto.getPname() %></h3>
				<p style="color:gray; font-size:20px;"><br>
					<%=dto.getDetail()%><br> 
					<hr class="my-2">
					<%=dto.getPrice()%><br><br>
					Qty: <input type="text" name="quantity" value="1" size="5" style="text-align: center;"></p>
				
					<input type="submit" value="Cart">
					<input type="button" value="List" onclick="history.back()">
		</form>
		</div>
	
		</div>
		</div>
	
	<%@ include file = "guest_bottom.jsp" %>	
	
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>
