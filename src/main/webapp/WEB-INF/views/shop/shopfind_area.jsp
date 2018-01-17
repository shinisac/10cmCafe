<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
 

<html>
<head>

<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1, minimum-scale=1, maximum-scale=2, user-scalable=no">
<title>10Cm_CAFE</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<c:if test="${empty sessionScope.id }">
<script>
alert('로그인이 필요한 페이지입니다.');
location.href='loginForm.do';   
</script>
</c:if> 
<style>

.btn{c 
/* 	-moz-box-shadow: 2px 3px 2px -1px #a88f65;
	-webkit-box-shadow: 2px 3px 2px -1px #a88f65;
	box-shadow: 2px 3px 2px -1px #a88f65; */
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f0e2bb', endColorstr='#d6c8a1',GradientType=0);
	background-color:#f0e2bb;
	-moz-border-radius:7px;
	-webkit-border-radius:7px;
	border-radius:7px;
	border:1px solid #d6c8a1;
	display:inline-block;
	cursor:pointer;
	color:#D6C8A1;
	font-family:Arial;
	font-size:16px;
	font-weight:bold;
	padding:5px 8px;
	text-decoration:none;
	margin-right: 10px;
      }
.btn:active{
        /*눌렸을 때 그림자와 안눌렸을 때 그림자의 픽셀 차이만큼 이동!!*/
        transform:translateY(3px);
      }
body {
	margin: 0px auto;
	background-color: #f7f7f7;
}
.tab_menu_area{
 display:inline-block;
 position:relative;
 cursor:default;
 width: 100%;
 margin: 0px auto;
}
.white_content {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: rgba(0, 0, 0, 0.8);
	opacity: 0;
	-webkit-transition: opacity 200ms ease-in;
	-moz-transition: opacity 200ms ease-in;
	transition: opacity 200ms ease-in;
	pointer-events: none;
}

.white_content:target {
	opacity: 1;
	pointer-events: auto;
}

.white_content>div {
	position: absolute;
	top: 5%;
	margin: auto;
}
#areaid li{
	list-style-type: none;
	display: inline;
	border: 0px solid #c0c0c0;
}
#areaid ul {
	text-align: center;
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color:#D6C8A1;
    width: 100%;
    display: block;
}
   #areaid li a{
   
    color: white;
    text-align: center;
    padding: 16px 0px 16px 0px;
    text-decoration: none;
    background-color: #D6C8A1;
    width: 100%;
    float: left;
    border-bottom: 1px solid white;

}

#areaid li a:hover{
    background-color: #C4B68F;
}

.active a{
	font-weight: bold;
	background-color:#f7f7f7;
	color: #C4B68F;

}
#sidotbl{
 	margin: 5px 2.5% 0px 2.5%;
 	width: 95%;
 	height: 200px;
 	background-color: #fff;
 	 	border-collapse: collapse;
}
#sidotbl td{
 	text-align: center;
 	border:5px solid #f7f7f7;

 	
}
#sidotbl td:hover{
 	text-align: center;
 	background-color: #C4B68F;
}
#sidotbl a{
 	text-decoration: none;
 	font-size: 14;
 	color: #898785;
 	font-weight: bold;
	width: 100%;
	height: 100%;
 	display: inline-block;
 	padding-top: 10px;
}
.area a{
	font-weight: bold;
	background-color:#f7f7f7;
	color: #C4B68F;
 	
}

.contenttable{
	background-color: #fff;
 	width: 95%;
 	height: 150px;
 	margin: 0 2.5% 0 2.5%;
 	margin-bottom: 3px;
 	border-top: 1px solid lightgray;
 	
}

H5{
	color: #898785;
	margin: 20px 30px;
}
.main{
	border-bottom:5px solid #f7f7f7;
	width: 100%;
	height: 100%;
}
#submits{
	   border: none; /*---테두리 정의---*/
	   background-Color: #D6C8A1; /*--백그라운드 정의---*/
	   font: 12px 굴림; /*--폰트 정의---*/
	   font-weight: bold; /*--폰트 굵기---*/
	   color: white; /*--폰트 색깔---*/
	   width: 50px;
	   height: 30px; /*--버튼 크기---*/
	   border-radius: 10px;
}
#submit{
	   border: none; /*---테두리 정의---*/
	   background-Color: #D6C8A1; /*--백그라운드 정의---*/
	   font: 12px 굴림; /*--폰트 정의---*/
	   font-weight: bold; /*--폰트 굵기---*/
	   color: white; /*--폰트 색깔---*/
	   width: 50px;
	   height: 30px; /*--버튼 크기---*/
	   border-radius: 10px;
}
#searchdiv{
	float: right;
}
#maps{
	margin: 0px auto;
}
#tabletd{
	border: none;
}
.contenttable td{
 	color: #898785;
 	font-weight: bold;
 	padding-left: 10px;
 	}
.tab_menu_area main{
	width: 100%;
} 	
#address{
	border-radius: 10px;
	border: 1px solid lightgray;
}
#name{
	border-radius: 10px;
	border: 1px solid lightgray;
}

#898785

</style>
<script src="js/httpRequest.js"></script>
<script>
//즐겨찾기 추가및 삭제
function bookMarkAdd(shop_idx,chk){
   
   sendRequest('bookMarkAdd.do','shop_idx='+shop_idx,bookMarkAddResult,'GET');
    
 
    if(chk==0){
        $('#b_'+shop_idx).attr('src','img/star1.jpg');
        $('#a_'+shop_idx).attr('onClick','bookMarkAdd('+shop_idx+',1)');
     }
      if(chk==1)   {
        $('#b_'+shop_idx).attr('src','img/star0.jpg');
        $('#a_'+shop_idx).attr('onClick','bookMarkAdd('+shop_idx+',0)');   
     }
}

function bookMarkAddResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;
         
         
         //alert(data);
         //var str=document.all.bookMarkForm;
         //str.innerHTML=data;

      }
   }
}
	function allshow(){
		var param = 'addr=' + ' ';

		sendRequest('search_area.do', param, allshowResult, 'GET');
	}
	
	function areashow(addr) {//요청함수

		var param = 'addr=' + addr;

		sendRequest('search_area.do', param, areashowResult, 'GET');
	}
	
	function allshowResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var divs = '';

				var key='';
				var check = new Array();
				
				<c:forEach  var="item" items="${check}">

				check.push("${item}");

				</c:forEach>
				
				
				if (data.trim() == 'no') {

					//document.getElementById('shopList').innerHTML="검색된 매장이 없습니다.";
					divs += '<table class="contenttable"><tr><td align="center"> 검색된 매장이 없습니다.</td></tr></table>';
				} else {
					var shopData = eval('(' + data + ')');//eval()은 텍스트를 객체로 변환,안쪽에 소콸호 입력

					for (var i = 0; i < shopData.nfc_shop.length; i++) {
						divs += '<table class="contenttable">';

						divs += '<tr>';
						divs += '<td width="80%">지점명 : '
								+ shopData.nfc_shop[i].shop_name + '</td>';
						//divs+='<td rowspan="3"><input type="button" value="지도"></td>';
						divs += '<td rowspan="4" width="20%"><a href="javascript:;" onclick="lookshop('
								+ shopData.nfc_shop[i].shop_idx
								+ ');">지도</a>';
								
								if(check.length==0){
									key='<a id= "a_'+shopData.nfc_shop[i].shop_idx+'" href="javascript:;" onClick="bookMarkAdd('+shopData.nfc_shop[i].shop_idx+',0)"><img id= "b_'+shopData.nfc_shop[i].shop_idx+'" src="img/star0.jpg" width="20" height="20"></a></td>';
									
								}
							
								for(var j=0; j<check.length; j++){
								if(shopData.nfc_shop[i].shop_idx==check[j]){
									
									key='<a id= "a_'+shopData.nfc_shop[i].shop_idx+'" href="javascript:;" onClick="bookMarkAdd('+shopData.nfc_shop[i].shop_idx+',1)"><img id= "b_'+shopData.nfc_shop[i].shop_idx+'" src="img/star1.jpg" width="20" height="20"></a></td>';
									
									break;
								}else{
										
									key='<a id= "a_'+shopData.nfc_shop[i].shop_idx+'" href="javascript:;" onClick="bookMarkAdd('+shopData.nfc_shop[i].shop_idx+',0)"><img id= "b_'+shopData.nfc_shop[i].shop_idx+'" src="img/star0.jpg" width="20" height="20"></a></td>';
									
								}
					
							
								}	
								
						divs += key;		
						divs += '</tr>';
						divs += '<tr>'; 
						divs += '<td>주소 : ' + shopData.nfc_shop[i].shop_area
								+ '<br>' + shopData.nfc_shop[i].shop_addr
								+ '</td>';

						divs += '</tr>';
						divs += '<tr>';
						divs += '<td>PHONE : ' + shopData.nfc_shop[i].shop_tel
								+ '</td>';
						divs += '</tr>';
						divs += '<tr>';
						divs += '<td><a class="btn color" href="shopInfo.do?shop_idx='+ shopData.nfc_shop[i].shop_idx+'">상세보기</a><a class="btn color" href="shop_menuList.do?shop='+ shopData.nfc_shop[i].shop_idx+'">주문하기</a></td>';
						divs += '</tr>';						
						divs += '</table>';
					}
				}

				document.getElementById('areashopList').innerHTML = divs;
				document.getElementById('shopList').innerHTML = divs;
				
			}
		}
	}
	function areashowResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var divs = '';

				if (data.trim() == 'no') {

					//document.getElementById('shopList').innerHTML="검색된 매장이 없습니다.";
					divs += '<table id="areatable" class="contenttable"><tr><td align="center"> 검색된 매장이 없습니다.</td></tr></table>';
				} else {
					var shopData = eval('(' + data + ')');//eval()은 텍스트를 객체로 변환,안쪽에 소콸호 입력

					for (var i = 0; i < shopData.nfc_shop.length; i++) {
						divs += '<table class="contenttable">';

						divs += '<tr>';
						divs += '<td width="80%">지점명 : '
								+ shopData.nfc_shop[i].shop_name + '</td>';
						//divs+='<td rowspan="3"><input type="button" value="지도"></td>';
						divs += '<td rowspan="4" width="20%"><a href="javascript:;" onclick="lookshop('
								+ shopData.nfc_shop[i].shop_idx
								+ ');">지도</a></td>';
						divs += '</tr>';
						divs += '<tr>'; 
						divs += '<td>주소 : ' + shopData.nfc_shop[i].shop_area
								+ '<br>' + shopData.nfc_shop[i].shop_addr
								+ '</td>';

						divs += '</tr>';
						divs += '<tr>';
						divs += '<td>PHONE : ' + shopData.nfc_shop[i].shop_tel
								+ '</td>';
						divs += '</tr>';
						divs += '<tr>';
						divs += '<td align="center"><a class="btn color" href="shopInfo.do?shop_idx='+ shopData.nfc_shop[i].shop_idx+'">상세보기</a><a class="btn color" href="shop_menuList.do?shop='+ shopData.nfc_shop[i].shop_idx+'">주문하기</a></td>';
						divs += '</tr>';							
						divs += '</table>';
					}
				}

				document.getElementById('areashopList').innerHTML = divs;
				
			}
		}
	}
	$(document).ready(function() {
		/* tab */
		
		allshow();
		
		$(".tab_menu li a").click(function(e) {

		
			var nowIndex = $(".tab_menu li a").index(this);
			var tab_con = $(".tab_con");
			tab_con.css("display", "none");
			tab_con.eq(nowIndex).show();
			$(".tab_menu li").removeClass("active");
			$(".tab_menu li").eq(nowIndex).addClass("active");
			e.preventDefault();
		});

	});
</script>
<script>
	function show() {//요청함수
		var shopname = document.getElementById("name").value;
		var param = 'name=' + shopname;

		sendRequest('search_name.do', param, showResult, 'GET');
	}

	function showResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var divs = '';

				if (data.trim() == 'no') {

					//document.getElementById('shopList').innerHTML="검색된 매장이 없습니다.";
					divs += '<table class="contenttable"><tr><td align="center"> 검색된 매장이 없습니다.</td></tr></table>';
				} else {
					var shopData = eval('(' + data + ')');//eval()은 텍스트를 객체로 변환,안쪽에 소콸호 입력

					for (var i = 0; i < shopData.nfc_shop.length; i++) {
						divs += '<table class="contenttable">';

						divs += '<tr>';
						divs += '<td width="80%">지점명 : '
								+ shopData.nfc_shop[i].shop_name + '</td>';
						//divs+='<td rowspan="3"><input type="button" value="지도"></td>';
						divs += '<td rowspan="4" width="20%" id="tabletd"> <a href="javascript:;" onclick="lookshop('
								+ shopData.nfc_shop[i].shop_idx
								+ ');">지도</a></td>';
						divs += '</tr>';
						divs += '<tr>';
						divs += '<td>주소 : ' + shopData.nfc_shop[i].shop_area
								+ '<br>' + shopData.nfc_shop[i].shop_addr
								+ '</td>';

						divs += '</tr>';
						divs += '<tr>';
						divs += '<td>PHONE : ' + shopData.nfc_shop[i].shop_tel
								+ '</td>';
						divs += '</tr>';
						divs += '<tr>';
						divs += '<td><a class="btn color" href="shopInfo.do?shop_idx='+ shopData.nfc_shop[i].shop_idx+'">상세보기</a><a class="btn color" href="shop_menuList.do?shop='+ shopData.nfc_shop[i].shop_idx+'">주문하기</a></td>';
						divs += '</tr>';							
						divs += '</table>';
					}
				}

				document.getElementById('shopList').innerHTML = divs;
			}
		}
	}
</script>
<script>
	function gopage(idx) {
		alert('매장의 주문페이지로 이동합니다.');
		location.href="shop_menuList.do?shop="+ idx;

	}
</script>
</head>

<!-- Meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Title -->
<title>Soup - Restaurant with Online Ordering System Template</title>

<!-- Favicons -->
<link rel="shortcut icon" href="assets/img/favicon.png">
<link rel="apple-touch-icon" href="assets/img/favicon_60x60.png">
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/favicon_76x76.png">
<link rel="apple-touch-icon" sizes="120x120" href="assets/img/favicon_120x120.png">
<link rel="apple-touch-icon" sizes="152x152" href="assets/img/favicon_152x152.png">

<!-- CSS Plugins -->
<link rel="stylesheet" href="assets/plugins/bootstrap/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/plugins/slick-carousel/slick/slick.css" />
<link rel="stylesheet" href="assets/plugins/animate.css/animate.min.css" />
<link rel="stylesheet" href="assets/plugins/animsition/dist/css/animsition.min.css" />

<!-- CSS Icons -->
<link rel="stylesheet" href="assets/css/themify-icons.css" />
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />

<!-- CSS Theme -->
<link id="theme" rel="stylesheet" href="assets/css/themes/theme-beige.min.css" />

</head>

<body>

<!-- Body Wrapper -->
<div id="body-wrapper" class="animsition">
<%@include file="/in/header.jsp" %>
    <!-- Content -->
    <div id="content" class="bg-light">

        <!-- Post / Single -->
        <article class="post single">
            <div class="post-image bg-parallax"><img src="assets/img/posts/post01_lg.jpg" alt=""></div>
            <div class="container container-md">
                <div class="post-content">
                   
<!-- 지역별 검색 시작 -->
	<div id="areaid">
      <ul id="areaid" class="tab_menu">
         <li class="active"><a href="javascript:;">지역별</a></li>
         <li><a href="javascript:;">매장명</a></li>
         <li><a href="javascript:;">지도검색</a></li>
      </ul>
   </div>
	<div class="tab_con main">
		<div>
			<br>
			<h5 align="center">지역을 선택해주세요.</h5>
			<table summary="서울,경기.제주" class="" id="sidotbl">
				<colgroup>
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: 25%;" />
					<col style="width: 25%;" />

				</colgroup>
				<tr>
					<td><a href="javascript:;" onClick="areashow('서울')" class="area">서울</a></td>
					<td><a href="javascript:;" onClick="areashow('인천')">인천</a></td>
					<td><a href="javascript:;" onClick="areashow('경기')">경기</a></td>
					<td><a href="javascript:;" onClick="areashow('대전')">대전</a></td>

				</tr>
				<tr>
					<td><a href="javascript:;" onClick="areashow('세종')">세종</a></td>
					<td><a href="javascript:;" onClick="areashow('충청')">충청</a></td>
					<td><a href="javascript:;" onClick="areashow('대구')">대구</a></td>
					<td><a href="javascript:;" onClick="areashow('경상')">경상</a></td>

				</tr>
				<tr>
					<td><a href="javascript:;" onClick="areashow('울산')">울산</a></td>
					<td><a href="javascript:;" onClick="areashow('부산')">부산</a></td>
					<td><a href="javascript:;" onClick="areashow('광주')">광주</a></td>
					<td><a href="javascript:;" onClick="areashow('전라')">전라</a></td>
				</tr>
				<tr>
					<td><a href="javascript:;" onClick="areashow('강원')">강원</a></td>
					<td><a href="javascript:;" onClick="areashow('제주')">제주</a></td>
					<td colspan="2"></td>
				</tr>
			</table>
		</div>
		<br>
		<div>
			<table width="100%">
				<tr>
					<td id="areashopList" width="100%"></td>
				</tr>
			</table>
		</div>


	</div>
	<!-- 지역별 검색 끝-->
	<!-- 매장명 검색 시작 -->
	<div class="tab_con" style="display: none;">
		<!-- 검색DIV -->
		<br>
		<div id="searchdiv">
			<input type="text" id="name" name="name">
			<input type="button" value="검색" onClick="show()" id="submit">
		</div>
		<br><br>
		<div>
			<table width="100%">

				<tr>
					<td id="shopList" width="100%"></td>
				</tr>
			</table>
		</div>
	</div>
	<!-- 매장명 검색 끝 -->
	<!-- 지도 검색 시작 -->
	<div class="tab_con" style="display: none;">
	<br>
		<div class="search" align="right">
			<input id="address" type="text" placeholder="검색할 주소" value="역삼">
			<input id="submits" type="button" value="검색">
			<label style="margin-left: 20px;"><b id="serchtxt"> </b></label>
		</div>
		<br>
		<div id="maps" style="width: 650px; height: 400px;" align="center">
			<script type="text/javascript"
				src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8WStogCDUynVUNDduy5&submodules=geocoder"></script>
			<script type="text/javascript">
				// 지도 생성과 컨트롤 배치 시작
				$(window).on(
						'load',
						function() {
							var newSize = new naver.maps.Size(
									$(window).width(), $(window).height());

							map.setSize(newSize);
						});

				var mapOptions = {
					mapTypeId : naver.maps.MapTypeId.TERRAIN,
					//tileSize: new naver.maps.Size(50, 128),
					center : new naver.maps.LatLng(37.500742, 127.036925),
					zoom : 10,

					lngoControl : false,
					mapDataControl : false,

				};

				var maps = new naver.maps.Map('maps', mapOptions);

				maps.setCursor('pointer');//지도 위에서의 커서 모양은 'pointer'
				//------검색하고자하는 주소에 따른 결과 출력 문장 시작 ----		
				function addrSearch(address) {
					naver.maps.Service
							.geocode(
									{
										address : address
									},
									function(status, response) {
										if (status !== naver.maps.Service.Status.OK) {
											return alert('정확한 주소를 입력해주세요.');
										}

										var item = response.result.items[0], point = new naver.maps.Point(
												item.point.x, item.point.y);

										maps.setCenter(point);
									});
				}

				function initGeocoder() {

					$('#address').on(
							'keydown',
							function(e) {
								var keyCode = e.which;
								
								if (keyCode === 13) { // Enter Key
									addrSearch($('#address').val());
									var txt = $('#address').val();
									$('#serchtxt').html(
											"<b>      '" + txt
													+ "'에 대한 검색결과</b>");
								}
							});
					//id가 submit인 태그가 클릭됬을경우 실행!	
					$('#submits').on(
							'click',
							function(e) {
								e.preventDefault();

								addrSearch($('#address').val());
								var txt = $('#address').val();
								$('#serchtxt').html(
										"<b>      '" + txt + "'에 대한 검색결과</b>");
							});

					addrSearch('역삼');
				}

				naver.maps.onJSContentLoaded = initGeocoder;
				//------검색하고자하는 주소에 따른 결과 출력 문장 끝 ----	

				//------DB의 내용을 지도상에 뿌려주는 문장 시작----		
				var markers = [];
				var infoWindows = [];
				var i = 0;

				//--DB의 내용을 가져오기 위한 반복문 시작 --
				<c:forEach items="${shoplist}" var="mapslist" >

				var name = '${mapslist.shop_name}';
				var lat = '${mapslist.shop_lat}';
				var lng = '${mapslist.shop_lng}';
				var addr = '${mapslist.shop_addr}';
				var area = '${mapslist.shop_area}';
				var img = '${mapslist.shop_img}';
				var idxs = '${mapslist.shop_idx}';
				var tel = '${mapslist.shop_tel}';

				var markerOptions = {
					title : name,
					position : new naver.maps.LatLng(lat, lng),
					map : maps

				};

				markers[i] = new naver.maps.Marker(markerOptions);
				// 깃발(마커) 정보창 내용과 디자인 시작
				var contentString = [
					'<div style="cursor:pointer;"onClick="gopage(${mapslist.shop_idx})">',
					'<table style="width:400px">',
					'	<tr>',
					'		<td colspan="2" style="background-color:black;color:white;padding-left:5px;font-size:20px;height:45px;">'+name+'',
					'		</td>',
					'	</tr>',
					'	<tr>',
					'		<td rowspan="2" style="padding-left:5px;height:80px; padding:5px;">',
					'			 <img src="img/shop/shop'+idxs+'.jpg" style="width:70px;height:55px;">',
					'		</td>',
					'		<td style="font-size:13px;">',
					'			<svg class="icon" role="presentation" version="1.1" width="17" height="19" viewBox="0 0 17 19"><path fill="#9E9E9E" d="M8.501,5.697c0.991,0,1.797,0.808,1.797,1.801c0,0.992-0.806,1.798-1.797,1.798 	c-0.991,0-1.797-0.807-1.797-1.798C6.704,6.506,7.51,5.697,8.501,5.697 M8.501,4.498c-1.654,0-2.997,1.343-2.997,3.001 	c0,1.655,1.342,2.999,2.997,2.999c1.654,0,2.997-1.343,2.997-2.999C11.498,5.841,10.154,4.498,8.501,4.498L8.501,4.498z M8.501,1.2 	c3.473,0.002,6.3,2.832,6.3,6.308c0,1.171-0.326,2.312-0.943,3.306L8.5,17.143l-5.357-6.328C2.525,9.816,2.199,8.675,2.199,7.509 	C2.201,4.032,5.028,1.202,8.501,1.2 M8.501,0C4.366,0.002,1.001,3.37,0.999,7.508c0,1.421,0.406,2.811,1.173,4.017L8.5,19 	l6.328-7.475c0.769-1.205,1.172-2.591,1.172-4.017C16,3.37,12.636,0.002,8.501,0L8.501,0z"></path></svg>'+area+' '+addr+'',
					'		</td>',
					'	</tr>',
					'	<tr>',
					'		<td>',
					'			<svg class="icon" role="presentation" version="1.1" width="17" height="19" viewBox="0 0 17 19"><path fill="#9E9E9E" d="M13.309,16.492l-0.314-0.062C6.572,15.15,1.596,10.172,0.316,3.745L0.254,3.431L3.682,0l5.095,5.09 L6.494,7.371c0.755,1.186,1.763,2.185,2.949,2.925l2.271-2.27l5.033,5.029L13.309,16.492z M1.559,3.822 c1.258,5.694,5.668,10.106,11.358,11.364l2.132-2.132l-3.336-3.332L9.655,11.78l-0.387-0.194c-1.712-0.962-3.098-2.341-4.052-4.01 L4.989,7.179L7.078,5.09L3.682,1.697L1.559,3.822z"></path></svg>'+tel+'',
					'		</td>',
					'	</tr>',
					'</table>',
					'</div>'].join('');

				var infoWindow = new naver.maps.InfoWindow({
					content : contentString,
					maxWidth : 400,
					anchorSize : new naver.maps.Size(8, 8),
					anchorSkew : false,
					anchorColor : "#eee",
					pixelOffset : new naver.maps.Point(0, 0)
				});

				infoWindows.push(infoWindow);
				i++;
				</c:forEach>
				//------DB의 내용을 지도상에 뿌려주는 문장 끝----	

				// 해당 마커의 고유인덱스를 seq라는 클로저 변수로 저장하는 이벤트 핸들러를 반환합니다.
				function getClickHandler(markIdx) {
					return function(e) {
						var markertmp = markers[markIdx];
						infoWindow = infoWindows[markIdx];

						if (infoWindow.getMap()) {
							infoWindow.close();
						} else {
							infoWindow.open(maps, markertmp);
						}
					}
				}

				for (var i = 0, ii = markers.length; i < ii; i++) {
					naver.maps.Event.addListener(markers[i], 'click',
							getClickHandler(i));
							
				}

				// 정보창 호출과 닫기 기능 끝

				// 지도 생성과 컨트롤 배치 끝
			</script>
		</div>
		
	</div>
	<!-- 지도 검색 끝 -->
	<div class="white_content" id="open" onClick="location.href='#close'">

		<div id="map" style="width: 90%; height: 90%;">
			<script type="text/javascript"
				src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8WStogCDUynVUNDduy5&submodules=geocoder"></script>
			<script type="text/javascript">
				var mapdiv = document.getElementById('map');
				// 지도 생성과 컨트롤 배치 시작
				/* 		$(window).on(
				 'load',
				 function() {
				 var newSize = new naver.maps.Size($(window).width(), $(
				 window).height());

				 map.setSize(newSize);
				 });   */
				var position = new naver.maps.LatLng(37.500742, 127.036925);
				var mapOptions = {
					mapTypeId : naver.maps.MapTypeId.TERRAIN,
					//tileSize: new naver.maps.Size(50, 128),
					center : position,
					zoom : 15,

					lngoControl : false,
					mapDataControl : false,

				};

				var map = new naver.maps.Map(mapdiv, mapOptions);

				map.setCursor('pointer');//지도 위에서의 커서 모양은 'pointer'
				var marker = new naver.maps.Marker({
					position : position,
					map : map
				});
				function lookshop(idx) {
					var param = 'idx=' + idx;
					sendRequest('lookshop.do', param, showmap, 'GET');
					location.href = '#open';
				}
				function showmap() {
					if (XHR.readyState == 4) {
						if (XHR.status == 200) {
							var data = XHR.responseText;
							if (data.trim() == 'no') {
								return;
							}
							var shopData = eval('(' + data + ')');
							var shoplat = shopData.nfc_shop[0].shop_lat;
							var shoplng = shopData.nfc_shop[0].shop_lng;
							position = new naver.maps.LatLng(shoplat, shoplng);
							map.setCenter(position);
							marker.setPosition(position);
						}
					}
				}
			</script>
		</div>

	</div>
                </div>
            </div>
        </article>

 <%@include file="/in/footer.jsp" %>
 <%@include file="/in/cart.jsp" %>
        <!-- Footer / End -->

    </div>
    <!-- Content / End -->

  
    <!-- Panel Mobile -->
    <nav id="panel-mobile">
        <div class="module module-logo bg-dark dark">
            <a href="javascript:;">
                <img src="assets/img/logo-light.svg" alt="" width="88">
            </a>
            <button class="close" data-toggle="panel-mobile"><i class="ti ti-close"></i></button>
        </div>
        <nav class="module module-navigation"></nav>
        <div class="module module-social">
            <h6 class="text-sm mb-3">Follow Us!</h6>
            <a href="javascript:;" class="icon icon-social icon-circle icon-sm icon-facebook"><i class="fa fa-facebook"></i></a>
            <a href="javascript:;" class="icon icon-social icon-circle icon-sm icon-google"><i class="fa fa-google"></i></a>
            <a href="javascript:;" class="icon icon-social icon-circle icon-sm icon-twitter"><i class="fa fa-twitter"></i></a>
            <a href="javascript:;" class="icon icon-social icon-circle icon-sm icon-youtube"><i class="fa fa-youtube"></i></a>
            <a href="javascript:;" class="icon icon-social icon-circle icon-sm icon-instagram"><i class="fa fa-instagram"></i></a>
        </div>
    </nav>

    <!-- Body Overlay -->
    <div id="body-overlay"></div>

</div>

<!-- JS Plugins -->
<script src="assets/plugins/jquery/dist/jquery.min.js"></script>
<script src="assets/plugins/tether/dist/js/tether.min.js"></script>
<script src="assets/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/plugins/slick-carousel/slick/slick.min.js"></script>
<script src="assets/plugins/jquery.appear/jquery.appear.js"></script>
<script src="assets/plugins/jquery.scrollto/jquery.scrollTo.min.js"></script>
<script src="assets/plugins/jquery.localscroll/jquery.localScroll.min.js"></script>
<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="assets/plugins/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.min.js"></script>
<script src="assets/plugins/twitter-fetcher/js/twitterFetcher_min.js"></script>
<script src="assets/plugins/skrollr/dist/skrollr.min.js"></script>
<script src="assets/plugins/animsition/dist/js/animsition.min.js"></script>

<!-- JS Core -->
<script src="assets/js/core.js"></script>

</body>

</html>