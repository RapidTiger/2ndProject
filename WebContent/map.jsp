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
		    a:hover {filter: brightness(130%)}
		    
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
			body{ -ms-overflow-style: none;} ::-webkit-scrollbar { display: none;}
			#sidebar nav a {
   				color: rgba(255, 255, 255, 0.7);
			}
		</style>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2f38cfa7bd7813a236bed2fb02daeb55&libraries=services"></script>
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		
</head>
<body>
<div id=ipt>
	<div id=mapstart style="z-index: 100;position: fixed; width: 200%; height: 100%">
	    <div style="height:10%;width:95%;background-color: #312450"></div>
	    <div style="height:10%;width:90%;background-color: #312450"></div>
	    <div style="height:10%;width:85%;background-color: #312450"></div>
	    <div style="height:10%;width:80%;background-color: #312450"></div>
	    <div style="height:10%;width:75%;background-color: #312450"></div>
	    <div style="height:10%;width:70%;background-color: #312450"></div>
	    <div style="height:10%;width:65%;background-color: #312450"></div>
	    <div style="height:10%;width:60%;background-color: #312450"></div>
	    <div style="height:10%;width:55%;background-color: #312450"></div>
	    <div style="height:10%;width:50%;background-color: #312450"></div>
	</div>
</div>
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
var rand_text1 = ['�����̴�','��ô�ϴ�','��������','ġ������','�����ŷ�','���ʷ���','�����Ⱙ','��ȯ����','������','��������','�ü�����','�������','�߻���','���ִ�','�ɽ���'];
var rand_text2 = ['������','����','û����','�Ƹ��','����ȭ','������','����','����','������','���ξ���','��ȭ��','����','�ƻ�ȭ','���϶�','ȣ��','���','���','��ǳ','�챸','������','���'];
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

var markers = [];
var lines = [];
var center = [];
var customOverlays = [];
var overlays = [];
function setMarkersDel(map) {
	console.log(overlays)
    for(var i = 0; i < markers.length; i++) {
    	markers[i].setMap(map);
    }
    for(var i = 0; i < lines.length; i++) {
    	lines[i].setMap(map);
    }
    for(var i = 0; i < center.length; i++) {
    	console.log(center)
    	center[i].setMap(map);
    }
    for(var i = 0; i < overlays.length; i++) {
    	overlays[i].setMap(map);
    }
    for(var i = 0; i < customOverlays.length; i++) {
    	customOverlays[i].setMap(map);
    }
}
function setMarkers(map) {
	for(var i = 0; i < markers.length; i++) {
    	markers[i].setMap(map);
    }
}

// "��Ŀ ���̱�" ��ư�� Ŭ���ϸ� ȣ��Ǿ� �迭�� �߰��� ��Ŀ�� ������ ǥ���ϴ� �Լ��Դϴ�
function showMarkers() {
    setMarkers(map)    
}

// "��Ŀ ���߱�" ��ư�� Ŭ���ϸ� ȣ��Ǿ� �迭�� �߰��� ��Ŀ�� �������� �����ϴ� �Լ��Դϴ�
function hideMarkers() {
	setMarkersDel(null);    
}

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
    
    var locPosition = new kakao.maps.LatLng(lat, lon); // ��Ŀ�� ǥ�õ� ��ġ�� geolocation���� ���� ��ǥ�� �����մϴ�
    map.panTo(locPosition);
});
function next1(){
	document.getElementById('ipt').innerHTML = null;
	friendIdList.push("<%=dto.getId()%>");
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

checkListLat = [];
checkListLng = [];


function check(num){ // ������ ǥ���� div 
	mapOption = { 
	        center: new kakao.maps.LatLng(centerLat, centerLng), // ������ �߽���ǥ
	        level: levelStay // ������ Ȯ�� ����
	    };
	map1.innerHTML = null;
	map = new kakao.maps.Map(mapContainer, mapOption);
	hideMarkers();
	console.log(num);
    // ������ Ŭ���� ��ġ�� ǥ���� ��Ŀ�Դϴ�
    var marker = new kakao.maps.Marker(); 
    // ������ ��Ŀ�� ǥ���մϴ�
    marker.setMap(map);
	markers[num] = marker;
    // ������ Ŭ�� �̺�Ʈ�� ����մϴ�
    // ������ Ŭ���ϸ� ������ �Ķ���ͷ� �Ѿ�� �Լ��� ȣ���մϴ�
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        
        // Ŭ���� ����, �浵 ������ �����ɴϴ� 
        var latlng = mouseEvent.latLng; 
        
        // ��Ŀ ��ġ�� Ŭ���� ��ġ�� �ű�ϴ�
        marker.setPosition(latlng);
        markers[num] = marker;
        checkListLat[num] = latlng.getLat();
        checkListLng[num] = latlng.getLng();
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
            map.panTo(coords);
            centerLat = coords.getLat();
            centerLng = coords.getLng();
            // ��������� ���� ��ġ�� ��Ŀ�� ǥ���մϴ�
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            markers[addnum] = marker;
            checkListLat[addnum] = coords.getLat();
            checkListLng[addnum] = coords.getLng();
            console.log(coords.getLat());
            console.log(coords.getLng());
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
	hideMarkers();
    var latMax = checkListLat[0];
    var latMin = checkListLat[0];
    var lngMax = checkListLng[0];
    var lngMin = checkListLng[0];
    
    for(let i = 1; i < checkListLat.length; i++){
        
        if(latMax < checkListLat[i]){
            latMax = checkListLat[i];
        }else if(latMin > checkListLat[i]){
            latMin = checkListLat[i]
        }
        if(lngMax < checkListLng[i]){
            lngMax = checkListLng[i];
        }else if(lngMin > checkListLng[i]){
            lngMin = checkListLng[i];
        }
    }
    var avgLat = (latMax + latMin)/2;
    var avgLng = (lngMax + lngMin)/2;
    if(levelStay<7){
        levelStay=7
    }
    
    map.setLevel(levelStay);
    var moveLatLon = new kakao.maps.LatLng(avgLat, avgLng) // ������ �߽���ǥ
    map.panTo(moveLatLon);

    var imageSrc = 'images/marker_center.png', // ��Ŀ�̹����� �ּ��Դϴ�    
    imageSize = new kakao.maps.Size(64, 69), // ��Ŀ�̹����� ũ���Դϴ�
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
    showMarkers();
    for(let i = 0; i < checkListLat.length; i++){
        // ���� �����ϴ� ��ǥ �迭�Դϴ�. �� ��ǥ���� �̾ ���� ǥ���մϴ�
        var linePath = [
            new kakao.maps.LatLng(checkListLat[i], checkListLng[i]),
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
		lines[i] = polyline;
        var userImg = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw7m8AVV6GWpD6jp61UTPUQCYBn2yBLuujsg&usqp=CAU";
        var iwContent = '<div class ="label"><span class="left" ></span><span class="center" style="padding:1px"><img src='+userImg+' width=14px hight=14px style="padding-top:5px; padding-right:4px">'+userName[i]+'</span><span class="right"></span></div>', // ���������쿡 ǥ��� �������� HTML ���ڿ��̳� document element�� �����մϴ�
            iwPosition = new kakao.maps.LatLng(checkListLat[i], checkListLng[i]); //���������� ǥ�� ��ġ�Դϴ�
        var customOverlay = new kakao.maps.CustomOverlay({
            position: iwPosition,
            content: iwContent   
        });

        // Ŀ���� �������̸� ������ ǥ���մϴ�
        customOverlay.setMap(map);
        customOverlays[i] = customOverlay;
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
    center[0] = marker;
    circle.setMap(map);
    center[1] = circle;
    centerLat = markerPosition.getLat();
	centerLng = markerPosition.getLng();
	latlngStay = markerPosition;
}

function next2(){
	if(checkListLat.length == memberNum){
	    levelStay=5;
	    mapOption = { 
	        center: new kakao.maps.LatLng(centerLat, centerLng), // ������ �߽���ǥ
	        level: levelStay // ������ Ȯ�� ����
	    };
	    map1.innerHTML = null;
	    map = new kakao.maps.Map(mapContainer, mapOption);
	
	    var imageSrc = 'images/marker_center.png', // ��Ŀ�̹����� �ּ��Դϴ�    
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
	        	console.log(res);
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
		            		pointCtg[i] = res[i][5];
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
			    	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", // ��Ŀ�̹����� �ּ��Դϴ�    
			        imageSize = new kakao.maps.Size(24, 35), // ��Ŀ�̹����� ũ���Դϴ�			  
			        imageOption = {offset: new kakao.maps.Point(27, 69)}; // ��Ŀ�̹����� �ɼ��Դϴ�. ��Ŀ�� ��ǥ�� ��ġ��ų �̹��� �ȿ����� ��ǥ�� �����մϴ�.
			    	 // ��Ŀ�� �̹��������� ������ �ִ� ��Ŀ�̹����� �����մϴ�
			        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
			        var markerPosition  = new kakao.maps.LatLng(pointLat[i], pointLng[i]);
			        var marker = new kakao.maps.Marker({
			            position: markerPosition,
			            image : markerImage 
			        });
			        marker.setMap(map);
			    }
			    member.innerHTML = '<a style="font-size: 20px;padding:20px">���� ��Ҹ� �����ּ���</a>';
			    member.innerHTML += '<ul id=ul></ul>';
			    var list = document.getElementById("ul");
			    for(let i = 0; i < pointLat.length; i++){
			    	list.innerHTML += '<li style="text-align: right;"><a id = finally'+(i+1)+' onclick=marketList('+i+')><p style="font-size: 25px;margin-bottom: 0px;color: rgba(255, 255, 255, 0.9)">'+pointName[i]+'</p>'+pointCtg[i]+" <span style='color:yellow'>"+pointScore[i]+'</span></a></li>';
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
	hideMarkers();
    
    
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(pointLat[num], pointLng[num])
	});

	// Ŀ���� �������̿� ǥ���� ������ �Դϴ�
	// Ŀ���� �������̴� �Ʒ��� ���� ����ڰ� �����Ӱ� �������� �����ϰ� �̺�Ʈ�� ������ �� �ֱ� ������
	// ������ �̺�Ʈ �޼ҵ带 �������� �ʽ��ϴ� 
	var content = '<div class="wrap faid">' + 
	            '    <div class="info">' + 
	            '        <p class="title" style="font-size=15px">' + 
	                         pointName[num] + 
	            '            <div class="close" onclick="next3()" title="�ݱ�"><span style="padding-right:5px">NEXT</span><img src="images/nexticon_1.png" width=20 hight=20></div>' + 
	            '        </p>' + 
	            '        <div class="body">' + 
	            '            <div class="img">' +
	            '                <img src="images/logo.png" width="73" height="70">' +
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
	overlays[0] = overlay;
	selectMarket = num;
}

function next3(){
	member.innerHTML = '<a style="font-size: 20px;padding:20px">��� �ð��� �����ּ���</a>';
	member.innerHTML += '<input type=date id=currentDate align=center style="width:360px;color:black;border:1px solid rgb(32, 32, 32)margin:50px 0px 50px 0px;"><br>'
	member.innerHTML += '<input type=time id=currentTime align=center style="width:360px;color:black;border:1px solid rgb(32, 32, 32);margin-top:20px">'
	member.innerHTML += "<a onclick='next4()' style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;padding-bottom:12px'><span style='padding-right:10px'>next</span><img src='images/nexticon.png' width=40 hight=40></a>";
	document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
	document.getElementById('currentTime').value = new Date().toISOString().slice(11, 13)+':00';
	console.log(new Date().toISOString())
}

function next4(){
	date = document.getElementById('currentDate').value;
	time = document.getElementById('currentTime').value;
	console.log(date);
	console.log(time);
	//document.getElementById("sidebar").style.width = "1920px";
	member.innerHTML = '<div id = finally1 style="font-size:35px">���ο� �����<br>��ϵǾ����ϴ�.<div><br>';
	member.innerHTML += '<div id = finally2 >Members<ul id=endul></ul><div>';
	var endul = document.getElementById('endul');
	var inum = 3;
	for(let i = 0; i < memberNum; i++){
		endul.innerHTML += '<li id = finally'+inum+'>'+userName[i]+'</li>';
		inum += 1;
	}
	member.innerHTML += '<div id = finally'+inum+'>DATE</div>';
	inum += 1;
	member.innerHTML += '<div id = finally'+inum+'> - '+date+'</div><br>';
	inum += 1;
	member.innerHTML += '<div id = finally'+inum+'>TIME</div>';
	inum += 1;
	member.innerHTML += '<div id = finally'+inum+'> - '+time+'</div><br>';
	inum += 1;
	member.innerHTML += '<div id = finally'+inum+'>LOCATION</div>';
	inum += 1;
	member.innerHTML += '<div id = finally'+inum+'> - '+pointName[selectMarket]+'<br><br> ADDRESS<br> - '+pointAdd[selectMarket]+'</div><br>';
	inum += 1;
	//member.innerHTML += '<div id="map" style="width:400px;height:400px;"></div>';
	member.innerHTML += "<a onclick='next5()' href='main.jsp' style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;padding-bottom:12px'><span style='padding-right:10px'>main</span><img src='images/nexticon.png' width=40 hight=40></a>"
	
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
    '                <img src="images/logo.png" width="73" height="70">' +
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