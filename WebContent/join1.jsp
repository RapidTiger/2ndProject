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

<script language="javascript">
		// opener���� ������ �߻��ϴ� ��� �Ʒ� �ּ��� �����ϰ�, ������� ������������ �Է��մϴ�. ("�˾�API ȣ�� �ҽ�"�� �����ϰ� ������Ѿ� �մϴ�.)
		//document.domain = "abc.go.kr";

		function add(){
			// ȣ��� ������(jusopopup.jsp)���� ���� �ּҰ˻�URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)�� ȣ���ϰ� �˴ϴ�.
		    var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		    
			// ����� ���� ���, ȣ��� ������(jusopopup.jsp)���� ���� �ּҰ˻�URL(https://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)�� ȣ���ϰ� �˴ϴ�.
		    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
		}
		/** API ���� �����׸� Ȯ�� (2017.02) **/
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
			// �˾����������� �ּ��Է��� ������ �޾Ƽ�, �� �������� ������ ����մϴ�.
			document.getElementById('roadAddrPart1').value = roadAddrPart1;
			document.getElementById('addrDetail').value = addrDetail;
		}
</script>
</head>
<body class="is-preload">

	<%
		request.setCharacterEncoding("EUC-KR");
		MemberDTO dto = (MemberDTO)session.getAttribute("dto");
	%>
		<!-- Sidebar -->
			<section id="sidebar">
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
					<a href="main.jsp" style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;border-bottom:none;margin-right:65px'><button>��������</button></a>
					
				</div>
			</section>

		<!-- Wrapper -->
			<div id="main">

				<!-- Intro -->
				<section id="intro" class="wrapper style1 fullscreen fade-up">
					<section id="one" class="one dark cover">
						<div class="container">
							<form action="JoinProgram">
								<header>
									
									<div style="width: 60%;valign: top;margin:0 auto;text-align: center;padding-left: 360px;">
										<h2 class="alt">ȸ������ <br></h2>
										<table>
											<tr>
												<td>ID :</td><td colspan=2><input type="text" name="id"></td>						
											</tr>
											<tr>
												<td>PW :</td><td colspan=2><input type="password" name="pw"></td>
											</tr>
											<tr>
												<td>�̸� :</td><td colspan=2><input type="text" name="name"></td>
											</tr>
											<tr>
												<td>�ּ� :</td><td colspan=2><input type="text" name="address" id="roadAddrPart1"></td>
											</tr>
											<tr>
												<td>���ּ� :</td><td><input type="text" name="detail" id="addrDetail" style="display: initial;width:68%;margin-right:25px"><a onclick='add()' class="button scrolly" style="height:58px">�ּҰ˻�</a></td>
											</tr>
											<tr>
												<td>�ν�ŸID :</td><td><input type="text" name="insta_id"></td>
											</tr>
										</table>
										<input type="submit" value="join" style="padding-left: 55px;padding-right: 55px;">
									</div>
					
								</header>

							</form>
						</div>
					</section>
				</section>
					
					


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