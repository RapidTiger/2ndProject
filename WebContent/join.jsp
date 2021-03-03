<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="EUC-KR">
<title>Insert title here</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script language="javascript">
		// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
		//document.domain = "abc.go.kr";

		function add(){
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		    var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		    
			// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		/** API 서비스 제공항목 확대 (2017.02) **/
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.getElementById('roadAddrPart1').value = roadAddrPart1;
			document.getElementById('addrDetail').value = addrDetail;
		}
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
		td{
			vertical-align: middle;
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
				<div class="inner">
					<div id="logo">
						
					</div>
					<nav>
						<ul>
							<li><a href="login.jsp" id="top-link"><span class="icon solid fa-home">Login</span></a></li>
						</ul>
						<ul>
							<li><a href="#one" id="top-link"><span class="icon solid fa-home">Join</span></a></li>
						</ul>
					</nav>										
					<a href="main.jsp" style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;border-bottom:none;margin-right:65px'><button>메인으로</button></a>
					
				</div>
			</section>

		<!-- Wrapper -->
			<div id="main">

				<!-- Intro -->
			<form action="JoinProgram">
				<section id="intro" class="wrapper style1 fullscreen fade-up">
						<section id="one" class="one dark cover inner" style="width: 2020px;padding-right: 90px;">
							<div class="container">
								<header>
									
									<div style="width: 70%;valign: top;margin:0 auto;text-align: center;padding-left: 360px;padding-top: 80px;">
										<h2 class="alt">회원가입 <br></h2>
										<table>
											<tr>
												<td>ID</td><td colspan=2><input type="text" name="id"></td>						
											</tr>
											<tr>
												<td>PW</td><td colspan=2><input type="password" name="pw"></td>
											</tr>
											<tr>
												<td>이름</td><td colspan=2><input type="text" name="name"></td>
											</tr>
											<tr>
												<td>주소</td><td colspan=2><input type="text" name="address" id="roadAddrPart1"></td>
											</tr>
											<tr>
												<td>상세</td><td><input type="text" name="detail" id="addrDetail" style="display: initial;width:72%;margin-right:25px"><a onclick='add()' class="button scrolly" style="height:58px">주소검색</a></td>
											</tr>
											<!-- 
											<tr>
												<td>인스타ID :</td><td><input type="text" name="insta_id"></td>
											</tr>
											 -->
										</table>
										<a href="#about" id="top-link" class="button scrolly" style="padding-left: 55px;padding-right: 55px;">Next</a>
									</div>
					
								</header>
							</div>
						</section>
					</section>
					<section id="one" class="wrapper style1 fullscreen fade-up"">
							<div id=about style="width: 70%;valign: top;margin:0 auto;padding-left: 360px;padding-top: 80px;height: 1730px;">
									<table border ="1px" width = "800">
										<tr height="40" algin = "center">
											<td colspan = 3>
												<h2>카페취향 체크리스트</h2>
											</td>
										</tr>
										
										<tr>
											<td rowspan =4 align = "center">
												카페 방문 목적										
											</td>
											<td>
												1. 조용하게 혼자 공부
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<tr>										
											<td>
												2. 친구들과 수다 위해서
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												3. 맛있는 커피와 달달한 디져트. 냠냠하려고
											</td>
											<td>
												<input type = "checkbox" name = "favor" value =3>
											</td>
										</tr>
										<tr>
											<td>
												4. 이쁜 인테리어와 디자인, 인스타 인증 위해서
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										
										<tr>
											<td rowspan =3 align = "center">
												평균 카페 이용 시간										
											</td>
											
											<td>
												1. 30분 미만
											</td>
											<td>
												<input type = "checkbox">
											</td>
										</tr>
										<tr>										
											<td>
												2. 1시간
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												3. 2시간 이상
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =2>
											</td>
										</tr>
										
										<tr>
											<td rowspan =4 align = "center">
												카페에 갈때 누구랑 동행하나요?										
											</td>
											<td>
												1. 혼자
											</td>
											<td>
												<input type = "checkbox" name = "with">
											</td>
										</tr>
										<tr>										
											<td>
												2. 친구들
											</td>
											<td>
												<input type = "checkbox" name = "with">
											</td>
										</tr>
										<tr>
											<td>
												3. 가족
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												4. 연인
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<!-- 
										<tr>
											<td rowspan =3 align = "center">
												자주 이용하는 카페와 나의 집(직장) 거리										
											</td>
											<td>
												<input type = "checkbox" value = "distance">
												1. 걸어서 5분 내외
											</td>
										</tr>
										<tr>										
											<td>
												<input type = "checkbox" value = "distance">
												2. 한 30분 정도?
											</td>
										</tr>
										<tr>
											<td>
												<input type = "checkbox" value = "convenience" value =1>
												3. 가까이에 없음 ㅠ(편의성)
											</td>
										</tr>
										 -->
										<tr>
											<td rowspan =8 align = "center">
												카페 방문 시 중요하게 여기는 점										
											</td>
											<td>
												1. 위생
											</td>
											<td>
												<input type = "checkbox" name = "favor" value =3>
											</td>
										</tr>
										<tr>										
											<td>
												2. 커피맛
											</td>
											<td>
												<input type = "checkbox" name = "favor" value =3>
											</td>
										</tr>
										<tr>
											<td>
												3. 독특한 디져트
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<tr>
											<td>
												4. 편안한 시설
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												5. 친절한 고객 서비스
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												6. 독특한 인테리어
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<tr>
											<td>
												7. 나만의 힐링
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<tr>
											<td>
												8. 매장의 음악
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
											<td colspan=3 style="text-align: center;">
												<input type="submit" value=Join>
											</td>
									</table>
							</div>
						</section>
					
				</form>
					
					


			</div>


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