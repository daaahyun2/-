<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="boardmanager" class="board.BoardManager" />
<jsp:useBean id="dto" class="board.BoardDto" />

<c:set var="content" value="${boardmanager.getData(param.num)}"/>
<c:set var="readcnt" value="${boardmanager.updateReadCnt(param.num)}"/>
<c:set var="pass" value="******" />
<c:if test="${!empty sessionScope.admin}">
	<c:set var="pass" value="${content.pass}" />
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">

<title>Insert title here</title>
</head>
<script type="text/javascript">
	function modifycheck() {
		if (prompt("비밀번호를 입력하세요") == document.getElementById("origin_pass").value) {
			location.href = "modify_form.jsp?num=${content.num}&page=${param.page}";
		}
	}
</script>
<style>

a:hover{
color:red;
}
</style>

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
<h2 style="text-align: center; color:black;">Q&A<br>CONTENT</h2>
	<input type="hidden" id="origin_pass" value="${content.pass}" />
	<div class="container text-center"><br><br>
		<div class="container text-center" style="height:100%; width:500px;">
			
	
			<br>
			
			WRITER :<a href="mailto:${content.mail }">${content.mail }</a>
			<br>
				
			<p style="color:gray;">DATE : ${content.write_date}</p>
			Cnt : ${content.readcnt }<br>
			<br>
			<p style="background-color: cyan; font-size: 20px; padding:0.75em;">TITLE :
				${content.title }</p>
		
			<p>
			<textarea class="form-control" readonly="readonly">${content.cont }</textarea></p>
					</div>
					
				<a href="reply_write_form.jsp?num=${content.num}&page=${param.page}" class="btn">
				<i class="icon-pencil"></i> 
				Write</a>

				<a href="javascript:modifycheck();" class="btn">
				<i class="icon-edit"></i>
				Edit</a>
				
				<a href="delete_form.jsp?num=${content.num}&page=${param.page}" class="btn">
				<i class="icon-trash"></i> 
				Delete</a>

				<a href="boardlist.jsp?page=${param.page}" class="btn">
				<i class="icon-align-justify"></i> 
				List</a>
			
				</div>
			<br>
			<br>
		
	


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

