<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	
    <meta charset="utf-8">
    <title>���� �����ϱ�</title>
    <meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/main2.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
		<style>
			section#sidebar{
				padding: 20px;
			}
			button{
			    margin: 3px;
			}
			.label {margin-bottom: 100px;}
	        .label * {display: inline-block;vertical-align: top;}
	        .label .left {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_l.png") no-repeat;display: inline-block;height: 24px;overflow: hidden;vertical-align: top;width: 7px;}
	        .label .center {background: url(https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_bg.png) repeat-x;display: inline-block;height: 24px;font-size: 12px;line-height: 22px;color:rgb(32, 32, 32)}
	        .label .right {background: url("https://t1.daumcdn.net/localimg/localimages/07/2011/map/storeview/tip_r.png") -1px 0  no-repeat;display: inline-block;height: 24px;overflow: hidden;width: 6px;}
	        
	        .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '����', sans-serif;line-height: 1.5;}
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
		    a:hover img{filter: brightness(120%)}
		    
		    #sidebar nav a.name:before, #sidebar nav a.name:after {
			    border-radius: 0.2em;
			    bottom: 0;
			    content: '';
			    height: 0em;
			    position: absolute;
			    right: 0;
			    width: 100%;
			}
			.hide{
				position: fixed;
			}
		</style>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f38cfa7bd7813a236bed2fb02daeb55&libraries=services"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		
</head>
<body>
<%
request.setCharacterEncoding("EUC-KR");
MemberDTO dto = (MemberDTO)session.getAttribute("dto");
String[] ctg = request.getParameterValues("ctg");
%>
	<div id=body>
		<section id="sidebar">
			<div class="inner faid" style="text-align: left;">
				<nav>
					<ul>
						<div id="member">
							<a style="font-size: 20px;padding:20px">�ο����� �Է��� �ּ���</a><br>
							<input type="text" value="2" id="_ipbx" style="width:190px;float: left; text-align: center; margin-left: 12px;margin-top:5px">
							<button type="button" id="_up" style="padding-right:17px;padding-left:17px;float: right;"><img src='images/plus.png' style="margin-top:17px;width:30px;hight:30px"></button>
							<button type="button" id="_dw" style="padding-right:17px;padding-left:17px;"><img src='images/minus.png' style="margin-top:17px;width:30px;hight:30px"></button>
							<a onclick="next1()" style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;padding-bottom:12px'><span style='padding-right:10px'>next</span><img src='images/nexticon.png' width=40 hight=40></a>
						</div>
					</ul>
				</nav>	
			</div>
		</section>
								
		<div id="wrapper">
		
			<section id="intro" class="wrapper style1 fullscreen fade-up">
				<div id="map" style="width:100%;height:969px;z-index: 80;"></div>
				<div id="friendPage" style="position: absolute;z-index: 100;"></div>
				<%for(int i = 0; i < ctg.length; i++){ %>
					<h4 class=hide name="ctg" style="z-index: 1;"><%=ctg[i] %></h4> 
				<%} %>
				<h4 class=hide name="userId" style="z-index: 1;"><%=dto.getId() %></h4> 
			</section>
		</div>
	</div>

<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>


<script>
var memberNum = 0;
var friendIdList = [];
var div = document.getElementById("user");
var member = document.getElementById("member");
var map1 = document.getElementById("map");
var levelStay = 7;
var latlngStay = null;
var centerLat = 0;
var centerLng = 0;
var selecrtMarket = null;
var ctg_food_kor = ["�ѽ�","���","�н�ƮǪ��","�Ͻ�","�н�","�߽�","����"];
var ctg_food_eng = ['korea', 'us', 'fast', 'japan', 'bunsik', 'china', 'beer','food'];
var ctg_enter_kor = ['�뷡��', '�籸��', '��ȭ��/��ī��', '������', 'PC��','�ǳ�����������', '��ũ��������', '��ȭ/DVD��'];
var ctg_enter_eng = ['sing', 'dg', 'book', 'bowling', 'pc', 'screen', 'golf', 'movie', 'entertain'];
var pointName = [];
var pointScore = [];
var pointAdd = [];
var pointLat = [];
var pointLng = [];
var pointCtg = [];
var date = null;
var time = null;
var goalLat = null;
var goalLng = null;
var userName = [];
var friendList = [];
var friendPage = document.getElementById("friendPage");
var rand_text1 = ['�����̴�','��ô�ϴ�','��������','ġ������','�����ŷ�','���ʷ���','�����Ⱙ','��ȯ����','������','��������','�ü�����','�������'];
var rand_text2 = ['������','����','����','�Ƹ��','����ȭ','������','����','����','������','ī���̼�','��ȭ��','�����','�ƻ�ȭ','���϶�','ȣ��','���','���','��ǳ','�챸','������','���'];
var ctg = document.getElementsByName('ctg');
var ctg_list = []
for(let i = 0; i < ctg.length; i++){
	ctg_list[i] = ctg[i].innerHTML;
}
var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
    level: 7 // ������ Ȯ�� ����
};

// �ο��� ����
$(document).ready(function(){
	var timer; // setIntetval
	var s_timer; // setTimeout
	
	// + ��ư Ŭ���� input�� value �� ����
	$('#_up').on('mousedown', function(event){
		cal('_ipbx',1); // input�� value�� 300���� ������ 1����.
		s_timer = setTimeout(function() { // 0.5�� ���� ����
			timer = setInterval(function() { // 0.1�ʸ��� cal()�Լ� �ݺ�
				cal('_ipbx',1);
			},100);
		},500);
	});
	
	// - ��ư Ŭ���� input�� value �� ����
	$('#_dw').on('mousedown', function(event){
		cal('_ipbx',2); // input�� value�� 100���� ũ�� 1����.
		s_timer = setTimeout(function() { // 0.5�� ���� ����
			timer = setInterval(function() { // 0.1�ʸ��� cal()�Լ� �ݺ�
				cal('_ipbx',2);
			},100);
		},500);
	});
	
	// ���콺�� ���� Ÿ�̸� ���� �Լ��� Ŭ����
	$(document).on('mouseup', function(event){
		clearInterval(timer); 
		clearTimeout(s_timer);
	});	
	
	// input���� blur�� �̺�Ʈ
	$("#_ipbx").blur(function(){
		var inp_txt = this.value; // input�� value���� inp_txt�� ����
		var inp_txt_Arr = inp_txt.split('');  // inp_txt�� ��(���ڿ�)�� �迭�� �ٲ�
		var ch_inp_txt=''; // ���ڸ� ������ ����� ����
		
		for(var i in inp_txt_Arr) { // �Է°���ŭ(�迭ũ��) for�� �ݺ�
			if(isNumber(inp_txt_Arr[i])) {  // �迭�� ���� �����̸�
			  ch_inp_txt = ch_inp_txt.concat(inp_txt_Arr[i]); // ch_inp_txt�� ���ڸ� �߰�
			}
		}
		
		this.value=ch_inp_txt;  // ���ڷθ� ���� ������ ch_inp_txt�� value�� ����
		if(this.value >= 300) { // value�� 300�̻��̸� 300���� ����
			this.value = 300;
		}
		else if(this.value <= 100){ // value�� 100�����̸� 100���� ����
			this.value = 100;
		}
	});
	
	// input�� value���� ���ϰų� ���� �Լ�
	function cal(n_id, n_math) { // ù��° ���� ID, �ι�° ���� ����or����
		switch(n_math) {
				case 1 : // ����
						if(document.getElementById('_ipbx').value < 10) {
							document.getElementById('_ipbx').value++;
						}
						break;
				case 2 :  // ����
						if(document.getElementById('_ipbx').value > 2) {
							document.getElementById('_ipbx').value--;
						}
						break;
				default : break;
		}
		return false;
	}
		
	function isNumber(ch) {  // �������� �Ǵ� �Լ�
  		var numUnicode = ch.charCodeAt(0);     // ch�� �����ڵ带 �ƽ�Ű�ڵ�� ��ȯ                                                                           
  		if ( 48 <= numUnicode && numUnicode <= 57 ) return true;             // ��ȯ�� �ƽ�Ű�ڵ尡 ���ڰ� ������ true, ������ ���� 48~57
 		return false;
 	}
});

navigator.geolocation.getCurrentPosition(function(position) {
    
    var lat = position.coords.latitude, // ����
        lon = position.coords.longitude; // �浵
    
    var locPosition = new kakao.maps.LatLng(lat, lon), // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
        message = '<div style="padding:5px;">���⿡ ��Ű���?!</div>'; // ���������쿡 ǥ�õ� �����Դϴ�
    map.setCenter(locPosition);
});
function next1(){
	friendIdList.push("<%=dto.getId()%>");
	console.log(friendIdList);
	addSearch("<%=dto.getAddress()%>")
	addnum = 0;
	memberNum = document.getElementById("_ipbx").value;
    member.innerHTML = '<a style="font-size: 20px;padding:20px">��ġ�� ������ �ּ���</a>';
    for(i = 0; i < memberNum; i++){
		var random1 = Math.floor(Math.random() * rand_text1.length);
		var random2 = Math.floor(Math.random() * rand_text2.length);
		userName[i] = rand_text1[random1]+" "+rand_text2[random2];
		rand_text1.splice(random1, 1);
		rand_text2.splice(random2, 1);
		userName[0] = "<%=dto.getName()%>";
		member.innerHTML += "<a onclick=changeName("+i+") id=name"+i+" class=name align=left style='margin-top:40px;margin-left:20px;font-size:25px;padding:0px;position: inherit;content:none'>"+userName[i]+"</a>";
        member.innerHTML += "<button onclick=check("+i+") style='height: 50px;padding-left: 26px;padding-right: 26px;line-height: normal;margin-right:5px'>����</button>";
        member.innerHTML += "<button onclick=add("+i+") style='height: 50px;padding-left: 26px;padding-right: 26px;line-height: normal;margin-right:5px'>�ּ�</button>";
        if(i>0){
        	member.innerHTML += "<button onclick=friend("+i+") style='height: 50px;padding-left: 30px;padding-right: 30px;line-height: normal;margin-right:5px'>ģ�� ���</button><br>";        	
        }
    }
    member.innerHTML += "<br><button onclick=allCheck() style='WIDTH:342px;margin-bottom:30px'>��ü ���</button>";
    member.innerHTML += "<a onclick='next2()' style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;padding-bottom:12px'><span style='padding-right:10px'>next</span><img src='images/nexticon.png' width=40 hight=40></a>";
}
var namenum = null;
function changeName(num){
	namenum = num;
	var name = prompt('������ �̸��� �Է��ϼ���');
	if(name!=null){
		setName(name);		
	}
}
function setName(name){
	userName[namenum] = name;
	var nameSet = document.getElementById("name"+namenum);
	nameSet.innerHTML = name;
}

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�



// ������ �̵�, Ȯ��, ��ҷ� ���� �߽���ǥ�� ����Ǹ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
kakao.maps.event.addListener(map, 'center_changed', function() {

    // ������  ������ ���ɴϴ�
    levelStay = map.getLevel();
    // ������ �߽���ǥ�� ���ɴϴ� 
    latlngStay = map.getCenter(); 

});

checkList = []


function check(num){ // ������ ǥ���� div 
    if(latlngStay==null){
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };
    }else{
        mapOption = { 
            center: new kakao.maps.LatLng(latlngStay.getLat(), latlngStay.getLng()), // ������ �߽���ǥ
            level: levelStay // ������ Ȯ�� ����
        };
    }
    map1.innerHTML = null;
    
    map = new kakao.maps.Map(mapContainer, mapOption);
    // ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
    var marker = new kakao.maps.Marker(); 
    // ������ ��Ŀ�� ǥ���մϴ�
    marker.setMap(map);

    // ������ Ŭ�� �̺�Ʈ�� ����մϴ�
    // ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        
        // Ŭ���� ����, �浵 ������ �����ɴϴ� 
        var latlng = mouseEvent.latLng; 
        
        // ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
        marker.setPosition(latlng);
        
        checkList[num] = [latlng.getLat(),latlng.getLng()];
    });
    // ������ �̵�, Ȯ��, ��ҷ� ���� �߽���ǥ�� ����Ǹ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���ϵ��� �̺�Ʈ�� ����մϴ�
    kakao.maps.event.addListener(map, 'center_changed', function() {

	    // ������  ������ ���ɴϴ�
	    levelStay = map.getLevel();
	    // ������ �߽���ǥ�� ���ɴϴ� 
	    latlngStay = map.getCenter(); 

    });
}
var addnum = null;
function add(num){
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes")
	addnum = num;
}
function jusoCallBack(roadAddrPart1){
	addSearch(roadAddrPart1);
}
function addSearch(add){
    if(latlngStay==null){
        mapOption = { 
            center: new kakao.maps.LatLng(33.450701, 126.570667), // ������ �߽���ǥ
            level: 5 // ������ Ȯ�� ����
        };
    }else{
        mapOption = { 
            center: new kakao.maps.LatLng(latlngStay.getLat(), latlngStay.getLng()), // ������ �߽���ǥ
            level: levelStay // ������ Ȯ�� ����
        };
    }
    map1.innerHTML = null;
    
    map = new kakao.maps.Map(mapContainer, mapOption);
    var address = add;
    // �ּ�-��ǥ ��ȯ ��ü�� �����մϴ�
    var geocoder = new kakao.maps.services.Geocoder();

    // �ּҷ� ��ǥ�� �˻��մϴ�
    geocoder.addressSearch(address, function(result, status) {

        // ���������� �˻��� �Ϸ������ 
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            map.setCenter(coords);
            // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            checkList[addnum] = [coords.getLat(),coords.getLng()];
            // ������ �߽��� ��������� ���� ��ġ�� �̵���ŵ�ϴ�
        } else{
            alert("�ּҸ� �ٽ� �Է����ּ���")
        }
    });

    kakao.maps.event.addListener(map, 'center_changed', function() {

        // ������  ������ ���ɴϴ�
        levelStay = map.getLevel();
        // ������ �߽���ǥ�� ���ɴϴ� 
        latlngStay = map.getCenter(); 
    });
}

function friend(num){
	addnum = num;
	namenum = num;
	$.ajax({
        url:"friendsearch",
        type:"POST",
        data:{
        	id:"<%=dto.getId() %>"
        },
        success:function(res){
        	for(let i = 0; i < res.class.length; i++){
           		friendList[i] = [
           			res.class[i].friendId,
           			res.class[i].friendName,
           			res.class[i].friendAddress
           			]
        	}
        	friendPage.innerHTML ="<table id=friends class=in style='margin: 0px;background-color:#312450;font-size:20px;border-radius: 0px 20px 20px 0px;'></table>";
        	var table = document.getElementById("friends");
        	for(let i = 0; i < friendList.length; i++){
	        	table.innerHTML += "<tr id=tr"+i+"></tr>";
	        	var tr = document.getElementById("tr"+i);
	        		for(let j = 1; j < 3; j+=2){
		        	tr.innerHTML += "<td>"+ friendList[i][j] +"</td>";
	        		}
	        		var ad = res.class[i].friendAddress;
	        		tr.innerHTML += "<td><button onclick='friendAdd(" + i + ")'>����</button></td>";
        	}
        },
        error:function(){
            alert("error")
        }
        
    })
}
function friendAdd(num){
	document.getElementById("friends").className="out";
	addSearch(friendList[num][2]);
	setName(friendList[num][1]);
	friendIdList.push(friendList[num][0]);
}

function allCheck(){
    var latMax = checkList[0][0];
    var latMin = checkList[0][0];
    var lngMax = checkList[0][1];
    var lngMin = checkList[0][1];
    
    for(let i = 1; i < checkList.length; i++){
        
        if(latMax < checkList[i][0]){
            latMax = checkList[i][0];
        }else if(latMin > checkList[i][0]){
            latMin = checkList[i][0]
        }
        if(lngMax < checkList[i][1]){
            lngMax = checkList[i][1];
        }else if(lngMin > checkList[i][1]){
            lngMin = checkList[i][1];
        }
    }
    var avgLat = (latMax + latMin)/2;
    var avgLng = (lngMax + lngMin)/2;
    if(levelStay<7){
        levelStay=7
    }
    mapOption = { 
        center: new kakao.maps.LatLng(avgLat, avgLng), // ������ �߽���ǥ
        level: levelStay // ������ Ȯ�� ����
    };
    map1.innerHTML = null;
    map = new kakao.maps.Map(mapContainer, mapOption);

    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // ��Ŀ�̹����� �ּ��Դϴ�    
    imageSize = new kakao.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
  
    for(let i = 0; i < checkList.length; i++){
        var markerPosition  = new kakao.maps.LatLng(checkList[i][0], checkList[i][1]);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);

            // ���� �����ϴ� ��ǥ �迭�Դϴ�. �� ��ǥ���� �̾ ���� ǥ���մϴ�
            var linePath = [
                new kakao.maps.LatLng(checkList[i][0], checkList[i][1]),
                new kakao.maps.LatLng(avgLat, avgLng)
            ];

            // ������ ǥ���� ���� �����մϴ�
            var polyline = new kakao.maps.Polyline({
                path: linePath, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
                strokeWeight: 2, // ���� �β� �Դϴ�
                strokeColor: 'red', // ���� �����Դϴ�
                strokeOpacity: 0.3, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
                strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
            });

            // ������ ���� ǥ���մϴ� 
            polyline.setMap(map);

            marker.setMap(map);
            var userImg = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw7m8AVV6GWpD6jp61UTPUQCYBn2yBLuujsg&usqp=CAU";
            var iwContent = '<div class ="label"><span class="left" ></span><span class="center" style="padding:1px"><img src='+userImg+' width=14px hight=14px style="padding-top:5px; padding-right:4px">'+userName[i]+'</span><span class="right"></span></div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
                iwPosition = new kakao.maps.LatLng(checkList[i][0], checkList[i][1]); //���������� ǥ�� ��ġ�Դϴ�
            var customOverlay = new kakao.maps.CustomOverlay({
                position: iwPosition,
                content: iwContent   
            });

            // Ŀ���� �������̸� ������ ǥ���մϴ�
            customOverlay.setMap(map);
        }

    // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    var markerPosition  = new kakao.maps.LatLng(avgLat, avgLng);
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage
    });
    var circle = new kakao.maps.Circle({
        center : new kakao.maps.LatLng(avgLat, avgLng),  // ���� �߽���ǥ �Դϴ� 
        radius: 1500, // ���� ������ ���� �������Դϴ� 
        strokeWeight: 0, // ���� �β��Դϴ� 
        strokeColor: '#75B8FA', // ���� �����Դϴ�
        strokeOpacity: 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
        strokeStyle: 'dashed', // ���� ��Ÿ�� �Դϴ�
        fillColor: '#CFE7FF', // ä��� �����Դϴ�
        fillOpacity: 0.5  // ä��� ������ �Դϴ�   
    }); 
    
    marker.setMap(map);
    circle.setMap(map);
	// ������ �߽���ǥ�� ���ɴϴ� 
	centerLat = markerPosition.getLat();
	centerLng = markerPosition.getLng();
	latlngStay = markerPosition;
}

function next2(){
	if(checkList.length == memberNum){
	    levelStay=5;
	    mapOption = { 
	        center: new kakao.maps.LatLng(centerLat, centerLng), // ������ �߽���ǥ
	        level: levelStay // ������ Ȯ�� ����
	    };
	    map1.innerHTML = null;
	    map = new kakao.maps.Map(mapContainer, mapOption);
	
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // ��Ŀ�̹����� �ּ��Դϴ�    
	    imageSize = new kakao.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
	
	    // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
	    var markerPosition  = new kakao.maps.LatLng(centerLat, centerLng);
	    var marker = new kakao.maps.Marker({
	        position: markerPosition,
	        image: markerImage
	    });
	    var circle = new kakao.maps.Circle({
	        center : new kakao.maps.LatLng(centerLat, centerLng),  // ���� �߽���ǥ �Դϴ� 
	        radius: 1500, // ���� ������ ���� �������Դϴ� 
	        strokeWeight: 0, // ���� �β��Դϴ� 
	        strokeColor: '#75B8FA', // ���� �����Դϴ�
	        strokeOpacity: 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
	        strokeStyle: 'dashed', // ���� ��Ÿ�� �Դϴ�
	        fillColor: '#CFE7FF', // ä��� �����Դϴ�
	        fillOpacity: 0.5  // ä��� ������ �Դϴ�   
	    }); 
	    
	    marker.setMap(map);
	    circle.setMap(map);
	    console.log(friendIdList);
	    var urlctg = null;
	    if(ctg_food_eng.indexOf(ctg_list[0])>=0){
	    	urlctg = "food";
	    }else if(ctg_enter_eng.indexOf(ctg_list[0])>=0){
	    	urlctg = "entertain";
	    }else{
	    	urlctg = "cafe";
	    }
		$.ajax({
	        url:"http://218.157.69.44:9000/"+urlctg,
	        type:"GET",
	        data:{
				lat:centerLat,
				lng:centerLng,
				ctg:ctg_list,
				id:friendIdList
	        },
	        success:function(res){
	            console.log(res)
	            console.log(res[0])
	            console.log(res[0][3])
	            console.log(res[0][4])
	            for(let i = 0; i < res.length; i++){
	            	pointName[i] = res[i][0];
	            	if(urlctg!="entertain"){
	            		pointScore[i] = "�� "+res[i][1];
		            	pointAdd[i] = res[i][2];
		            	pointLat[i] = res[i][3];
		            	pointLng[i] = res[i][4];
		            	if(urlctg=="food"){
		            		pointCtg[i] = ctg_food_kor[ctg_food_eng.indexOf(res[i][5])];
		            	}else{
		            		pointCtg[i] = "ī��";
		            	}
	            	}
	            	else{
	            		pointScore[i] = "";
	            		pointAdd[i] = res[i][1];
		            	pointLat[i] = res[i][2];
		            	pointLng[i] = res[i][3];
		            	pointCtg[i] = ctg_enter_kor[ctg_enter_eng.indexOf(res[i][4])];
	            	}
	            }
			    for(let i = 0; i < pointLat.length; i++){
			    	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // ��Ŀ�̹����� �ּ��Դϴ�    
			        imageSize = new kakao.maps.Size(15, 23), // ��Ŀ�̹����� ũ���Դϴ�
			        imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
			    	 // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
			        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
			        var markerPosition  = new kakao.maps.LatLng(pointLat[i], pointLng[i]);
			        var marker = new kakao.maps.Marker({
			            position: markerPosition,
			        });
			        marker.setMap(map);
			    }
			    member.innerHTML = '<a style="font-size: 20px;padding:20px">���� ��Ҹ� �����ּ���</a>';
			    member.innerHTML += '<ul id=ul></ul>';
			    var list = document.getElementById("ul");
			    for(let i = 0; i < pointLat.length; i++){
			    	list.innerHTML += '<li style="text-align: right;"><a onclick=marketList('+i+')><p style="font-size: 25px;margin-bottom: 0px;">'+pointName[i]+'</p>'+pointCtg[i]+" "+pointScore[i]+'</a></li>';
			    }
	        },
	        error:function(){
	            alert("���� �̤�")
	        }
	        
	    })
	}else{
		alert("��� �ο��� ��ġ�� �˷��ּ���!")
	}
}

function marketList(num){
	map1.innerHTML = null;
    map = new kakao.maps.Map(mapContainer, mapOption);

    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // ��Ŀ�̹����� �ּ��Դϴ�    
    imageSize = new kakao.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.

    // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    var markerPosition  = new kakao.maps.LatLng(centerLat, centerLng);
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage
    });
    var circle = new kakao.maps.Circle({
        center : new kakao.maps.LatLng(centerLat, centerLng),  // ���� �߽���ǥ �Դϴ� 
        radius: 1500, // ���� ������ ���� �������Դϴ� 
        strokeWeight: 0, // ���� �β��Դϴ� 
        strokeColor: '#75B8FA', // ���� �����Դϴ�
        strokeOpacity: 1, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
        strokeStyle: 'dashed', // ���� ��Ÿ�� �Դϴ�
        fillColor: '#CFE7FF', // ä��� �����Դϴ�
        fillOpacity: 0.5  // ä��� ������ �Դϴ�   
    }); 
    
    marker.setMap(map);
    circle.setMap(map);
    
    for(let i = 0; i < pointLat.length; i++){
    	var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // ��Ŀ�̹����� �ּ��Դϴ�    
        imageSize = new kakao.maps.Size(15, 23), // ��Ŀ�̹����� ũ���Դϴ�
        imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
    	 // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
        var markerPosition  = new kakao.maps.LatLng(pointLat[i], pointLng[i]);
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map);
    }
    
    
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(pointLat[num], pointLng[num])
	});

	// Ŀ���� �������̿� ǥ���� ������ �Դϴ�
	// Ŀ���� �������̴� �Ʒ��� ���� ����ڰ� �����Ӱ� �������� �����ϰ� �̺�Ʈ�� ������ �� �ֱ� ������
	// ������ �̺�Ʈ �޼ҵ带 �������� �ʽ��ϴ� 
	var content = '<div class="wrap">' + 
	            '    <div class="info">' + 
	            '        <p class="title" style="font-size=15px">' + 
	                         pointName[num] + 
	            '            <div class="close" onclick="next3()" title="�ݱ�"><span style="padding-right:5px">NEXT</span><img src="images/nexticon_1.png" width=20 hight=20></div>' + 
	            '        </p>' + 
	            '        <div class="body">' + 
	            '            <div class="img">' +
	            '                <img src="data:image/png;base64,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" width="73" height="70">' +
	            '           </div>' + 
	            '            <div class="desc">' + 
	            '                <div class="ellipsis"><b style="color:black">'+pointAdd[num]+'</b></div>' + 
	            '                <div class="jibun ellipsis" align=right style="padding-top: 0px;"><br>#'+pointCtg[num]+' '+pointScore[num]+'</div>' + 
	            '            </div>' + 
	            '        </div>' + 
	            '    </div>' +    
	            '</div>';

	// ��Ŀ ���� Ŀ���ҿ������̸� ǥ���մϴ�
	// ��Ŀ�� �߽����� Ŀ���� �������̸� ǥ���ϱ����� CSS�� �̿��� ��ġ�� �����߽��ϴ�
	var overlay = new kakao.maps.CustomOverlay({
	    content: content,
	    position: marker.getPosition()       
	});
	overlay.setMap(map);
	selectMarket = num;
}

function next3(){
	member.innerHTML = '<a style="font-size: 20px;padding:20px">��� �ð��� �����ּ���</a>';
	member.innerHTML += '<input type=date id=currentDate align=center style="color:white;width:360px;background-color:#312450; border:1px solid rgb(32, 32, 32)margin:50px 0px 50px 0px;">'
	member.innerHTML += '<input type=time id=currentTime align=center style="color:white;width:360px;background-color:#312450; border:1px solid rgb(32, 32, 32);">'
	member.innerHTML += "<a onclick='next4()' style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;padding-bottom:12px'><span style='padding-right:10px'>next</span><img src='images/nexticon.png' width=40 hight=40></a>";
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
	document.getElementById('currentTime').value = new Date().toISOString().slice(11, 16);
}

function next4(){
	date = document.getElementById('currentDate').value;
	time = document.getElementById('currentTime').value;
	//document.getElementById("sidebar").style.width = "1920px";
	member.innerHTML = '<div>���ο� ����� ��ϵǾ����ϴ�.<div><br>';
	member.innerHTML += '<div>�������<div>';
	for(let i = 0; i < memberNum; i++){		
		member.innerHTML += '<div>'+userName[i]+'<div>';
	}
	member.innerHTML += '<br><div>���� ��¥ : '+date+'</div><br>';
	member.innerHTML += '<div>���� �ð� : '+time+'</div><br>';
	member.innerHTML += '<div>���Ը� : '+pointName[selectMarket]+'�ּ� : '+pointAdd[selectMarket]+'</div><br>';
	//member.innerHTML += '<div id="map" style="width:400px;height:400px;"></div>';
	member.innerHTML += "<a onclick='next5()' style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;padding-bottom:12px'><span style='padding-right:10px'>next</span><img src='images/nexticon.png' width=40 hight=40></a>"
	
	goalLat = pointLat[selectMarket];
	goalLng = pointLng[selectMarket];
	
	var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
	mapOption = { 
	    center: new kakao.maps.LatLng(goalLat, goalLng), // ������ �߽���ǥ
	    level: 3 // ������ Ȯ�� ����
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

	// ��Ŀ�� ǥ�õ� ��ġ�Դϴ� 
	var markerPosition  = new kakao.maps.LatLng(goalLat, goalLng); 

	// ��Ŀ�� �����մϴ�
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <p class="title" style="font-size=15px">' + 
                 pointName[selectMarket] +  
    '        </p>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="data:image/png;base64,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" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis"><b style="color:black">'+pointAdd[selectMarket]+'</b></div>' + 
    '                <div class="jibun ellipsis" align=right style="padding-top: 0px;"><br>#'+pointCtg[selectMarket]+' '+pointScore[selectMarket]+'</div>' + 
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

function next5(){
	console.log(friendIdList);
	console.log(friendIdList.length);
	for(let i = 0; i < friendIdList.length; i++){
		$.ajax({
	        url:"planinsert",
	        type:"post",
	        data:{
				id:friendIdList[i],
				date:date,
				time:time,
				name:pointName[selectMarket],
				add:pointAdd[selectMarket],
				lat:pointLat[selectMarket],
				lng:pointLng[selectMarket]
	        },
	        success:function(res){
	            console.log(res)
	        },
	        error:function(){
	            alert("���� �̤�")
	        }
	        
	    })
	}
}
</script>
</body>
</html>