<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">

<title>@SUBMIT</title>
<style type="text/css">

a, a:hover {
	color:black;
	text-decoration: none;
}
body {
    background-color:white;
}
.navbar{
 background-color:white;
}
	
</style>
</head>
	<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int pageNumber = 1;	//기본페이지 1페이지라는 것을 의미
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
						// parseInt 정수형으로바꿔주는 함수
	}
	%>
	<nav>
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
            <li><a href="productBest.jsp">BEST</a></li>
            <li class="divider"></li>
            <li><a href="#">OUTER</a></li>
            <li><a href="#">TOP</a></li>
            <li><a href="#">BOTTOM</a></li>
            <li><a href="#">DRESS</a></li>
            <li><a href="#">ETC</a></li>
          </ul>
        </li>
        <li class="active"><a href="notice.jsp" style="color:gray;">NOTICE <span class="sr-only">(current)</span></a></li>
        <li><a href="bbs.jsp" style="color:gray;">Q&A</a></li>
      </ul>
  
		<%
		 	if(userID == null){	//  로그인이 되어 있지 않다면
		%>
		 <ul class="nav navbar-nav navbar-right">
        <li><a href="http://instagram.com/daaahyun" style="color:gray;">INSTAGRAM</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" style="color:red;">Connection <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="login.jsp">LOGIN</a></li>
            <li><a href="join.jsp">JOIN</a></li>
       
          </ul>
        </li>
      </ul>
		
		<%
		 	}else {
		%>
		
		<ul class="nav navbar-nav navbar-right">
			<li class="dorpdown">
				<a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">MemberManagement<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="logoutAction.jsp">LOGOUT</a></li>
				</ul>
			</li>
		</ul>
		<%
		 	}
		%>
  </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
	<div class = "container">
	<h1 class="text-center" style="color:red;">NOTICE</h1>
	
	<br>
		<div class = "row">
		<!-- table-striped은 게시판의 목록들이 홀수와 짝수 번갈아가면서 색상이 변경되는 것임 -->
			<table class="table table-striped" style="text-align:center; border:1px solid white;">
				<thead style="border-bottom: 6px solid gray;"> <!-- thead는테이블 의 맨 윗줄, 즉 제목같은거  -->
					<tr> <!--하나의 행 한줄 을 의미 -->
						<th style="background-color: white; text-align:center; width:5%;">NO</th>
						<th style="background-color: white; text-align:center; width:70%;">SUBJECT</th>
						<th style="background-color: white; text-align:center; width:10%;">WRITE</th>
						<th style="background-color: white; text-align:center; width:15%;">DATE</th>
					</tr>
				</thead>
				<tbody>	<!-- 글쓸 때 예시를 보여주는거 -->
				<%
					BbsDAO bbsDAO = new BbsDAO(); 
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					// 현재 페이지에서 가져온 리스트 게시글 목록을 출력하려공,
					for(int i = 0; i<list.size(); i++) {
				%>	
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;")
								  																			.replaceAll("<", "&lt")
								  																			.replaceAll(">", "&gt")
								  																			.replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
					</tr>
				<% 
					}
				%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-success btn-arraw-left" style="background-color:black; border-style: none;">prev</a>
			<%	
				}if(bbsDAO.nextPage(pageNumber+1)){ //현재의 페이지가 아닌, 다음페이지가 존재하는지를 알아야 하니까 +1을 한거
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arraw-left" style="background-color:black; border-style: none;">next</a>
			<%		
				}
			%>
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