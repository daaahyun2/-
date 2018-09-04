<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<title>@SUBMIT</title>
<style>

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
 

<!-- include top page -->
	<%@ include file="guest_top.jsp" %>

		<!-- top page에서 memberid를 가져옴 -->
		<% if(memberid != null) { %>
		<p class="text-center">Welcome <%=memberid %>. </p>
		
	<br>
	<br>
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
				
		<% } else { %>
		<p class="text-center">Login Please.>>>>>>>>>>>> </p>
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
			
		<% } %>
	
	</div>

<!-- include bottom page -->
	<%@ include file="guest_bottom.jsp" %>

<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>	

</body>

</html>

