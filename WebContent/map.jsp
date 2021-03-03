<%@page import="com.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>지도 생성하기</title>
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
							<a style="font-size: 20px;padding:20px">인원수를 입력해 주세요</a><br>
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
var ctg_food_kor = ["한식","양식","패스트푸드","일식","분식","중식","술집"];
var ctg_food_eng = ['korea', 'us', 'fast', 'japan', 'bunsik', 'china', 'beer','food'];
var ctg_enter_kor = ['노래방', '당구장', '만화방/북카페', '볼링장', 'PC방','실내골프연습장', '스크린스포츠', '영화/DVD방'];
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
var rand_text1 = ['설레이는','쎈척하는','내숭떠는','치명적인','반전매력','새초롬한','분위기갑','몽환적인','그윽한','생기충전','시선집중','빠져드는','잘생긴','멋있는','심심한'];
var rand_text2 = ['복숭아','포도','청포도','아몬드','수선화','도라지','딸기','벚꽃','데이지','파인애플','무화가','녹차','아생화','라일락','호박','장미','모과','단풍','살구','오렌지','사과'];
var ctg = document.getElementsByName('ctg');
var ctg_list = []
for(let i = 0; i < ctg.length; i++){
	ctg_list[i] = ctg[i].innerHTML;
}
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 7 // 지도의 확대 레벨
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

// "마커 보이기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에 표시하는 함수입니다
function showMarkers() {
    setMarkers(map)    
}

// "마커 감추기" 버튼을 클릭하면 호출되어 배열에 추가된 마커를 지도에서 삭제하는 함수입니다
function hideMarkers() {
	setMarkersDel(null);    
}

// 인원수 설정
$(document).ready(function(){
	var timer; // setIntetval
	var s_timer; // setTimeout
	
	// + 버튼 클릭시 input의 value 값 감소
	$('#_up').on('mousedown', function(event){
		cal('_ipbx',1); // input의 value가 300보다 작으면 1증가.
		s_timer = setTimeout(function() { // 0.5초 이후 실행
			timer = setInterval(function() { // 0.1초마다 cal()함수 반복
				cal('_ipbx',1);
			},100);
		},500);
	});
	
	// - 버튼 클릭시 input의 value 값 감소
	$('#_dw').on('mousedown', function(event){
		cal('_ipbx',2); // input의 value가 100보다 크면 1감소.
		s_timer = setTimeout(function() { // 0.5초 이후 실행
			timer = setInterval(function() { // 0.1초마다 cal()함수 반복
				cal('_ipbx',2);
			},100);
		},500);
	});
	
	// 마우스를 떼면 타이머 관련 함수들 클리어
	$(document).on('mouseup', function(event){
		clearInterval(timer); 
		clearTimeout(s_timer);
	});	
	
	// input에서 blur시 이벤트
	$("#_ipbx").blur(function(){
		var inp_txt = this.value; // input의 value값을 inp_txt에 저장
		var inp_txt_Arr = inp_txt.split('');  // inp_txt의 값(문자열)을 배열로 바꿈
		var ch_inp_txt=''; // 숫자만 추출후 저장될 변수
		
		for(var i in inp_txt_Arr) { // 입력값만큼(배열크기) for문 반복
			if(isNumber(inp_txt_Arr[i])) {  // 배열의 값이 숫자이면
			  ch_inp_txt = ch_inp_txt.concat(inp_txt_Arr[i]); // ch_inp_txt에 숫자를 추가
			}
		}
		
		this.value=ch_inp_txt;  // 숫자로만 새로 생성된 ch_inp_txt를 value에 저장
		if(this.value >= 300) { // value가 300이상이면 300으로 수정
			this.value = 300;
		}
		else if(this.value <= 100){ // value가 100이하이면 100으로 수정
			this.value = 100;
		}
	});
	
	// input의 value값을 더하거나 빼는 함수
	function cal(n_id, n_math) { // 첫번째 인자 ID, 두번째 인자 덧셈or뺄셈
		switch(n_math) {
				case 1 : // 덧셈
						if(document.getElementById('_ipbx').value < 10) {
							document.getElementById('_ipbx').value++;
						}
						break;
				case 2 :  // 뺄셈
						if(document.getElementById('_ipbx').value > 2) {
							document.getElementById('_ipbx').value--;
						}
						break;
				default : break;
		}
		return false;
	}
		
	function isNumber(ch) {  // 숫자유무 판단 함수
  		var numUnicode = ch.charCodeAt(0);     // ch의 문자코드를 아스키코드로 반환                                                                           
  		if ( 48 <= numUnicode && numUnicode <= 57 ) return true;             // 변환된 아스키코드가 숫자가 맞으면 true, 숫자의 범위 48~57
 		return false;
 	}
});

navigator.geolocation.getCurrentPosition(function(position) {
    
    var lat = position.coords.latitude, // 위도
        lon = position.coords.longitude; // 경도
    
    var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
    map.panTo(locPosition);
});
function next1(){
	document.getElementById('ipt').innerHTML = null;
	friendIdList.push("<%=dto.getId()%>");
	addSearch("<%=dto.getAddress()%>")
	addnum = 0;
	memberNum = document.getElementById("_ipbx").value;
    member.innerHTML = '<a style="font-size: 20px;padding:20px">위치를 설정해 주세요</a>';
    for(i = 0; i < memberNum; i++){
		var random1 = Math.floor(Math.random() * rand_text1.length);
		var random2 = Math.floor(Math.random() * rand_text2.length);
		userName[i] = rand_text1[random1]+" "+rand_text2[random2];
		rand_text1.splice(random1, 1);
		rand_text2.splice(random2, 1);
		userName[0] = "<%=dto.getName()%>";
		member.innerHTML += "<a onclick=changeName("+i+") id=name"+i+" class=name align=left style='margin-top:40px;margin-left:20px;font-size:25px;padding:0px;position: inherit;content:none'>"+userName[i]+"</a>";
        member.innerHTML += "<button onclick=check("+i+") style='height: 50px;padding-left: 26px;padding-right: 26px;line-height: normal;margin-right:5px'>선택</button>";
        member.innerHTML += "<button onclick=add("+i+") style='height: 50px;padding-left: 26px;padding-right: 26px;line-height: normal;margin-right:5px'>주소</button>";
        if(i>0){
        	member.innerHTML += "<button onclick=friend("+i+") style='height: 50px;padding-left: 30px;padding-right: 30px;line-height: normal;margin-right:5px'>친구 목록</button><br>";        	
        }
    }
    member.innerHTML += "<br><button onclick=allCheck() style='WIDTH:342px;margin-bottom:30px'>전체 출력</button>";
    member.innerHTML += "<a onclick='next2()' style='position:absolute; clear:left; float:left; right:0; bottom:0px;font-size: 20px;display: flex;align-items: center;padding-bottom:12px'><span style='padding-right:10px'>next</span><img src='images/nexticon.png' width=40 hight=40></a>";
}
var namenum = null;
function changeName(num){
	namenum = num;
	var name = prompt('변경할 이름을 입력하세요');
	if(name!=null){
		setName(name);		
	}
}
function setName(name){
	userName[namenum] = name;
	var nameSet = document.getElementById("name"+namenum);
	nameSet.innerHTML = name;
}

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



// 지도가 이동, 확대, 축소로 인해 중심좌표가 변경되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'center_changed', function() {

    // 지도의  레벨을 얻어옵니다
    levelStay = map.getLevel();
    // 지도의 중심좌표를 얻어옵니다 
    latlngStay = map.getCenter(); 

});

checkListLat = [];
checkListLng = [];


function check(num){ // 지도를 표시할 div 
	mapOption = { 
	        center: new kakao.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
	        level: levelStay // 지도의 확대 레벨
	    };
	map1.innerHTML = null;
	map = new kakao.maps.Map(mapContainer, mapOption);
	hideMarkers();
	console.log(num);
    // 지도를 클릭한 위치에 표출할 마커입니다
    var marker = new kakao.maps.Marker(); 
    // 지도에 마커를 표시합니다
    marker.setMap(map);
	markers[num] = marker;
    // 지도에 클릭 이벤트를 등록합니다
    // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
        
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
        
        // 마커 위치를 클릭한 위치로 옮깁니다
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
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(address, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
            map.panTo(coords);
            centerLat = coords.getLat();
            centerLng = coords.getLng();
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
            markers[addnum] = marker;
            checkListLat[addnum] = coords.getLat();
            checkListLng[addnum] = coords.getLng();
            console.log(coords.getLat());
            console.log(coords.getLng());
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        } else{
            alert("주소를 다시 입력해주세요")
        }
    });

    kakao.maps.event.addListener(map, 'center_changed', function() {

        // 지도의  레벨을 얻어옵니다
        levelStay = map.getLevel();
        // 지도의 중심좌표를 얻어옵니다 
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
	        		tr.innerHTML += "<td><button onclick='friendAdd(" + i + ")'>선택</button></td>";
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
    var moveLatLon = new kakao.maps.LatLng(avgLat, avgLng) // 지도의 중심좌표
    map.panTo(moveLatLon);

    var imageSrc = 'images/marker_center.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
    showMarkers();
    for(let i = 0; i < checkListLat.length; i++){
        // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
        var linePath = [
            new kakao.maps.LatLng(checkListLat[i], checkListLng[i]),
            new kakao.maps.LatLng(avgLat, avgLng)
        ];

        // 지도에 표시할 선을 생성합니다
        var polyline = new kakao.maps.Polyline({
            path: linePath, // 선을 구성하는 좌표배열 입니다
            strokeWeight: 2, // 선의 두께 입니다
            strokeColor: 'red', // 선의 색깔입니다
            strokeOpacity: 0.3, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
            strokeStyle: 'solid' // 선의 스타일입니다
        });

        // 지도에 선을 표시합니다 
        polyline.setMap(map);
		lines[i] = polyline;
        var userImg = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw7m8AVV6GWpD6jp61UTPUQCYBn2yBLuujsg&usqp=CAU";
        var iwContent = '<div class ="label"><span class="left" ></span><span class="center" style="padding:1px"><img src='+userImg+' width=14px hight=14px style="padding-top:5px; padding-right:4px">'+userName[i]+'</span><span class="right"></span></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
            iwPosition = new kakao.maps.LatLng(checkListLat[i], checkListLng[i]); //인포윈도우 표시 위치입니다
        var customOverlay = new kakao.maps.CustomOverlay({
            position: iwPosition,
            content: iwContent   
        });

        // 커스텀 오버레이를 지도에 표시합니다
        customOverlay.setMap(map);
        customOverlays[i] = customOverlay;
        }

    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
    var markerPosition  = new kakao.maps.LatLng(avgLat, avgLng);
    var marker = new kakao.maps.Marker({
        position: markerPosition,
        image: markerImage
    });
    var circle = new kakao.maps.Circle({
        center : new kakao.maps.LatLng(avgLat, avgLng),  // 원의 중심좌표 입니다 
        radius: 1500, // 미터 단위의 원의 반지름입니다 
        strokeWeight: 0, // 선의 두께입니다 
        strokeColor: '#75B8FA', // 선의 색깔입니다
        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'dashed', // 선의 스타일 입니다
        fillColor: '#CFE7FF', // 채우기 색깔입니다
        fillOpacity: 0.5  // 채우기 불투명도 입니다   
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
	        center: new kakao.maps.LatLng(centerLat, centerLng), // 지도의 중심좌표
	        level: levelStay // 지도의 확대 레벨
	    };
	    map1.innerHTML = null;
	    map = new kakao.maps.Map(mapContainer, mapOption);
	
	    var imageSrc = 'images/marker_center.png', // 마커이미지의 주소입니다    
	    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
	    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	
	    // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
	    var markerPosition  = new kakao.maps.LatLng(centerLat, centerLng);
	    var marker = new kakao.maps.Marker({
	        position: markerPosition,
	        image: markerImage
	    });
	    var circle = new kakao.maps.Circle({
	        center : new kakao.maps.LatLng(centerLat, centerLng),  // 원의 중심좌표 입니다 
	        radius: 1500, // 미터 단위의 원의 반지름입니다 
	        strokeWeight: 0, // 선의 두께입니다 
	        strokeColor: '#75B8FA', // 선의 색깔입니다
	        strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'dashed', // 선의 스타일 입니다
	        fillColor: '#CFE7FF', // 채우기 색깔입니다
	        fillOpacity: 0.5  // 채우기 불투명도 입니다   
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
	            		pointScore[i] = "★ "+res[i][1];
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
			    	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png", // 마커이미지의 주소입니다    
			        imageSize = new kakao.maps.Size(24, 35), // 마커이미지의 크기입니다			  
			        imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			    	 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
			        var markerPosition  = new kakao.maps.LatLng(pointLat[i], pointLng[i]);
			        var marker = new kakao.maps.Marker({
			            position: markerPosition,
			            image : markerImage 
			        });
			        marker.setMap(map);
			    }
			    member.innerHTML = '<a style="font-size: 20px;padding:20px">모일 장소를 정해주세요</a>';
			    member.innerHTML += '<ul id=ul></ul>';
			    var list = document.getElementById("ul");
			    for(let i = 0; i < pointLat.length; i++){
			    	list.innerHTML += '<li style="text-align: right;"><a id = finally'+(i+1)+' onclick=marketList('+i+')><p style="font-size: 25px;margin-bottom: 0px;color: rgba(255, 255, 255, 0.9)">'+pointName[i]+'</p>'+pointCtg[i]+" <span style='color:yellow'>"+pointScore[i]+'</span></a></li>';
			    }
	        },
	        error:function(){
	            alert("실패 ㅜㅜ")
	        }
	        
	    })
	}else{
		alert("모든 인원의 위치를 알려주세요!")
	}
}

function marketList(num){
	hideMarkers();
    
    
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(pointLat[num], pointLng[num])
	});

	// 커스텀 오버레이에 표시할 컨텐츠 입니다
	// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
	// 별도의 이벤트 메소드를 제공하지 않습니다 
	var content = '<div class="wrap faid">' + 
	            '    <div class="info">' + 
	            '        <p class="title" style="font-size=15px">' + 
	                         pointName[num] + 
	            '            <div class="close" onclick="next3()" title="닫기"><span style="padding-right:5px">NEXT</span><img src="images/nexticon_1.png" width=20 hight=20></div>' + 
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

	// 마커 위에 커스텀오버레이를 표시합니다
	// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
	var overlay = new kakao.maps.CustomOverlay({
	    content: content,
	    position: marker.getPosition()       
	});
	overlay.setMap(map);
	overlays[0] = overlay;
	selectMarket = num;
}

function next3(){
	member.innerHTML = '<a style="font-size: 20px;padding:20px">약속 시간을 정해주세요</a>';
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
	member.innerHTML = '<div id = finally1 style="font-size:35px">새로운 약속이<br>등록되었습니다.<div><br>';
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
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(goalLat, goalLng), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(goalLat, goalLng); 

	// 마커를 생성합니다
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
	            alert("실패 ㅜㅜ")
	        }
	        
	    })
	}
}
</script>
</body>
</html>