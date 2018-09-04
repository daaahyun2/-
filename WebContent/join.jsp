<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">

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
            <li><a href="#">NEW</a></li>
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
            <li><a href="login.jsp">LOGIN</a></li>
            <li class="active"><a href="join.jsp">JOIN</a></li>
       
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
	<div class="container">
		<div class="col-Lg-4">
			<div class="jumbotron" style="padding-top: 20px; color:gray; background-color:white;">
				<form method="post" action="joinAction.jsp">
					<h1 style="text-align: center;">JOIN</h1>
					<div class="form-group">
						<input type="text" class="form-control" 
							   placeholder="ID" name="userID"
							   maxlength="20" style="height:40px;">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" 
							   placeholder="Password" name="userPassword"
							   maxlength="20"
							    style="height:40px;">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" 
							   placeholder="Name" name="userName"
							   maxlength="20" style="height:40px;">
					</div>
					
					<!-- 다음 주소검색 -->
					<div class="form-group">
						<input type="text" id="sample6_postcode" placeholder="우편번호" style="width:auto; height:40px;"> 
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="width:auto; height:40px;">
					</div>
					<div class="form-group">
						<input type="text" id="sample6_address" placeholder="주소" style="width:100%; height:40px;">
					</div>
					<div class="form-group">	
						<input type="text" id="sample6_address2" placeholder="상세주소" style="width:100%; height:40px;">
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
												document.getElementById(
														'sample6_address2')
														.focus();
											}
										}).open();
							}
						</script>

					<div class="form-group d-flex justify-content-around" style="text-align:center">
						<input type="radio" name="userGender" autocomplete="off" value="남자" checked> MAN
						<input type="radio" name="userGender" autocomplete="off" value="여자" checked> WOMAN
					</div>

					<div class="form-group">
						<input type="email" class="form-control" 
							   placeholder="Email" name="userEmail"
							   maxlength="20" style="height:40px;">
					</div>
						<input type="submit" 
						   class="btn btn-primary form-control" 
						   value="Connection" style="background-color:black; height:40px;">
				</form>
			</div>
		</div>
		
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