<%@page import="member.MemberDto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>


<jsp:useBean id="membermanager" class="member.MemberManager"/>

<%
	String idkey =  (String)session.getAttribute("idKey");
	MemberDto dto = membermanager.getData(idkey);
%>

<!DOCTYPE html>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">
<title>Insert title here</title>
<script src="../js/script.js?ver=2"></script>
<script type="text/javascript">

window.onload = function(){

	//직업 가저오기

	var job = document.getElementsByName("job")[0];

	for(var i = 0;i<job.length;i++){

		if(job[i].value ==="<%=dto.getJob()%>"){

			job[i].selected = true;

		}

	}
	document.getElementById("btnZip").onclick = checkzip;
	document.getElementById("btnModify").onclick = memberModify;
	document.getElementById("btnModifyCancel").onclick = memberModifyCancel;
	document.getElementById("btnDelete").onclick = function(){
		memberDelete("<%=dto.getId()%>");
	}
}
</script>
<style>
.form-group{
text-align:right;
margin: auto 0;
height:60px;
wdith:100px;
}
</style>
</head>
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
<br>

	<!-- REGISTRATION FORM -->
	<div class="text-center" style="padding: 50px 0">
		<div class="logo" style="font-size: 60px; color: blue;">
			MEMBER<br>MODIFY
		</div>
		<!-- Main Form -->
		<div class="login-form-1">
			<form name="regForm" method="post" action="modify_member_action.jsp"
				id="register-form" class="text-left">
				<div class="login-form-main-message"></div>
				<div class="main-login-form">
					<div class="login-group" style="height: 700px;">
						<div class="form-group">
							<label for="reg_username" class="sr-only">ID</label> <input
								type="text" class="form-control" id="reg_username" name="id"
								style="background-color: lightgray" readonly="readonly"
								value="<%=dto.getId()%>">
						</div>
						<div class="form-group">
							<label for="reg_password" class="sr-only">PASSWORD</label> <input
								type="password" class="form-control" id="reg_password"
								name="pass" value="<%=dto.getPass() %>">
						</div>
						<div class="form-group">
							<label for="reg_password_confirm" class="sr-only">PASSWORD
								CONFIRM</label> <input type="password" class="form-control"
								id="reg_password_confirm" name="repass"
								placeholder="PASSWORD CONFIRM">
						</div>
						<div class="form-group">
							<label for="reg_fullname" class="sr-only">NAME</label> <input
								type="text" class="form-control" id="reg_fullname" name="wname"
								value="<%=dto.getWname() %>">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">EMAIL</label> <input
								type="text" class="form-control" id="reg_email" name="mail"
								size="27" value="<%=dto.getMail() %>">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">PHONE</label> <input
								type="text" class="form-control" id="reg_email" name="phone"
								value="<%=dto.getPhone() %>">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">ZIP CODE</label> <input
								type="text" class="form-control" id="sample6_postcode"
								name="zipcode" size="7" value="<%=dto.getZipcode()%>"> <input
								type="button" onclick="sample6_execDaumPostcode()" value="FIND"
								id="btnZip">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">ADDRESS</label> <input
								type="text" class="form-control" id="sample6_address"
								value="<%=dto.getAddress()%>">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">ADDRESS</label> 
							<input
								type="text" class="form-control" id="sample6_address2"
								value="<%=dto.getAddress()%>">
						</div>

						<div class="form-group">
							<select name="job" onselect="기타" onshow="기타">
								<option value="0">---------------직업을 선택하세요.---------------
								<option value="회사원">회사원
								<option value="학생">학생
								<option value="자영업">자영업
								<option value="주부">주부
								<option value="기타">기타
							</select>
						</div>

						<div class="form-group">
							<input type="button" style="background-color:white; border-style: none; color:red" value="수정완료" id="btnModify" />
							&nbsp;&nbsp;
							<input type="button" style="background-color:white; border-style: none;" value="수정취소" id="btnModifyCancel" />
							&nbsp;&nbsp; 
							<input type="button" style="background-color:white; border-style: none;" value="회원탈퇴" id="btnDelete" />
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	
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