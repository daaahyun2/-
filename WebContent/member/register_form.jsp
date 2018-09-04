<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">

<title>Insert title here</title>
<script src="../js/script.js"></script>

<script type="text/javascript">


window.onload = function(){
	regForm.id.focus();
	document.getElementById("btnId").onclick = checkid;
	document.getElementById("btnZip").onclick = checkzip;
	document.getElementById("btnSubmit").onclick = inputCheck;
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
<body style="background-color: white;">
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

<!-- REGISTRATION FORM -->
	<div class="text-center" style="padding: 50px 0">
		<div class="logo" style="font-size: 60px; color: red;">JOIN</div>
		<!-- Main Form -->
		<div class="login-form-1">
			<form name="regForm" method="post" action="register_action.jsp"
				id="register-form" class="text-left">
				<div class="login-form-main-message"></div>
				<div class="main-login-form">
					<div class="login-group" style="height: 700px;">
						<div class="form-group">
							<label for="reg_username" class="sr-only">ID</label> <input
								type="text" class="form-control" id="reg_username" name="id"
								placeholder="ID"> <input type="button" value="CHECK"
								id="btnId">
						</div>
						<div class="form-group">
							<label for="reg_password" class="sr-only">PASSWORD</label> <input
								type="password" class="form-control" id="reg_password"
								name="pass" placeholder="PASSWORD">
						</div>
						<div class="form-group">
							<label for="reg_password_confirm" class="sr-only">PASSWORD CONFIRM</label> 
								<input type="password" class="form-control"
								id="reg_password_confirm" name="repass"
								placeholder="PASSWORD CONFIRM">
						</div>
						<div class="form-group">
							<label for="reg_fullname" class="sr-only">NAME</label> <input
								type="text" class="form-control" id="reg_fullname" name="wname"
								placeholder="NAME">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">EMAIL</label> <input
								type="text" class="form-control" id="reg_email" name="mail"
								placeholder="EMAIL">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">PHONE</label> 
							<input
								type="text" class="form-control" id="reg_email" name="phone"
								placeholder="PHONE">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">ZIP CODE</label>
							<input
								type="text" class="form-control" id="sample6_postcode"
								name="zipcode" placeholder="ZIP CODE"> <input
								type="button" onclick="sample6_execDaumPostcode()" value="FIND">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">ADDRESS</label> 
							<input
								type="text" class="form-control" id="sample6_address"
								name="address" placeholder="ADDRESS">
						</div>
						<div class="form-group">
							<label for="reg_email" class="sr-only">ADDRESS</label> 
							<input
								type="text" class="form-control" id="sample6_address2"
								placeholder="">
						</div>
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
							function sample6_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 각 주소의 노출 규칙에 따라 주소를 조합한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var fullAddr = ''; // 최종 주소 변수
												var extraAddr = ''; // 조합형 주소 변수

												// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
												if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
													fullAddr = data.roadAddress;

												} else { // 사용자가 지번 주소를 선택했을 경우(J)
													fullAddr = data.jibunAddress;
												}

												// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
												if (data.userSelectedType === 'R') {
													//법정동명이 있을 경우 추가한다.
													if (data.bname !== '') {
														extraAddr += data.bname;
													}
													// 건물명이 있을 경우 추가한다.
													if (data.buildingName !== '') {
														extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}
													// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
													fullAddr += (extraAddr !== '' ? ' ('
															+ extraAddr + ')'
															: '');
												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
												document
														.getElementById('sample6_address').value = fullAddr;

												// 커서를 상세주소 필드로 이동한다.
												d
							ocument.getElementById(
														'sample6_address2')
														.focus();
											}
										}).open();
							}
						</script>

						<div class="form-group">
							<label for="reg_email" class="sr-only">JOB</label>
							<select
								name=job>
								<option value="0">---------------직업을 선택하세요.---------------
								<option value="회사원">회사원
								<option value="학생">학생
								<option value="자영업">자영업
								<option value="주부">주부
								<option value="기타">기타
							</select>
						</div>
						
						<div class="form-group">
							<input type="reset" value="RESET">
						</div>
					</div>
					<input class="login-button" type="button" value="JOIN US"
						id="btnSubmit">


				</div>
				<div class="etc-login-form">
					<p>
						already have an account? <a href="../guest/login.jsp">login here</a>
					</p>
				</div>
			</form>
		</div>
		<!-- end:Main Form -->
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