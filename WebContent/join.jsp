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
					<a href="main.jsp" style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;border-bottom:none;margin-right:65px'><button>��������</button></a>
					
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
										<h2 class="alt">ȸ������ <br></h2>
										<table>
											<tr>
												<td>ID</td><td colspan=2><input type="text" name="id"></td>						
											</tr>
											<tr>
												<td>PW</td><td colspan=2><input type="password" name="pw"></td>
											</tr>
											<tr>
												<td>�̸�</td><td colspan=2><input type="text" name="name"></td>
											</tr>
											<tr>
												<td>�ּ�</td><td colspan=2><input type="text" name="address" id="roadAddrPart1"></td>
											</tr>
											<tr>
												<td>��</td><td><input type="text" name="detail" id="addrDetail" style="display: initial;width:72%;margin-right:25px"><a onclick='add()' class="button scrolly" style="height:58px">�ּҰ˻�</a></td>
											</tr>
											<!-- 
											<tr>
												<td>�ν�ŸID :</td><td><input type="text" name="insta_id"></td>
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
												<h2>ī������ üũ����Ʈ</h2>
											</td>
										</tr>
										
										<tr>
											<td rowspan =4 align = "center">
												ī�� �湮 ����										
											</td>
											<td>
												1. �����ϰ� ȥ�� ����
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<tr>										
											<td>
												2. ģ����� ���� ���ؼ�
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												3. ���ִ� Ŀ�ǿ� �޴��� ����Ʈ. �ȳ��Ϸ���
											</td>
											<td>
												<input type = "checkbox" name = "favor" value =3>
											</td>
										</tr>
										<tr>
											<td>
												4. �̻� ���׸���� ������, �ν�Ÿ ���� ���ؼ�
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										
										<tr>
											<td rowspan =3 align = "center">
												��� ī�� �̿� �ð�										
											</td>
											
											<td>
												1. 30�� �̸�
											</td>
											<td>
												<input type = "checkbox">
											</td>
										</tr>
										<tr>										
											<td>
												2. 1�ð�
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												3. 2�ð� �̻�
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =2>
											</td>
										</tr>
										
										<tr>
											<td rowspan =4 align = "center">
												ī�信 ���� ������ �����ϳ���?										
											</td>
											<td>
												1. ȥ��
											</td>
											<td>
												<input type = "checkbox" name = "with">
											</td>
										</tr>
										<tr>										
											<td>
												2. ģ����
											</td>
											<td>
												<input type = "checkbox" name = "with">
											</td>
										</tr>
										<tr>
											<td>
												3. ����
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												4. ����
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<!-- 
										<tr>
											<td rowspan =3 align = "center">
												���� �̿��ϴ� ī��� ���� ��(����) �Ÿ�										
											</td>
											<td>
												<input type = "checkbox" value = "distance">
												1. �ɾ 5�� ����
											</td>
										</tr>
										<tr>										
											<td>
												<input type = "checkbox" value = "distance">
												2. �� 30�� ����?
											</td>
										</tr>
										<tr>
											<td>
												<input type = "checkbox" value = "convenience" value =1>
												3. �����̿� ���� ��(���Ǽ�)
											</td>
										</tr>
										 -->
										<tr>
											<td rowspan =8 align = "center">
												ī�� �湮 �� �߿��ϰ� ����� ��										
											</td>
											<td>
												1. ����
											</td>
											<td>
												<input type = "checkbox" name = "favor" value =3>
											</td>
										</tr>
										<tr>										
											<td>
												2. Ŀ�Ǹ�
											</td>
											<td>
												<input type = "checkbox" name = "favor" value =3>
											</td>
										</tr>
										<tr>
											<td>
												3. ��Ư�� ����Ʈ
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<tr>
											<td>
												4. ����� �ü�
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												5. ģ���� �� ����
											</td>
											<td>
												<input type = "checkbox" name = "convenience" value =1>
											</td>
										</tr>
										<tr>
											<td>
												6. ��Ư�� ���׸���
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<tr>
											<td>
												7. ������ ����
											</td>
											<td>
												<input type = "checkbox" name = "mood" value =1>
											</td>
										</tr>
										<tr>
											<td>
												8. ������ ����
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