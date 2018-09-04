<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
		
<title>@SUBMIT</title>
<style>
.xans-product-recentlist table { table-layout:fixed; margin:0 0 1px; border:1px solid #d7d5d5; color:#353535; line-height:1.5; }
.xans-product-recentlist table th { padding:11px 0 9px; border-left:1px solid #e9e9e9; font-weight:normal; background:#fbfafa; }
.xans-product-recentlist table th:first-child { border-left:0; }
.xans-product-recentlist table td { padding:8px 0 5px; border-top:1px solid #e9e9e9; text-align:center; vertical-align:middle; }
.xans-product-recentlist table .image { width:100px; }
.xans-product-recentlist table .product { width:auto; }
.xans-product-recentlist table .option { width:200px; }
.xans-product-recentlist table .price { width:120px; }
.xans-product-recentlist table .button { width:70px; }
.xans-product-recentlist table .custom { display:block; color:#008bcc; }
.xans-product-recentlist table .inputWrap { display:block; margin:2px 0 0; padding:0 4px; border:1px solid #d5d5d5; }
.xans-product-recentlist table td.image img { max-width:78px; border:1px solid #d6d6d6; }
.xans-product-recentlist table td.product { padding-left:10px; text-align:left; }
.xans-product-recentlist table td.product a { color:#353535; }
.xans-product-recentlist table td.product img { vertical-align:middle; }
.xans-product-recentlist table td.product strong { display:block; color:#008bcc; }
.xans-product-recentlist table td.option { padding-left:10px; text-align:left; }
.xans-product-recentlist table td.option ul { padding:0 0 2px; }
.xans-product-recentlist table td.option ul li input { height:22px; border:0; line-height:22px; }
.xans-product-recentlist table td.option ul li select { width:100%; margin:2px 0; white-space:nowrap; }
.xans-product-recentlist table td.price { padding-right:10px; text-align:right; }
.xans-product-recentlist table td.button img { margin:1px 0; }
.xans-product-recentlist table td .xans-product-setproduct { margin:5px 0 0; }
.xans-product-recentlist table td .xans-product-setproduct li { margin:2px 0 0; color:#757575; }
.xans-product-recentlist .noData { margin:15px 0 0; font-weight:bold; color:#008bcc; line-height:100px; text-align:center; }

	body {
    background-color:white;
}
.navbar{
 background-color:white;
}

div.gallery {
	margin: 5px;
    border: 1px solid #ccc;
    float: left;
    border: 1px solid #ccc;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}

* {
    box-sizing: border-box;
}

.responsive {
    padding: 0 20px;
    float: left;
    width: 24.99999%;
}

@media only screen and (max-width: 700px) {
    .responsive {
        width: 49.99999%;
        margin: 6px 0;
    }
}

@media only screen and (max-width: 500px) {
    .responsive {
        width: 100%;
    }
}

.clearfix:after {
    content: "";
    display: table;
    clear: both;
}


</style>
</head>
	<body>
	<% 
		String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
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
            <li ><a href="productAll.jsp">ALL</a></li>
            <li><a href="#">-</a></li>
            <li class="active"><a href="productNew.jsp">NEW</a></li>
            <li><a href="#">BEST</a></li>
            <li class="divider"></li>
            <li><a href="#">OUTER</a></li>
            <li><a href="#">TOP</a></li>
            <li><a href="#">BOTTOM</a></li>
            <li><a href="#">DRESS</a></li>
            <li><a href="#">ETC</a></li>
          </ul>
        </li>
        <li ><a href="#" style="color:gray;">NOTICE <span class="sr-only">(current)</span></a></li>
        <li><a href="#" style="color:gray;">Q&A</a></li>
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

	    				<br><br>
	
	<div module="product_recentlist">
    <!--@css(/css/module/product/recentlist.css)-->
    <!--
        $count = 10
    -->
    <table border="1" summary="" class="{$list_display|display}">
        <caption>최근 본 상품 목록</caption>
        <thead>
            <tr>
                <th scope="col" class="image">이미지</th>
                <th scope="col" class="product">상품명</th>
                <th scope="col" class="option">옵션정보</th>
                <th scope="col" class="price">판매가</th>
                <th scope="col" class="button">주문</th>
            </tr>
        </thead>
        <tbody module="product_listitem">
            <tr>
                <td class="image"><a href="/product/detail.html{$param}"><img src="{$image_medium}" alt="" /></a></td>
                <td class="product">
                    <a href="/product/detail.html{$param}">{$product_name}</a>
                    {$soldout_icon} {$recommend_icon} {$new_icon} {$product_icons} {$zoom_icon}
                    <!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
                    <ul module="product_setproduct">
                        <li>{$product_name}</li>
                        <li>{$product_name}</li>
                    </ul><!-- //참고 -->
                </td>
                <td class="option">
                    <ul module="product_mainoption">
                        <li>{$option_name}: <br />{$form.option}</li>
                        <li>{$option_name}: <br />{$form.option}</li>
                    </ul>
                    <ul module="product_addoption">
                        <li>{$add_option_name}: <span class="inputWrap">{$form.add_option}</span></li>
                        <li>{$add_option_name}: <span class="inputWrap">{$form.add_option}</span></li>
                    </ul>
                </td>
                <td class="price">{$product_custom}<strong class="custom">{$price}</strong></td>
                <td class="button">
                    <a href="#none" onclick="{$act_basket}" class="{$disp_basket|display}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_wish1.gif" alt="담기" /></a>
                    <a href="#none" onclick="{$act_order}" class="{$disp_order|display}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_wish2.gif" alt="주문" /></a>
                    <a href="#none" class="{$class_del}" rel="{$rel_del}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_wish3.gif" alt="삭제" /></a>
                </td>
            </tr>
            <tr>
                <td class="image"><a href="/product/detail.html{$param}"><img src="{$image_medium}" alt="" /></a></td>
                <td class="product">
                    <a href="/product/detail.html{$param}">{$product_name}</a>
                    {$soldout_icon} {$recommend_icon} {$new_icon} {$product_icons} {$zoom_icon}
                    <!-- 참고 : 뉴상품관리 전용 모듈입니다. 뉴상품관리 이외의 곳에서 사용하면 정상동작하지 않습니다. -->
                    <ul module="product_setproduct">
                        <li>{$product_name}</li>
                        <li>{$product_name}</li>
                    </ul><!-- //참고 -->
                </td>
                <td class="option">
                    <ul module="product_mainoption">
                        <li>{$option_name}: <br />{$form.option}</li>
                        <li>{$option_name}: <br />{$form.option}</li>
                    </ul>
                    <ul module="product_addoption">
                        <li>{$add_option_name}: <span class="inputWrap">{$form.add_option}</span></li>
                        <li>{$add_option_name}: <span class="inputWrap">{$form.add_option}</span></li>
                    </ul>
                </td>
                <td class="price">{$product_custom}<strong class="custom">{$price}</strong></td>
                <td class="button">
                    <a href="#none" onclick="{$act_basket}" class="{$disp_basket|display}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_wish1.gif" alt="담기" /></a>
                    <a href="#none" onclick="{$act_order}" class="{$disp_order|display}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_wish2.gif" alt="주문" /></a>
                    <a href="#none" class="{$class_del}" rel="{$rel_del}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_wish3.gif" alt="삭제" /></a>
                </td>
            </tr>
        </tbody>
    </table>
    <p class="noData {$empty_display|display}">최근본 상품 내역이 없습니다.</p>
</div>
	
	<div module="product_recentlistpaging">
    <!--@css(/css/module/product/recentlistpaging.css)-->
    <p class="first"><a href="{$param_first}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_page_first.gif" alt="첫 페이지" /></a> </p>
    <p><a href="{$param_before}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_page_prev.gif" alt="이전 페이지" /></a></p>
    <ol>
        <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
        <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
        <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
        <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
        <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
    </ol>
    <p><a href="{$param_next}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_page_next.gif" alt="다음 페이지" /></a> </p>
    <p class="last"><a href="{$param_last}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_page_last.gif" alt="마지막 페이지" /></a></p>
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