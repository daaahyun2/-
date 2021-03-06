<%@page import="product.ProductDto"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="ordermanager" class="order.OrderManager" />
<jsp:useBean id="productmanager" class="product.ProductManager" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>주문관리</title>
<script src="../js/script.js?ver=0.1"></script>
<style>
#out {
 width: 100%;
 text-align: center;
 }
#in {
 display: inline-block;
 }
</style>
</head>
<body>

	<%@ include file="admin_top.jsp"%>
	<div class="container text-center">
	<h1><br>Order<br>Manager<br></h1><br><hr><br>
	<div class="container out">
		
	<div class="container in">
		<table class="table table-hover text-center">
					<thead style="color:red;">
						<tr>
							<th>No</th>
							<th class="text-center">ID</th>
							<th class="text-center">NAME</th>
							<th class="text-center">PRODUCT</th>
							<th class="text-center">QTY</th>
							<th class="text-center">DATE</th>
							<th class="text-center">STATE</th>
						</tr>
					</thead>
					<tbody>
	
		<%
			ArrayList<OrderBean> list = ordermanager.getOrderAll();
			if (list.size() <= 0) {
		%>
		<tr>
			<td class="text-center" colspan="7"><h3>주문 목록이 없습니다.</h3></td>
		</tr>
		<%
			} else {
				for (OrderBean bean : list) {
					ProductDto product = productmanager.getProduct(bean.getProduct_no());
		%>
		<tr>
			<td><%=bean.getOno()%></td>
			<td><%=bean.getId()%></td>
			<td><%=product.getPname()%></td>
			<td><%=bean.getQuantity()%></td>
			<td><%=bean.getSdate()%></td>
			<td>
				<%
					switch (Integer.parseInt(bean.getState())) {
							case 1:
								out.println("접수");
								break;
							case 2:
								out.println("입금확인");
								break;
							case 3:
								out.println("배송준비");
								break;
							case 4:
								out.println("배송중");
								break;
							case 5:
								out.println("처리완료");
								break;
							default:
								out.println("접수중");
								break;
							}
				%>
			</td>
			<td><a href="javascript:orderDetail(<%=bean.getOno()%>)" style="color:gray">상세보기</a></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	</div>
	</div>
	</div>
	<%@ include file="admin_bottom.jsp"%>
	<form action="order_detail.jsp" name="detailFrm" method="post">
		<input type="hidden" name="ono" />
	</form>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>
