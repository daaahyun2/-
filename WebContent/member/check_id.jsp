<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<jsp:useBean id="membermanager" class="member.MemberManager"/>
<% request.setCharacterEncoding("utf-8"); %>
<% String id = request.getParameter("id"); %>
<% boolean b = membermanager.checkId(id); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet"><title>id 중복 검사</title>
</head>
<body>
<b><%=id %></b>
<%
	if(b){
%>
		는(은) 이미  사용중인 id 입니다.<p/>
		<a href="#" onclick = "opener.document.regForm.id.focus(); window.close();">닫기</a>
		<!-- opener : window.open으로 현재 창을 호출한 부모 페이지 -->
<%
	} else {
%>
		는(은) 사용 가능 합니다.<p/>
		<a href="#" onclick = "opener.document.regForm.pass.focus(); window.close();">닫기</a>
<%	} %>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>	
</body>
</html>