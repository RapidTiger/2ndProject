<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<script>
var ul = document.getElementById("ul");
ul.innerHTML += '<li><a href="#intro"><span class="icon solid fa-home">Main</span></a></li>';
</script>
<meta charset="EUC-KR">
<title>Insert title here</title>
		<title>Hyperspace by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/main2.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<style type = "text/css">
		@font-face {
		font-family:"G마켓 산스 TTF Medium";
		src:url("C:/Windows/Fonts")format("truetype");
		font-style:normal;
		font-weight:normal;
		}
		body{
		font-family:휴먼편지체 보통;
		}
		div
		</style>
		
</head>
<body>
<div id=finally10 style="z-index: 100;position: fixed;">asdfasf
    <div id=finally10 style="width: 2000px;background-color: red">aasdasdasdasdasdasdsadasdsdasdasdasdaskjdnasjkdnasjfnlasjnflasknlassdfasdafsd</div>
    <div id=finally10>asdfasdfasdf</div>
    <div id=finally10>asdfasdasdf</div>
    <div id=finally10>asdfasdfasdf</div>
    <div id=finally10>sadfasdfasdf</div>
    <div id=finally10>asdfasdfasdf</div>
    <div id=finally10>asdfasdfsadf</div>
    <div id=finally10>asdfasdfasd</div>
</div>
	<%
		request.setCharacterEncoding("EUC-KR");
		MemberDTO dto = (MemberDTO)session.getAttribute("dto");
	%>
		<!-- Sidebar -->
			<section id="sidebar">
				<div class="inner" id="logo" style='clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;height:30%;min-height: auto'>
					<span class="image avatar48"><img src="images/avatar.jpg" alt=""></span>
						<h3 id="title"><%if(dto!=null){%>
						<%=dto.getName() %>님<%}
						else{%>로그인을 해주세요<%								
						}%></h3>
					<!-- <p>사용자email</p> -->
				</div>
				<div class="inner" style="min-height: auto;height:70%;">
					<nav>
						<ul id=ul>
							<li><a href="#intro"><span class="icon solid fa-home">Main</span></a></li>
							<li><a href="#about"><span class="icon solid fa-user">About Mac</span></a></li>
							<%if(dto != null){ %>
								<li><a href="Logout"><span class="scrolly">Logout</span></a></li>
								<li><a href="sel_friend.jsp"><span class="scrolly">Friends</span></a></li>
							<%} else { %>
							<%} %>
						</ul>
					</nav>
				</div>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
					<section id="intro" class="wrapper style1 fullscreen fade-up" style="background-image: url('images/main.gif');background-size:1557px 1091px">
						<div class="inner">
							<header>
								<h2 class="alt">이제 친구들과 어디에서 만날지 그만 고민해 <br />
								<strong>service이름</strong>은 너가 친구들과 <br/>
								어디서 만날지 결정해줄거야</h2>
								<p>service 부연설명1~<br />
								부연설명2</p>
							</header>
								<a href="#about" class="button scrolly">사용법</a>
								
								<%if(dto != null){ %>
									<a href="sel_active.jsp" class="button scrolly">Start</a>
									<%} else { %>
									<a href="login.jsp" class="button scrolly">Login</a>
								<%} %>
						</div>
					</section>
					
					<section id="about" class="wrapper style2 spotlights">
						<div class="container">

							<header>
								<h2>About Me</h2>
							</header>

							<a href="#" class="image featured"><img src="images/pic08.jpg" alt="" /></a>

							<p>Tincidunt eu elit diam magnis pretium accumsan etiam id urna. Ridiculus
							ultricies curae quis et rhoncus velit. Lobortis elementum aliquet nec vitae
							laoreet eget cubilia quam non etiam odio tincidunt montes. Elementum sem
							parturient nulla quam placerat viverra mauris non cum elit tempus ullamcorper
							dolor. Libero rutrum ut lacinia donec curae mus vel quisque sociis nec
							ornare iaculis.</p>

						</div>
					</section>


			</div>

		<!-- Footer -->
			<footer id="footer" class="wrapper style1 fullscreen fade-up">
				<div class="inner">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
	</body>
</html>