<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="membermanager" class="member.MemberManager"/>
<jsp:useBean id="bean" class="member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<% boolean b = membermanager.insertData(bean); %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet"><title>Insert title here</title>

</head>
<body style="text-align: center; margin-top: 30px;">
	<%
		if(b) {
			//out.println("<b>회원 가입을 축하합니다.</b><br/><br/>");
			//out.println("<a href='../guest/guest_index.jsp'>로그인</a>");
			response.sendRedirect("../index2.jsp");
		} else {
			out.println("<b>회원 가입 실패! 관리자에게 문의</b><br/><br/>");
			out.println("<a href='../register_form.jsp'>가입 재시도</a>");
		}
	%>
	
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>	
</body>
</html>