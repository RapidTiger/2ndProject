<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
		<title>Hyperspace by HTML5 UP</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/main2.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function(){
		    $('a[href^="#"]').on('click',function (e) {
		        e.preventDefault();

		        var target = this.hash;
		        var $target = $(target);

		        $('html, body').stop().animate({
		            'scrollTop': $target.offset().top
		        }, 900, 'swing', function () {
		            window.location.hash = target;
		        });
		    });
		});
		</script>
		<style type="text/css">
			input[type="checkbox"] {
			    background-color: initial;
			    cursor: default;
			    appearance: checkbox;
			    box-sizing: border-box;
			    margin: 3px 3px 3px 4px;
			    padding: initial;
			    border: initial;
			    opacity:1;
			    float:none;
			    display:inline;
			}
			.ctg{
				font-size: 10px
			}
			.submit{
				width: 254;
			}
			body{ -ms-overflow-style: none;} ::-webkit-scrollbar { display: none;}
			
		</style>
</head>
<body class="is-preload">

	<%
		request.setCharacterEncoding("EUC-KR");
		MemberDTO dto = (MemberDTO)session.getAttribute("dto");
	%>
		<!-- Sidebar -->
			<section id="sidebar">
				<div id="plan" style="position: absolute;z-index: 100;"><img src="images/mainlogo.png" style="width: 150px"></div>
				<div class="inner" id="logo" style='clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;height:30%;min-height: auto'>
					<span class="image avatar48"><img src="images/avatar.jpg" alt="" /></span>
					<!-- <p>�����email</p> -->
				</div>
				<div class="inner" style="min-height: auto;height:70%;">
						<nav id="nav">
							<ul>
								<li><a href="#main" id="one-link"><span class="icon solid">Main</span></a></li>
								<li><a href="#one" id="one-link"><span class="icon solid">Food</span></a></li>
								<li><a href="#two" id="one-link"><span class="icon solid">Cafe</span></a></li>
								<li><a href="#three" id="about-link"><span class="icon solid">Entertain</span></a></li>
							</ul>
							
						</nav>
				</div>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
					<section id="main" class="wrapper style1 fullscreen fade-up" style="background-image: url('images/ckmain.gif');background-size:1557px 1091px">
						<div class="container inner" style="padding:0px;">
							<div style="width: 47%; valign: top ;margin:0 auto;text-align: center;">
								<h2 style="margin-bottom: 55px;">���� ��Ҹ� �����ϼ���</h2>	
								<br>
								<form action="map.jsp" method="post"> 
									<table style="border-collapse: inherit; width: 500px;">
										<tr>
											<td>
												<input name="ctg" type="submit" value="food" style="padding: 0px 76px 0px 76px;"><br><a class=ctg href=#one>�󼼼���</a>
											</td>
											<td>
												<input name="ctg" type="submit" value="cafe" style="padding: 0px 76px 0px 76px;"><br><a class=ctg href=#two>�󼼼���</a>
											</td>
											<td>
												<input name="ctg" type="submit" value="entertain"><br><a class=ctg href=#three>�󼼼���</a>
											</td>
										</tr>
									</table>
								</form>
							</div>
						</div>
					</section>
					<section id="one" class="wrapper style1 fullscreen fade-up" style="background-image: url('images/food.gif');background-size:1557px 1091px">
						<div class="container faid">
							<div style="width: 100%; valign: top ;margin:0 auto;text-align: center;">
								<h2 style="margin-bottom: 55px;">��ȣ�ϴ� �Ĵ��� �����ϼ���</h2>
								<br>
								<form action="map.jsp" method="post">
									<table style="border-collapse: inherit;width: 450px; margin-left: 540px	">
										<tr>
											<td>
												�ѽ�<input type="checkbox" name="ctg" value="korea" >
											</td>
											<td>								
												���<input type="checkbox" name="ctg" value="us" >
											</td>
											<td colspan=2>								
												�н�ƮǪ��<input type="checkbox" name="ctg" value="fast"><br>
											</td>
										<tr>			
											<td>					
												�Ͻ�<input type="checkbox" name="ctg" value="japan">
											</td>
											<td>
												�߽�<input type="checkbox" name="ctg" value="china">									
											</td>
											<td>
												�н�<input type="checkbox" name="ctg" value="bunsik">									
											</td>
											<td>
												����<input type="checkbox" name="ctg" value="beer">
											</td>
										</tr>
										<tr>
											<td colspan=4>
												<input type="submit" value="����">
											</td>							
									</table>
								</form>
							</div>
						</div>
					</section>
					<section id="two" class="wrapper style1 fullscreen fade-up" style="background-image: url('images/cafe.gif');background-size:1557px 1091px">
						<div class="container">
							<div style="width: 100%; valign: top ;margin:0 auto;text-align: center;">
								<h2 style="margin-bottom: 55px;">��ȣ�ϴ� ī�並 �����ϼ���</h2>
								<br>
								<form action="map.jsp"  method="post">
									������<input type="checkbox" name="ctg" value="mood" >
									��<input type="checkbox" name="ctg" value="favor" >				
									���Ǽ�<input type="checkbox" name="ctg" value="convenience" >	
									<br><br>
									<input type="submit" value="����">
								</form>
							</div>
						</div>
					</section>			
					<section id="three" class="wrapper style1 fullscreen fade-up" style="background-image: url('images/entertain.gif');background-size:1557px 1091px">
						<div class="container">
							<div style="width: 100%; valign: top ;margin:0 auto;text-align: center;">
								<h2 style="margin-bottom: 55px;">��ȣ�ϴ� �����ü��� �����ϼ���</h2>
								<br>
								<form action="map.jsp"  method="post">
									<table style="border-collapse: inherit;width: 800px; margin-left: 350px	">
										<tr>
											<td>
												�뷡��<input type="checkbox" name="ctg" value="sing" >
											</td>
											<td>
												�籸��<input type="checkbox" name="ctg" value="dg" >				
											</td>
											<td>
												��ȭ��/��ī��<input type="checkbox" name="ctg" value="book" >							
											</td>
											<td>
												������<input type="checkbox" name="ctg" value="bowling" ><br>
											</td>
										</tr>
										<tr>
											<td>
												PC��<input type="checkbox" name="ctg" value="pc" >
											</td>
											<td>
												����������<input type="checkbox" name="ctg" value="screen" >
											</td>
											<td>
												��ũ��������<input type="checkbox" name="ctg" value="golf" >
											</td>
											<td>
												��ȭ��&DVD��<input type="checkbox" name="ctg" value="movie" >								
											</td>
										</tr>
										<tr>
											<td colspan=4>
												<input type="submit" value="����">
											</td>
										</tr>
									</table>
									<br>									
								</form>
							</div>
						</div>
					</section>

					<section id="four" class="wrapper style1 fullscreen fade-up">
						<div class="container">
							<h2>��û���� �� ����</h2>
							<form style="width: 50%; valign: top ;margin:0 auto;text-align: center; action = "" method = "post">
								<div class="field half first">
										<label for="ID">ID</label>
										<input type="text" name = "send" id="name" placeholder="������ ��� ID" />
									</div>
									<!-- <div class="field half">
										<label for="email">Email</label>
										<input type="text" name = "receive" id="email" placeholder="�޴� ��� �̸���"/>
									</div> -->

									<div style="margin-bottom: 55px;" class="field">
										<label for="message">Message</label>
										<textarea name = "message" id="message" rows="6"></textarea>
									</div>
									<div class="actions">
										<input type="submit" value="Send Message" class="special" />
										<input type="reset" value="Clear" />
									</div>
								</form>

						<!-- 	<footer>
								<a href="select_favorite.html" class="button scrolly">login</a>
								<a href="join.html" class="button scrolly">join</a>
							</footer> -->
							

						</div>
					</section>


			</div>\

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