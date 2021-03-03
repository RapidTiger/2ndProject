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
		<link rel="stylesheet" href="assets/css/main2.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script type="text/javascript">
		var friend = [];
	
		
		function friendDelete(num){
			
			console.log(id.innerHTML)
			console.log(friend[num].friendId)
			
			$.ajax({
		        url:"friendDelet",
		        type:"GET",
		        data:{
		        	id:id.innerHTML,
					f_id:friend[num].friendId
		        },
		        success:function(res){
		        	console.log(res);
		        	if(res > 0){
		        		alert("삭제완료");
		        		reset();
		        	}
		        },
		        error:function(){
		            alert("error")
		        }
		        
		    })
		}
		function reset(){
			$.ajax({
		        url:"friendsearch",
		        type:"GET",
		        data:{
		        	id:id.innerHTML
		        },
		        success:function(res){
		        	tableArea.innerHTML = "<table id=table></table>";
		        	var table = document.getElementById("table");
		        	for(let i = 0; i < res.class.length; i++){
		        		friend[i] = res.class[i];
		        		table.innerHTML += "<tr id=tr"+i+" class=faid></tr>";
		        		var tr = document.getElementById("tr"+i);
		        		tr.innerHTML = "<td>"+res.class[i].friendName+"</td>"
		        		tr.innerHTML += "<td>"+res.class[i].friendAddress+"</td>"
		        		tr.innerHTML += "<td><button onclick=friendDelete("+i+")>삭제</button></td>"
		        	}
		        },
		        error:function(){
		            alert("error")
		        }
		        
		    })
		}
		</script>
		<style type="text/css">
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
					<span class="image avatar48"><img src="images/avatar.jpg" alt=""></span>
						<h3 id="title"><%if(dto!=null){%><h4 id=id style="margin-right: 500px"><%=dto.getId() %></h4>
						<%}
						else{%>로그인을 해주세요<%								
						}%></h3>
					<!-- <p>사용자email</p> -->
				</div>
				<div class="inner" style="min-height: auto;height:70%;">
					<nav>
						<ul id=ul>
							<li><a href="main.jsp"><span class="icon solid">Main</span></a></li>
							<%if(dto != null){ %>
								<li><a href="#intro"><span class="scrolly">Friends</span></a></li>
								<li><a href="sel_friend2.jsp"><span class="scrolly">Friends Search</span></a></li>
							<%} else { %>
							<%} %>
						</ul>
					</nav>
				</div>
			</section>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Intro -->
					<section id="intro" class="wrapper style1 fullscreen fade-up">
						<div class="inner">
							<table>
								<tr>
									<th>친구목록</th><td></td>
								</tr>
							</table>
							<div id=tableArea></div>
							</table>
						</div>
					</section>
					
					<section id="about" class="three">
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
			<script type="text/javascript">var id = document.getElementById("id");</script>
			<script type="text/javascript">
			$.ajax({
		        url:"friendsearch",
		        type:"GET",
		        data:{
		        	id:id.innerHTML
		        },
		        success:function(res){
		        	tableArea.innerHTML = "<table id=table></table>";
		        	var table = document.getElementById("table");
		        	for(let i = 0; i < res.class.length; i++){
		        		friend[i] = res.class[i];
		        		table.innerHTML += "<tr id=tr"+i+" class=faid></tr>";
		        		var tr = document.getElementById("tr"+i);
		        		tr.innerHTML = "<td>"+res.class[i].friendName+"</td>"
		        		tr.innerHTML += "<td>"+res.class[i].friendAddress+"</td>"
		        		tr.innerHTML += "<td><button onclick=friendDelete("+i+")>삭제</button></td>"
		        	}
		        },
		        error:function(){
		            alert("error")
		        }
		        
		    })
		    </script>
	</body>
</html>