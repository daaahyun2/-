<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<% session.removeAttribute("idKey");%>
	<script type="text/javascript">
		alert("로그아웃 성공");
		location.href="../index2.jsp";
	</script>
	
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>	
</body>
</html>