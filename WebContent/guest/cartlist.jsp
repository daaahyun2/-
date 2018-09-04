<%@page import="product.ProductDto"%>
<%@page import="order.OrderBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="cartmanager" class="order.CartManager" scope="session"/>
<jsp:useBean id="productmanager" class="product.ProductManager"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<script src="../js/script.js?ver=0.1"></script>
</head>
<body>

	<%@ include file="../guest/guest_top.jsp" %>
	<div class="container text-center">
	<h1><br>Cart<br><br></h1><br><hr><br>
	<form action="cartprocess.jsp" method="get">
		
	<div class="container">
		<table class="table table-hover" style="text-align: center;">
		
					<thead>
						<tr>
							<th>NAME</th>
							<th class="text-center">PRICE</th>
							<th class="text-center">QTY</th>
							<th class="text-center">MODIFY</th>
							<th class="text-center">READ</th>
							

						</tr>
					</thead>
					<tbody>
					
		<%
			int totalPrice = 0;
			Hashtable<String, OrderBean> hCart = cartmanager.getCartList();

			//장바구니가 비었을경우
			if(hCart.size()==0){
		%>
			<tr class="text-center"><td  colspan="5"><h4><br>주문 건 수가 없습니다.<br></h4></td></tr>
		<% 
			//장바구니에 내용이 있을경우

			} else { 

				//카트의 모든 제품코드(키값)을 추출
				Enumeration<String> enu = hCart.keys();
				while(enu.hasMoreElements()){ //남은 키 값이 있다면

					//해당 제품코드(키값)의 카트내용을 담음
					OrderBean order = (OrderBean)hCart.get(enu.nextElement());
						
					//해당 제품코드의 제품정보를 db에서 가져옴
					ProductDto product = productmanager.getProduct(order.getProduct_no());
						
					int price = Integer.parseInt(product.getPrice());
					int quantity = Integer.parseInt(order.getQuantity());
					int subTotal = price * quantity;
					totalPrice += subTotal;

		%>						
				<tr style="text-align: center;">
					<td><%=product.getPname() %></td>
					<td><%=subTotal %></td>
					<td>
						<input type="text" name="quantity" size="5" value="<%=order.getQuantity() %>" style="text-align: center;">
					</td>
					<td> 
						<!-- form 에서 가져갈 데이터 -->
						<input type="hidden" name="flag">
						<input type="hidden" name="product_no" value="<%=product.getPno() %>">
						<!-- 수정/삭제 버튼 -->
						<input type="button" value="수정" onclick="cartUpdate(this.form)" style="border:1px solid blue"> /
						<input type="button" value="삭제" onclick="cartDelete(this.form)" style="border:1px solid red"> 
					</td>
					<td><a href="javascript:productDetail('<%=product.getPno()%>')" style="color:gray;">상세보기</a></td>
				</tr>
		<%
				}
		%>
			<tr>
				<td colspan="5">
					<br/>
					<b>총 결제 금액 : <%=totalPrice %> 원</b>
					<br><br>
					<a href="orderprocess.jsp" style="color:red;"><b>[ 주문하기 ]</b></a>
				</td>
			</tr>
		<%	
			}
		%>
		</tbody>
		</table>
	</div>
	</form>
	</div>
	<%@ include file = "guest_bottom.jsp" %>
	<form action="productdetail_guest.jsp" name="detailFrm">
		<input type="hidden" name="pno">
	</form>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	
</body>
</html>
