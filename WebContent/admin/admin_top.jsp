<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<style>

</style>
</head>

<%
	String admin_id = (String)session.getAttribute("adminOk");
	if(admin_id == null) {
%>
	<script>
		alert("관리자 로그아웃 되었습니다.");
		location.href = "../guest/guest_index.jsp";
	</script>
<%
		return;
	}
%>
<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown">
				<a href="#" class="active dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false"
					style="font-size: 30px; color: red;">AD-SUBMIT 
					<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li class="active"><a href="admin_index.jsp">MAIN</a></li>
						<li><a href="#">-</a></li>
						<li><a href="../guest/guest_index.jsp">CUSTOMER</a></li>
						<li><a href="admin_index.jsp">ADMIN</a></li>
						<li class="divider"></li>
						<li><a href="#">MANAGER</a></li>
						<li><a href="#">-</a></li>
						<li><a href="membermanager.jsp">MEMBER</a></li>
						
						<li><a href="productmanager.jsp">PRODUCT</a></li>
						
						<li><a href="ordermanager.jsp">ORDER</a></li>
					</ul></li>
				<li><a href="../board/notice.jsp" style="color: gray;">NOTICE <span
						class="sr-only">(current)</span></a></li>
				<li><a href="../board/boardlist.jsp" style="color: gray;">Q&A</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"
					style="color: red;">Connection <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="admin_login_out.jsp">LOGOUT</a></li>
						<li><a href="mailto:daaahyun2@naver.com">CONTACT</a></li>
						<li><a href="http://instagram.com/daaahyun">INSTAGRAM</a></li>
						<li><a href="http://daaahyun2.blog.me/">BLOG</a></li>
						<li><a href="http://facebook.com">FACEBOOK</a></li>
						

					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
