<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>

<style>
html, body
{
    height: 100%;
}

body
{
    display: table;
    margin: 0 auto;
}

.container
{
border-radius: 50%; height: 500px; width: 500px;
    display: table-cell;
    vertical-align: middle;
}

.main
{
    height: auto;
    width: auto;
    background-color: none;      
}
</style>


<script type="text/javascript">
	function check() {
		//비밀번호 입력칸이 비었는지 확인
		if (frm.pass.value == "") {
			alert("비밀번호를 입력하세요");
			frm.pass.focus();
			return;
		}
		//confirm 알림창에서 "확인" 을 하면 삭제 실행
		if (confirm("해당 게시글을 삭제하시겠습니까?")) {
			frm.submit();
		}
	}
</script>

</head>
<body>
<div class="container">
	<h1 class="text-center">[ DELETE ]</h1>
	<h1 class="text-center">!</h1>
	
    <div class="main text-center">
    <c:redirect url="content.jsp?num=${param.num}&page=${param.page}"/>
	<form action="delete_action.jsp" method="post" name="frm">
		<input type="hidden" name="num" value="${param.num }" /> 
		<input type="hidden" name="page" value="${param.page }" /> 
		<input class="form-control text-center" type="password" name="pass" placeholder="PASSWORD" style=" position:center;"/>
		<p />
		<input type="button" onclick="check()" value="DELETE" /> <br>
		<input type="button" value="LIST" onclick="location.href='boardlist.jsp?page=${param.page}'" />
	</form>
    </div>
</div>

	
	
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>
