<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="boardmanager" class="board.BoardManager" />
<jsp:useBean id="dto" class="board.BoardDto" />
<%
	String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
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
<script type="text/javascript">
//입력 자료 검사
function check() {
	if (write_form.name.value == "") {
		alert("이름을 입력하세요");
		write_form.name.focus();
	} else if (write_form.pass.value == "") {
		alert("비밀번호를 입력하세요");
		write_form.pass.focus();
	} else if (write_form.mail.value == "") {
		alert("이메일을 입력하세요");
		write_form.mail.focus();
	} else if (write_form.title.value == "") {
		alert("제목을 입력하세요");
		write_form.title.focus();
	} else if (write_form.cont.value == "") {
		alert("내용을 입력하세요");
		write_form.cont.focus();
	} else
		write_form.submit();
}
</script>
<body>
<%
	String memberid = (String)session.getAttribute("idKey");
	String login_check = "";
	String member_register_check = "";
	
	if(memberid == null){  //로그인 중이면
		login_check = "<a href='login.jsp'>LOGIN</a>";
		member_register_check = "<a href='../member/register_form.jsp'>JOIN</a>";
		
	} else {  //로그인이 되어있지 않으면
		login_check = "<a href='login_out.jsp'>LOGOUT</a>";
		member_register_check = "<a href='../guest/modify_member_form.jsp'>MODIFY</a>";
	}
%>

<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>

		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown">
				<a href="#" class="active dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false"
					style="font-size: 30px; color: #00107a;">SUBMIT 
					<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/SSS/guest/guest_index.jsp">MAIN</a></li>
						<li class="divider"></li>
						<li><a href="/SSS/guest/productlist.jsp">ALL</a></li>
						<li><a href="#">-</a></li>
						<li><a href="productNew.jsp">NEW</a></li>
						<li><a href="productBest.jsp">BEST</a></li>
						<li class="divider"></li>
						<li><a href="#">OUTER</a></li>
						<li><a href="productTop.jsp">TOP</a></li>
						<li><a href="#">BOTTOM</a></li>
						<li><a href="#">DRESS</a></li>
						<li><a href="#">ETC</a></li>
						<li class="divider"></li>
						<li><a href="productView.jsp">View</a></li>
					</ul></li>
				<li><a href="notice.jsp" style="color: gray;">NOTICE <span
						class="sr-only">(current)</span></a></li>
				<li class="active"><a href="boardlist.jsp" style="color: gray;">Q&A</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="http://instagram.com/daaahyun"
					style="color: gray;">INSTAGRAM</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"
					style="color: red;">Connection <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><%=login_check %></li>
						<li><%=member_register_check %></li>
						<li><a href="/SSS/guest/cartlist.jsp">Cart</a></li>
						<li><a href="/SSS/guest/orderlist.jsp">Order</a></li>

					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
	

	
	<form name="write_form" method="post" action = "write_action.jsp">
	<h2 style="text-align: center; color:red;">Q&A<br>WRITER</h2>
	<br><br>
	<div class="container text-center in">
				<div class="container text-left in" style="align:center; height:100%; width:500px;">
				<p>NAME*</p>
				<input class="form-control" name="name" placeholder="name"><br>
				
				<p>PASSWORD*</p>
				<input class="form-control" type="password" name="pass" placeholder="password"><br>
		
				<p>EMAIL*</p>
				<input class="form-control" name="mail" placeholder="email"><br>
			
				<p>TITLE*</p>
				<input class="form-control" name="title" placeholder="title"><br>
				
			
				<p>CONTENT*</p>
				<textarea class="form-control" name="cont" cols="50" rows="10" placeholder="content"></textarea>
				</div>
			<br>
			<br>
			
					<input type="button" value="MAIN" onClick="location.href='../index.jsp'" 
										style="background-color:white; border-style: none;">&nbsp;
					<input type="button" value="[ OK ]" onClick="check()" 
										style="background-color:white; color:red; border-style: none;">&nbsp;
					<input type="button" value="LIST" onClick="location.href='list.jsp'" 
										style="background-color:white; border-style: none;">
				
		
		</div>
	</form>

					
		
		<br> <br>
		<div class="container text-center" style="color: gray;">

			Copyright &copy; 2018 김다현 All Rights Reserved. <a href="#"
				onclick="window.open(
					'../admin/admin_login.jsp',
					'',
					'width=300,height=150,top=200,left=300')">
				관리자 </a> <br>-<br> + 82 10 4630 2769

		</div>


		<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="../js/bootstrap.min.js"></script>
</body>
</html>
