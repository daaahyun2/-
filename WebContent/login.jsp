<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
	
	 <!-- 카카오톡 -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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

<title>@SUBMIT</title>
</head>
	<body>
	
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      <li class="dropdown">
          <a href="#" class="active dropdown-toggle" data-toggle="dropdown" aria-expanded="false" style="font-size:30px; color:black;">SUBMIT <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="index.jsp">MAIN</a></li>
            <li class="divider"></li>
            <li><a href="productAll.jsp">ALL</a></li>
            <li><a href="#">-</a></li>
            <li><a href="productNew.jsp">NEW</a></li>
            <li><a href="#">BEST</a></li>
            <li class="divider"></li>
            <li><a href="#">OUTER</a></li>
            <li><a href="#">TOP</a></li>
            <li><a href="#">BOTTOM</a></li>
            <li><a href="#">DRESS</a></li>
            <li><a href="#">ETC</a></li>
          </ul>
        </li>
        <li ><a href="notice.jsp" style="color:gray;">NOTICE <span class="sr-only">(current)</span></a></li>
        <li><a href="bbs.jsp" style="color:gray;">Q&A</a></li>
      </ul>
  
      <ul class="nav navbar-nav navbar-right">
        <li><a href="http://instagram.com/daaahyun" style="color:gray;">INSTAGRAM</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color:red;">Connection <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li class="active"><a href="login.jsp">LOGIN</a></li>
            <li><a href="join.jsp">JOIN</a></li>
       
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
  
	<div class="container">
		<div class="col-Lg-4">
			<div class="jumbotron" style="padding-top: 20px; color:gray; background-color:white; ">
				<form method="post" action="loginAction.jsp">
					<h1 style="text-align: center;">LOGIN</h1>
					<div class="form-group">
						<input type="text" class="form-control" 
							   placeholder="ID" name="userID"
							   maxlength="20" style="height:40px;">
					</div>
					<div class="form-group"  >
						<input type="password" class="form-control" 
							   placeholder="Password" name="userPassword"
							   maxlength="20" style="height:40px;">
					</div>
					<input type="submit" 
						   class="btn btn-primary form-control" 
						   value="Connection" style="background-color:black; height:40px;">
					
				</form>
			</div>
		</div>
	</div>
	<div class="container">
		
		<!-- 카카오 연동 로그인 -->

		<a href="http://developers.kakao.com/logout"></a> 
		<a id="custom-login-btn" href="javascript:loginWithKakao()">
			<img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="300" />
		</a>
		<script type='text/javascript'>
			//<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('23b093d8e2fad404cac05d79c270cafc');
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					//alert(JSON.stringify(authObj));
					alert("로그인 되었습니다.");
					location.href = "main.jsp";

				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
			//]]>
		</script>
	</div>
<br><br>
	<hr>
	<br><br>
	<footer class="text-center" style="color:gray;">Copyright &copy; 2018 김다현 All Rights Reserved.
	<br>-<br>+82 10 4630 2769</footer>



	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	
	 

 
	</body>
</html>