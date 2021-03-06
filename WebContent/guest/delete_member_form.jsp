<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="membermanager" class="member.MemberManager"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>

<%
	String id = (String)request.getParameter("id");
	String pass = (String)request.getParameter("pass");
	boolean deleteConfirm = membermanager.deleteConfirm(id, pass);
	if(deleteConfirm){
%>
		<script type="text/javascript">
			var confirmResult = confirm("정말 삭제하시겠습니까?");
			if(confirmResult == true){
				var deleteId = "<%=id%>";
				post_to_url("delete_member_action.jsp",{'id':deleteId});
			} else {
				history.back();
			}
		
		</script>
<%
	} else {
%>
		<script>
			alert("비밀번호가 틀립니다!");
			history.back();
		</script>	
<%
	}
%>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>	
</body>
</html>
