<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>@SUBMIT</title>
<style>
#loading {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #fff;
	z-index: 99;
	text-align: center;
}

#loading-image {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}

#popDiv {
	position: absolute;
	display: none;
	border: 1px solid #808080;
}

#popDiv .close {
	position: absolute;
	bottom: 5px;
	right: 5px;
}

.hide-bullets {
	list-style: none;
	margin-left: -40px;
	margin-top: 20px;
}

.thumbnail {
	padding: 0;
}

.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 100%;
}

<!--이미지 슬라이드 음영제거 -->
.carousel-control {
	background-image: none;
}

.carousel-control.right {
	background-image: none;
}
</style>
</head>
<body>

	<!-- 로딩중 
	<script type="text/javascript">
		$(window).load(function() {
			$('#loading').hide();
		});
	</script>

	<div id="loading">
		<img id="loading-image" src="/JSP2/chap04/jongwon/loding.gif"
			alt="Loading..." />
	</div>
	<!-- 로딩중 -->

	<!-- 팝업창 띄우기 -->
	<script>
		jQuery(document).ready(function($) {
			pevent();
		});

		function pevent() {
			function getCookie(name) {
				var nameOfCookie = name + "=";
				var x = 0;
				while (x <= document.cookie.length) {
					var y = (x + nameOfCookie.length);
					if (document.cookie.substring(x, y) == nameOfCookie) {
						if ((endOfCookie = document.cookie.indexOf(";", y)) == -1) {
							endOfCookie = document.cookie.length;
						}
						return unescape(document.cookie.substring(y,
								endOfCookie));
					}
					x = document.cookie.indexOf(" ", x) + 1;
					if (x == 0)
						break;
				}
				return "";
			}
			if (getCookie("popname") != "done") {
				var popUrl = "popup.html";
				var popOption = "width=350%, height=218%, resizable=no, scrollbars=no, status=no;";
				window.open(popUrl, "", popOption);
			}
		}
	</script>
	<!-- 팝업창 띄우기 -->


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
				<li class="dropdown"><a href="#" class="active dropdown-toggle"
					data-toggle="dropdown" aria-expanded="false"
					style="font-size: 30px; color: blue;">SUBMIT <span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li class="active"><a href="index.jsp">MAIN</a></li>
						<li class="divider"></li>
						<li><a href="productAll.jsp">ALL</a></li>
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
				<li><a href="bbs.jsp" style="color: gray;">Q&A</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li><a href="http://instagram.com/daaahyun"
					style="color: gray;">INSTAGRAM</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"
					style="color: red;">Connection <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="login.jsp">LOGIN</a></li>
						<li><a href="join.jsp">JOIN</a></li>

					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->


	<br>
	<br>
	<div class="container"></div>
	<div class="container">
		<div id="main_area">
			<!-- Slider -->
			<div class="row">
				<div class="col-sm-6" id="slider-thumbs">
					<!-- Bottom switcher of slider -->
					<ul class="hide-bullets">
						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-0"><img
								src="/JSP2/chap04/jongwon/30.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-1"><img
								src="/JSP2/chap04/jongwon/31.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-2"><img
								src="/JSP2/chap04/jongwon/32.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-3"><img
								src="/JSP2/chap04/jongwon/33.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-4"><img
								src="/JSP2/chap04/jongwon/34.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-5"><img
								src="/JSP2/chap04/jongwon/30.jpeg"></a></li>
						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-6"><img
								src="/JSP2/chap04/jongwon/36.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-7"><img
								src="/JSP2/chap04/jongwon/39.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-8"><img
								src="/JSP2/chap04/jongwon/31.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-9"><img
								src="/JSP2/chap04/jongwon/32.jpeg"></a></li>
						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-10"><img
								src="/JSP2/chap04/jongwon/33.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-11"><img
								src="/JSP2/chap04/jongwon/34.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-12"><img
								src="/JSP2/chap04/jongwon/35.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-13"><img
								src="/JSP2/chap04/jongwon/36.jpeg"></a></li>
						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-14"><img
								src="/JSP2/chap04/jongwon/37.jpeg"></a></li>

						<li class="col-sm-3"><a class="thumbnail"
							id="carousel-selector-15"><img
								src="/JSP2/chap04/jongwon/38.jpeg"></a></li>
					</ul>
				</div>
				<div class="col-sm-6">
					<div class="col-xs-12" id="slider">
						<!-- Top part of the slider -->
						<div class="row">
							<div class="col-sm-12" id="carousel-bounding-box">
								<div class="carousel slide" id="myCarousel">
									<!-- Carousel items -->
									<div class="carousel-inner">
										<div class="active item" data-slide-number="0">
											<img src="/JSP2/chap04/jongwon/30.jpeg">
										</div>

										<div class="item" data-slide-number="1">
											<img src="/JSP2/chap04/jongwon/32.jpeg">
										</div>

										<div class="item" data-slide-number="2">
											<img src="/JSP2/chap04/jongwon/33.jpeg">
										</div>

										<div class="item" data-slide-number="3">
											<img src="/JSP2/chap04/jongwon/34.jpeg">
										</div>

										<div class="item" data-slide-number="4">
											<img src="/JSP2/chap04/jongwon/35.jpeg">
										</div>

										<div class="item" data-slide-number="5">
											<img src="/JSP2/chap04/jongwon/36.jpeg">
										</div>

										<div class="item" data-slide-number="6">
											<img src="/JSP2/chap04/jongwon/35.jpeg">
										</div>

										<div class="item" data-slide-number="7">
											<img src="/JSP2/chap04/jongwon/34.jpeg">
										</div>

										<div class="item" data-slide-number="8">
											<img src="/JSP2/chap04/jongwon/33.jpeg">
										</div>

										<div class="item" data-slide-number="9">
											<img src="/JSP2/chap04/jongwon/32.jpeg">
										</div>

										<div class="item" data-slide-number="10">
											<img src="/JSP2/chap04/jongwon/31.jpeg">
										</div>

										<div class="item" data-slide-number="11">
											<img src="/JSP2/chap04/jongwon/30.jpeg">
										</div>

										<div class="item" data-slide-number="12">
											<img src="/JSP2/chap04/jongwon/36.jpeg">
										</div>

										<div class="item" data-slide-number="13">
											<img src="/JSP2/chap04/jongwon/37.jpeg">
										</div>

										<div class="item" data-slide-number="14">
											<img src="/JSP2/chap04/jongwon/38.jpeg">
										</div>

										<div class="item" data-slide-number="15">
											<img src="/JSP2/chap04/jongwon/39.jpeg">
										</div>
									</div>
									<!-- Carousel nav -->
									<a class="left carousel-control" href="#myCarousel"
										role="button" data-slide="prev"> <span
										class="glyphicon glyphicon-chevron-left"></span>
									</a> <a class="right carousel-control" href="#myCarousel"
										role="button" data-slide="next"> <span
										class="glyphicon glyphicon-chevron-right"></span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/Slider-->
			</div>

		</div>
	</div>



	<br>
	<br>
	<hr>
	<br>
	<br>
	<footer class="text-center" style="color:gray;">Copyright
	&copy; 2018 김다현 All Rights Reserved. <br>
	-<br>
	+82 10 4630 2769</footer>




	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>



</body>
</html>