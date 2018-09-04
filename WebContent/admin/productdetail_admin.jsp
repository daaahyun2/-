<%@page import="product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productmanager" class="product.ProductManager"/>
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
<title>상품보기</title>
<link href="../css/style.css" rel="style/sheet" type="text/css">
<script type="text/javascript" src="../js/script.js?ver=0.3"></script>
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
<%@ include file="admin_top.jsp"%>
	<div class="container">
		<div class="jumbotron" style="background-color:white;">
			<div class="container">
			<img src="/JSP2/chap04/jongwon/<%=dto.getImage() %>" ALIGN=left WIDTH="400" HEIGHT="400" padding="2em"> <%=dto.getPno() %>
				
				<input type="hidden" name="product_no" value="<%=dto.getPno() %>">
				
				<h3 style="color:#00107a;"><%=dto.getPname() %></h3>
				
				<p style="color:gray; font-size:20px;"><br>
					<%=dto.getDetail()%><br> 
					
					<hr class="my-2">
					<%=dto.getPrice()%><br><br>
					
					Qty: <%=dto.getStock() %><br><br>
					
					Date: <%=dto.getSdate() %>
				</p>
		
				<a href="javascript:productUpdate('=<%=dto.getPno() %>')" style="color:blue">[ 수정하기 ]</a>&nbsp;&nbsp;
				<a href="javascript:productDelete('=<%=dto.getPno() %>')"style="color:black">[ 삭제하기 ]</a>
			
		</div>
		</div>
		</div>
	<%@ include file = "admin_bottom.jsp" %>
	
	<form action="product_update.jsp" name="updateFrm" method="post">
		<input type="hidden" name="pno">
	</form>
	
	<form action="product_process.jsp?flag=delete" name="delFrm" method="post">
		<input type="hidden" name="pno">
	</form>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>