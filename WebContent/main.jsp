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
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f38cfa7bd7813a236bed2fb02daeb55&libraries=services"></script>
		<style>
			.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
		    .wrap * {padding: 0;margin: 0;}
		    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
		    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
		    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;color:rgb(32, 32, 32)}
		    .info .close {position: absolute;top: 3px;right: 8px;color:#888 ;font-size: 15px;display: flex;align-items: center}
		    .info .close:hover {cursor: pointer;filter: brightness(30%);}
		    .info .body {position: relative;overflow: hidden;}
		    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
		    .desc .ellipsis {white-space:normal; color:rgb(32, 32, 32)}
		    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px; padding:5px}
		    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
		    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		    .info .link {color: #5085BB;}
		    
		    body{ -ms-overflow-style: none;} ::-webkit-scrollbar { display: none;}

		</style>
</head>
<body class="is-preload">

	<%
		request.setCharacterEncoding("EUC-KR");
		MemberDTO dto = (MemberDTO)session.getAttribute("dto");
	%>
		<!-- Sidebar -->
			<div id="plan" style="position: absolute;z-index: 100;"></div>
			<section id="sidebar">
			<div id="plan" style="position: absolute;z-index: 100;"><img src="images/mainlogo.png" style="width: 150px"></div>
				<div class="inner" id="logo" style='clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;height:30%;min-height: auto'>
					<span class="image avatar48"><img src="images/avatar.jpg" alt=""></span>
						<h3 id="title" style="width: 300px;"><%if(dto!=null){%>
						<p align="right" style="width: 300px;"><a onclick='plan()' style="border-bottom:none"><img src="images/bell.png" width="30px" height="40px" style="margin-top: 110px;"></a></p><br>
						<p><%=dto.getName() %>님 안녕하세요</p>
						<br><h4 id=id style="margin-right: 500px"><%=dto.getId() %></h4><br>
						<%}else{%><br><p  align="right" style="margin-top: 80px">로그인을 해주세요</p><%
						}%></h3>
					<!-- <p>사용자email</p> -->
				</div>
				<div class="inner" style="min-height: auto;height:70%;">
					<nav>
						<ul id=ul>
							<li><a href="#intro"><span class="icon solid">Main</span></a></li>
							<li><a href="#about"><span class="icon solid">About Mac</span></a></li>
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
								<h2 class="alt">더 이상 친구들과 어디에서 만날지 고민하지 마세요<br>
								<strong>MAC</strong>이 취향에 맞춰서 결정해 드릴게요<br></h2>
								<p>#취향 #중간 #맛집 #친구 #핫플</p>
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
			<script type="text/javascript">
			var user_id = [];
			var date = [];
			var time = [];
			var store = [];
			var add = [];
			var lat = [];
			var lng = [];
			function plan(){
				var plan = document.getElementById("plan");
				var id = document.getElementById("id");
				$.ajax({
			        url:"planselect",
			        type:"POST",
			        data:{
			        	id:id.innerHTML
			        },
			        success:function(res){
			        	console.log(res);
			        	for(let i = 0; i < res.length; i++){
			        		date[i] = res[i].date;
			    			time[i] = res[i].time;
			    			user_id[i] = res[i].id;
			    			store[i] = res[i].name;
			    			add[i] = res[i].add;
			    			lat[i] = res[i].lat;
			    			lng[i] = res[i].lng;
			        	}
			        		console.log(user_id);
			        	plan.innerHTML ="<table id=plans class=planin style='margin: 0px;background-color:#312450;font-size:20px;border-radius: 0px 0px 20px 0px;font-size: 15px !important;z-index: 110;'></table>";
			        	var table = document.getElementById("plans");
			        	table.innerHTML = "<tr align=center><td width=245>NAME</td><td width=110>DATE</td><td width=68>TIME</td><td width=147></td><td align=right width=147><a onclick='out()'>close</a></td></tr>"
			        	for(let i = 0; i < store.length; i++){
				        	table.innerHTML += "<tr id=tr"+i+"></tr>";
				        	var tr = document.getElementById("tr"+i);
					        tr.innerHTML += "<td>"+ store[i] +"</td>";
					        tr.innerHTML += "<td>"+ date[i] +"</td>";
					        tr.innerHTML += "<td>"+ time[i] +"</td>";
					        tr.innerHTML += "<td><button onclick='detail(" + i + ")'>detail</button></td>";
					        tr.innerHTML += "<td><button onclick='deleteplan(" + i + ")'>delete</button></td>";
			        	}
				        plan.innerHTML += '<div id=mapinfo class=planin></div>';
			        },
			        error:function(){
			            alert("error")
			        }
			        
			    })
			}
			function out(){
				document.getElementById("plans").className="planout";
				document.getElementById("mapinfo").className="planout";
			}
			function detail(num){
				var mapinfo = document.getElementById("mapinfo");
				mapinfo.innerHTML = '<div class=mapinfo style="width:717px;height:420px;background-color:#312450;z-index: 105;border-radius: 0px 0px 20px 0px"><div id="map" style="margin-left: 18px;width:676.5px;height:400px;"></div></div>';
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				mapOption = { 
				    center: new kakao.maps.LatLng(lat[num], lng[num]), // 지도의 중심좌표
				    level: 3 // 지도의 확대 레벨
				};

				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", // 마커이미지의 주소입니다    
		        imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다			  
		        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		    	 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
		        var markerPosition  = new kakao.maps.LatLng(lat[num], lng[num]);
		        var marker = new kakao.maps.Marker({
		            position: markerPosition,
		            image : markerImage 
		        });
				var content = '<div class="wrap">' + 
			    '    <div class="info">' + 
			    '        <p class="title" style="font-size=15px">' + 
			                 store[num] +  
			    '        </p>' + 
			    '        <div class="body">' + 
			    '            <div class="img">' +
			    '                <img src="images/logo.png" width="73" height="70">' +
			    '           </div>' + 
			    '            <div class="desc">' + 
			    '                <div class="ellipsis"><b style="color:black">'+add[num]+'</b></div>' + 			  
			    '            </div>' + 
			    '        </div>' + 
			    '    </div>' +    
			    '</div>';
				var overlay = new kakao.maps.CustomOverlay({
				content: content,
				position: marker.getPosition()       
				});
				overlay.setMap(map);
				marker.setMap(map);
			}
			
			/* function deleteplan(num){
				$.ajax({
			        url:"plandelete",
			        type:"POST",
			        success:function(res){
			        	console.log(res);
			} */
		</script>
	</body>
</html>