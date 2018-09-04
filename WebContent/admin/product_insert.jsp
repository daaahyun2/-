<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script src="../js/script.js?ver=0.3"></script>
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
	<%@ include file = "admin_top.jsp" %>
	
	<!-- 파일을 전송하기 위한 enctype -->
	<form name="productFrm" action="product_process.jsp?flag=insert" enctype="multipart/form-data" method="post">
	
	
		<div class="container text-center out">
				<h2 style="text-align: center; color:red;">PRODUCT<br>+<br>UPLOAD</h2>
				
				<br><br>
				
				
				<div class="container text-left in" style="float:right; width:50%; ">
				
				<p>NAME</p>
				<input class="form-control" type="text" name="name">
			
				<p>PRICE</p>
				<input class="form-control" type="text" name="price">
			
				<p>Qny</p>
				<input class="form-control" type="text" name="stock">
				
				<p>DETAIL</p>
				<textarea class="form-control" name="detail" cols="50" rows="10"></textarea>
				<br><br><br><br>
				<div class="container text-center in" style="width:50%; ">
				<input style="color:red;" type="submit" value="UPLOAD">
				<input style="background-color:white; color:black;" type="reset" value="RESET" onclick="resetInsertData()">
				</div>
				</div>
				
				<div class="container text-left in" style="float:left; width:50%;">
		
				<p>IMAGE<input type="file" name="image" size="30" onchange="filePreview()"></p>
				<div class="in">
					<img name="preview" src="../images/product/noimage.jpg" style="width:100%">
				</div>
				</div>
					
			
		</div>
	</form>
	
	<%@ include file = "admin_bottom.jsp" %>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>
