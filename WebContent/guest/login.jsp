<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/custom.css" rel="stylesheet">

<!-- 카카오톡 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 네이버 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js"></script>


<style>


/* Customize container */
@media (min-width: 768px) {
  .container {
    max-width: 730px;
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

</style>

<title>사용자 로그인</title>
<script src="../js/script.js"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById("btnLogin").onclick = funcLogin;
		document.getElementById("btnHome").onclick = funcHome;
	}
</script>
</head>
<body style="background-color: white;">
<%@ include file="../guest/guest_top.jsp" %>

<!-- LOGIN FORM -->
<div class="text-center" style="padding:50px 0">
<%
	if (id == null || id == "") {
%>
	<div class="logo" style="font-size: 60px; color:blue;">LOGIN</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form name="loginForm" id="login-form" class="text-left">
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<input type="text" class="form-control" name="id" placeholder="ID" style="height:70px; font-size:16px;">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" name="passwd" placeholder="PASSWORD" style="height:70px; font-size:16px;">
					</div>
					<div class="form-group login-group-checkbox text-center">
						<input type="checkbox" id="lg_remember" name="lg_remember">
						<label for="lg_remember">remember</label>
					</div>
				</div>
				<input type="button" class="login-button" id="btnLogin" value="LOGIN"><i class="fa fa-chevron-right"></i>
			</div>
			<div class="etc-login-form">
				<p>go to the main? <a href="#" id="btnHome" >click here</a></p>
				<p>forgot your password? <a href="#">click here</a></p>
				<p style="color:red;">new user? <a href="../member/register_form.jsp">create new account</a></p>
			</div>
		</form>
	</div>
	<!-- end:Main Form -->
</div>
					<%
						} else {
					%>
					<div class="logo" style="font-size: 60px; color:blue;">LOGIN</div>
					<img alt="" src="/JSP2/chap04/jongwon/loding.gif">
					<br>
					<br>
					
					<%=id%>님 로그인 중입니다<br /> 
					
					<a href="../index2.jsp" style="color:red"><br>MAIN</a><br>
					<a href="login_out.jsp">LOGOUT</a>
					<%} %>
				
					
					
	<div class="container">
		
		<!-- 카카오 연동 로그인 -->
		
		<a id="kakao-login-btn"></a>
  <a href="http://developers.kakao.com/logout"></a>
  
  <script type='text/javascript'>
    //<![CDATA[
   // 사용할 앱의 JavaScript 키를 설정해 주세요.
   Kakao.init('23b093d8e2fad404cac05d79c270cafc');
   
   // 카카오 로그인 버튼을 생성합니다.
   Kakao.Auth.createLoginButton({
     container: '#kakao-login-btn',
     success: function(authObj) {
    alert("로그인 되었습니다.");
    location.href = "../index2.jsp";
     },
     fail: function(err) {
     alert(JSON.stringify(err));
     }
   });
    //
  </script>
 
 <!-- 네이버 연동 로그인 -->
 
<!-- (1) 버튼 event 처리를 위하여 id를 지정 id=loginButton -->
			<p>
				<div id="naverIdLogin"><a id="naverIdLogin_loginButton" href="#" role="button"><img src="https://static.nid.naver.com/oauth/big_g.PNG" width=320></a></div>
			</p>	<script>
		
			<!-- (3) LoginWithNaverId Javscript 설정 정보 및 초기화 -->

		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "KJpitC7woPjOZP2IvDvk",
				callbackUrl: "http://" + window.location.hostname + ((location.port==""||location.port==undefined)?"":":" + location.port) +"/SSS/guest/guest_index.jsp",
				isPopup: false,
				loginButton: {color: "green", type: 1, height: 60}
			}
		);
		/* (4) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();
		
		/* (5) 현재 로그인 상태를 확인 */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {
					/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
					setLoginStatus();
				}
			});
		});

		/* (6) 로그인 상태가 "true" 인 경우 로그인 버튼을 없애고 사용자 정보를 출력합니다. */
		function setLoginStatus() {
			var profileImage = naverLogin.user.getProfileImage();
			var nickName = naverLogin.user.getNickName();
			$("#naverIdLogin_loginButton").html('<br><br><img src="' + profileImage + '" height=50 /> <p>' + nickName + '님 반갑습니다.</p>');
			$("#gnbLogin").html("Logout");
			$("#gnbLogin").attr("href", "#");
			/* (7) 로그아웃 버튼을 설정하고 동작을 정의합니다. */
			$("#gnbLogin").click(function () {
				naverLogin.logout();
				location.reload();
			});
		}
	</script>
	</div>
	
	<%@ include file="../guest/guest_bottom.jsp" %>
	
					

				<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
				<script src="../js/bootstrap.min.js"></script>
</body>
</html>