<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- jstl 사용을 위한 taglib -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 데이터를 불러올 클래스 객체 생성 -->
<jsp:useBean id="boardmanager" class="board.BoardManager" />

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">

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

.container{max-width:1170px; margin:auto;}
img{ max-width:100%;}
.inbox_people {
  background: #f8f8f8 none repeat scroll 0 0;
  float: left;
  overflow: hidden;
  width: 40%; border-right:1px solid #c4c4c4;
}
.inbox_msg {
  border: 1px solid #c4c4c4;
  clear: both;
  overflow: hidden;
}
.top_spac{ margin: 20px 0 0;}


.recent_heading {float: left; width:40%;}
.srch_bar {
  display: inline-block;
  text-align: right;
  width: 60%; padding:
}
.headind_srch{ padding:10px 29px 10px 20px; overflow:hidden; border-bottom:1px solid #c4c4c4;}

.recent_heading h4 {
  color: #05728f;
  font-size: 21px;
  margin: auto;
}
.srch_bar input{ border:1px solid #cdcdcd; border-width:0 0 1px 0; width:80%; padding:2px 0 4px 6px; background:none;}
.srch_bar .input-group-addon button {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  padding: 0;
  color: #707070;
  font-size: 18px;
}
.srch_bar .input-group-addon { margin: 0 0 0 -27px;}

.chat_ib h5{ font-size:15px; color:#464646; margin:0 0 8px 0;}
.chat_ib h5 span{ font-size:13px; float:right;}
.chat_ib p{ font-size:14px; color:#989898; margin:auto}
.chat_img {
  float: left;
  width: 11%;
}
.chat_ib {
  float: left;
  padding: 0 0 0 15px;
  width: 88%;
}

.chat_people{ overflow:hidden; clear:both;}
.chat_list {
  border-bottom: 1px solid #c4c4c4;
  margin: 0;
  padding: 18px 16px 10px;
}
.inbox_chat { height: 550px; overflow-y: scroll;}

.active_chat{ background:#ebebeb;}

.incoming_msg_img {
  display: inline-block;
  width: 6%;
}
.received_msg {
  display: inline-block;
  padding: 0 0 0 10px;
  vertical-align: top;
  width: 92%;
 }
 .received_withd_msg p {
  background: #ebebeb none repeat scroll 0 0;
  border-radius: 3px;
  color: #646464;
  font-size: 14px;
  margin: 0;
  padding: 5px 10px 5px 12px;
  width: 100%;
}
.time_date {
  color: #747474;
  display: block;
  font-size: 12px;
  margin: 8px 0 0;
}
.received_withd_msg { width: 57%;}
.mesgs {
  float: left;
  padding: 30px 15px 0 25px;
  width: 60%;
}

 .sent_msg p {
  background: #05728f none repeat scroll 0 0;
  border-radius: 3px;
  font-size: 14px;
  margin: 0; color:#fff;
  padding: 5px 10px 5px 12px;
  width:100%;
}
.outgoing_msg{ overflow:hidden; margin:26px 0 26px;}
.sent_msg {
  float: right;
  width: 46%;
}
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}

.type_msg {border-top: 1px solid #c4c4c4;position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}
.messaging { padding: 0 0 50px 0;}
.msg_history {
  height: 516px;
  overflow-y: auto;
}
	
</style>

<title>Insert title here</title>
<script type="text/javascript">
	//검색을 위한 스크립트
	window.onload = function() {
		document.getElementById("btnSearch").onclick = function() {
			if (frm.search_word.value == "") {
				frm.search_word.focus();
				alert("검색어를 입력하세요");
				return;
			}
			frm.submit();
		}
	}
</script>
</head>
<body>
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
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
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

<div class="container">
<h1 class=" text-center" style="color:red;">FAQ</h1><h1 class="text-center">자주하는 질문</h1>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Recent</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Search" >
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div>
          </div>
          <div class="inbox_chat">
            <div class="chat_list active_chat">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>01 주문/결제문의 <span class="chat_date">Dec 25</span></h5>
                  <p>- 카드결제시 할부가 가능한가요.<br>
					- 결제완료 후 결제수단을 변경할 수 있나요.<br>
					- 주문 후 상품이 품절되는건 왜그런건가요.</p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>02 배송문의 <span class="chat_date">Dec 25</span></h5>
                  <p>- 배송기간은 얼마나 걸리나요.<br>
                  - 배송완료라고 나오는데 상품을 수령하지 못했습니다.<br>
                  - 주문한 상품중에서 선배송을 받고 싶은경우 어떻게 해야하나요.<br>
                  - 묶음배송이 가능한가요.<br>
                  - 해외배송이 가능한가요.
                  </p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>03 취소문의 <span class="chat_date">Dec 25</span></h5>
                  <p>- 주문했는데 취소하고싶어요.<br>
                  - 주문한 상품중에서 부분취소하고싶어요.</p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>04 교환/반품문의<span class="chat_date">Dec 25</span></h5>
                  <p>- 고객센터 또는 Q&A게시판을 통해 상품수령 후 24시간 이내 교환/반품접수신청을 해주세요.<br>
                  - 교환/반품접수기간은 수령하신 날로부터 7일이내 입니다.<br>
                  - 7일이내에 교환/반품신청 및 도착이 안될시에는 처리에 제한을 받을 수 있습니다.</p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>05 기타문의 <span class="chat_date">Dec 25</span></h5>
                  <p>- 현금영수증 신청현금영수증의 경우 주문과 결제완료 이후 사업자로 발행하시는 경우<br>
                  - 적립금 및 예치금의 경우 현금이 아닌 전자화폐에 해당하는 결제방식으로 사용하신 후 </p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>submit <span class="chat_date">Dec 25</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                <div class="chat_ib">
                  <h5>submit <span class="chat_date">Dec 25</span></h5>
                  <p>Test, which is a new approach to have all solutions 
                    astrology under one roof.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history">
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test which is a new approach to have all
                    solutions</p>
                  <span class="time_date"> 11:01 AM    |    June 9</span></div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Test which is a new approach to have all
                  solutions</p>
                <span class="time_date"> 11:01 AM    |    June 9</span> </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>Test, which is a new approach to have</p>
                  <span class="time_date"> 11:01 AM    |    Yesterday</span></div>
              </div>
            </div>
            <div class="outgoing_msg">
              <div class="sent_msg">
                <p>Apollo University, Delhi, India Test</p>
                <span class="time_date"> 11:01 AM    |    Today</span> </div>
            </div>
            <div class="incoming_msg">
              <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
              <div class="received_msg">
                <div class="received_withd_msg">
                  <p>We work directly with our designers and suppliers,
                    and sell direct to you, which means quality, exclusive
                    products, at a price anyone can afford.</p>
                  <span class="time_date"> 11:01 AM    |    Today</span></div>
              </div>
            </div>
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" />
              <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>
	<div class="container">
	<h1 class="text-center" style="color:red;">Q&A</h1><br><br>
	
		<div class = "row">
		<!-- table-striped은 게시판의 목록들이 홀수와 짝수 번갈아가면서 색상이 변경되는 것임 -->
			<table class="table table-striped" style="text-align:center; border:1px solid white;">
				<thead style="border-bottom: 6px solid gray;">
				<!-- thead는테이블 의 맨 윗줄, 즉 제목같은거  -->
					<tr> <!--하나의 행 한줄 을 의미 -->
						<th style="background-color: white; text-align:center; width:5%;">No</th>
						<th style="background-color: white; text-align:center; width:10%;">Writer</th>
						<th style="background-color: white; text-align:center; width:70%;">Subject</th>
						<th style="background-color: white; text-align:center; width:15%;"><th>Date</th>
					</tr>
				</thead>
				
		
			<!-- 페이지값이 안넘어올경우 페이지의 default값 -->
			<c:set var="currentPage" value="${param.page}" />
			<c:if test="${empty param.page}">
				<c:set var="currentPage" value="1" />
			</c:if>

			<!-- 검색어 파라미터 -->
			<c:set var="searchType" value="${search_type}" />
			<c:set var="searchWord" value="${search_word}" />


			<!-- list 변수에 목록 데이터를 삽입 -->
			<c:set var="list"
				value="${boardmanager.getDataAll(currentPage,searchType,searchWord)}" />

			<!-- list 변수로부터 한줄한줄 출력 -->
			<c:forEach var="data" items="${list }">
				<tr>
					<td>${data.num}</td>
					<td>${data.bname}</td>
					<td>
						<!-- 들여쓰기 처리 --> 
						<c:if test="${empty data.nested|| data.nested ne 0}">
							<c:forEach begin="1" end="${data.nested}">&nbsp;</c:forEach>
							-
						</c:if> 
					<a href="content.jsp?num=${data.num}&page=${currentPage}">${data.title}</a>
					</td>
					<td>${data.write_date}</td>
					<td>${data.readcnt}</td>
				</tr>
			</c:forEach>

		<!-- 페이징 처리 -->
		<tr>
		<td colspan="6">
		<div class="container">
		<!-- 전체 데이터 개수 구하기 -->
		<c:set var='total' value="${boardmanager.getTot(searchType,searchWord)}"/>
 		<c:set var='pageSu' value="${boardmanager.getPageSu() }" /> 
 		<br>
 		<!-- 페이지 처리 출력 -->
		<c:set var='i' value='1'/>
		<c:forEach begin="1" end="${pageSu}">
			<c:if test="${i eq currentPage}">
				[<c:out value="${i}"/>]
			</c:if>
			<c:if test="${i ne currentPage}">
				<a href='boardlist.jsp?page=${i}&search_type=${searchType}&search_word=${searchWord}'>[<c:out value="${i}"/>]</a>
			</c:if>
			<c:set var='i' value='${i+1}'/>
			
		</c:forEach>
		<br>
		<br>
		<!-- 검색 칸 -->
		<form action="boardlist.jsp" name="frm" method="post">
			<select name="search_type">
				<option value="title" selected="selected">제 목</option>
				<option value="bname">작성자</option>
			</select> <input type="text" name="search_word" /> <input type="button"
				value="검색" id="btnSearch" />
		</form>
		
		<br>
		<div class="container" style="text-align: center;">
			[<a href="../index2.jsp">메인으로</a>]
			&nbsp; 
			[<a href="boardlist.jsp?page=1">최근목록</a>]
			&nbsp;
			[<a href="write_form.jsp">새글작성</a>]
			&nbsp; 
			[<a href="#" onclick="window.open('/SSS/admin/admin_index.jsp', '', 'width=300,height=150,top=200,left=300')">관리자용</a>]
			&nbsp;
		</div>
		</div>
		</td>
		
		</table>
		</div>
		</div>
		

	<hr>
	<br>
	<br>
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

