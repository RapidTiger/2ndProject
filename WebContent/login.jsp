<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
		<title>Hyperspace by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body class="is-preload">

	<%
		request.setCharacterEncoding("EUC-KR");
		MemberDTO dto = (MemberDTO)session.getAttribute("dto");
	%>
		<!-- Sidebar -->
			<section id="sidebar">
			<div id="plan" style="position: absolute;z-index: 100;"><img src="images/mainlogo.png" style="width: 150px"></div>
				<div class="inner">
					<div id="logo">
						
					</div>
					<nav>
						<ul>
							<li><a href="#one" id="top-link"><span class="icon solid fa-home">Login</span></a></li>
							<li><a href="join.jsp" id="top-link"><span class="icon solid fa-home">Join</span></a></li>
						</ul>
					</nav>
					
					<a href="main.jsp" style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;border-bottom:none;margin-right:65px'><button>메인으로</button></a>
					
				</div>
			</section>

		<!-- Wrapper -->

				<!-- Intro -->
				<section id="intro" class="wrapper style1 fullscreen fade-up">
					<section id="one" class="one dark cover inner">
						<div class="container">
							<header>
								<div style="width: 60%;valign: top;margin:0 auto;text-align: center;padding-left: 360px;">
									<form action="LoginProgram">
										<h2>로그인<br></h2>
											<table>
												<tr>
													<td>ID :</td><td><input type="text" name="id"></td>
												</tr>	
												<tr>								
													<td>PW :</td><td><input type="password" name="pw"></td>
												</tr>
											</table>
										<input type="submit" value="login">
										<a href="join.jsp" class="button scrolly" style="padding-left: 55px;padding-right: 55px;">join</a>
									</form>
								</div>
							</header>
						</div>
					</section>
				</section>

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