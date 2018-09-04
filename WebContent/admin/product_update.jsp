<%@page import="product.ProductDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%	request.setCharacterEncoding("utf-8"); %>

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
<title>Insert title here</title>
<script src="../js/script.js?ver=0.2"></script>
</head>
<body>
	<%@ include file = "admin_top.jsp" %>

	<!-- 파일을 전송하기 위한 enctype -->
	<form name="productFrm" action="product_process.jsp?flag=modify" enctype="multipart/form-data" method="post">
		<table style="width: 80%">
			<tr>
				<th colspan="2">** 상품 수정 **</th>
			</tr>
			<tr>
				<td style="width:20%">상품명</td>
				<td><input type="text" name="pname" value="<%=dto.getPname() %>"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="price" value="<%=dto.getPrice()%>"></td>
			</tr>
			<tr>
				<td>설 명</td>
				<td><textarea name="detail" rows="3" cols="30"><%=dto.getDetail()%></textarea></td>
			</tr>
			<tr>
				<td>재고량</td>
				<td><input type="text" name="stock" value="<%=dto.getStock()%>"></td>
			</tr>
			<tr>
				<td>이미지</td>
				<td>
					<input type="hidden" id="imagePath" value="" >
					<img name="preview" src="/JSP2/chap04/jongwon/<%=dto.getImage() %>" style="width:100%">
					<br/><input type="file" name="image" size="30" onchange="filePreview()">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<br/>
					<input type="submit" value="상품 수정">
					<input type="reset" value="새로 입력" onclick="resetInsertData()">
				</td>
			</tr>
		</table>
		<input type="hidden" name="pno" value="<%=dto.getPno()%>">
	</form>
	
	<%@ include file = "admin_bottom.jsp" %>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>