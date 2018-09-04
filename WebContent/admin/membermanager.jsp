<%@page import="member.MemberDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="membermanager" class="member.MemberManager"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>관리자 - 회원관리</title>
<script src="../js/script.js?ver=0.2"></script>
</head>
<style>
#out {
 width: 100%;
 text-align: center;
 }
#in {
 display: inline-block;
 }
</style>
<body>
	<%@ include file="admin_top.jsp"%>
	<div class="container text-center">
	<h1><br>Member<br>Manager<br></h1><br><hr><br>
	<div class="container out">
		
	<div class="container in">
		<table class="table table-hover text-center">
					<thead style="color:red;">
						<tr>
							<th class="text-center">ID</th>
							<th class="text-center">NAME</th>
							<th class="text-center">EMAIL</th>
							<th class="text-center">PHONE</th>
							<th class="text-center">MODIFY</th>
							
						</tr>
					</thead>
					<tbody>
			
	<%
		ArrayList<MemberDto> list = membermanager.getMemberAll();
		for(MemberDto dto : list){
	%>
			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getWname() %></td>
				<td><%=dto.getMail() %></td>
				<td><%=dto.getPhone() %></td>
				<td><a href="javascript:admin_modify_member('<%=dto.getId() %>')" style="color:red">수정하기</a></td>
			</tr>
	<%
		}
	%>
	</table>	
	
	<%@ include file="admin_bottom.jsp" %>
	
	<form action="member_modify_admin_form.jsp" name="modifyFrm" method="post">
		<input type="hidden" name="id">
	</form>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>