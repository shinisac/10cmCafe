<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Insert title here</title>
<style>
	#search{
		float: left; 
		border: 1px solid black;
		height: 400px;
		width: 300px;
	}
	#search div{
		border: 1px solid red;
	}
	#mapcontent{
		float: left;
		border: 1px solid black;
		height: 400px;
		width: 700px;
	}
	.search #address {
	width: 150px;
	height: 20px;
	line-height: 20px;
	border: solid 1px #555;
	padding: 5px;
	font-size: 12px;
	box-sizing: content-box;
}

.search #submit {
	height: 30px;
	line-height: 30px;
	padding: 0 10px;
	font-size: 12px;
	border: solid 1px #555;
	border-radius: 3px;
	cursor: pointer;
	box-sizing: content-box;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script>
function show() {//요청함수
	var shopname = document.getElementById("address").value;
	var param = 'name=' + shopname;

	sendRequest('test_map.do', param, showResult, 'GET');
}

function showResult() {
	if (XHR.readyState == 4) {
		if (XHR.status == 200) {
			var data = XHR.responseText;
			var divs = '';
			document.getElementById('shopList').innerHTML = divs;
		}

			
	}
}

</script>
</head>
<body>
<div id="search">
	<div class="search">
		<input id="address" type="text" placeholder="검색할 주소" value="역삼"> <input
			id="submit" type="button" value="검색">
		<label style="margin-left: 20px;"><b id="serchtxt"> </b></label>	
	</div>

<div>
	내용2
</div>
</div>
<div id="mapcontent">
	<div id="map" style="width: 500px; height: 300px;">
		<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8WStogCDUynVUNDduy5&submodules=geocoder"></script>
		<script type="text/javascript">
			// 지도 생성과 컨트롤 배치 시작
			$(window).on(
					'load',
					function() {
						var newSize = new naver.maps.Size($('#mapcontent').width(), $('#mapcontent').height());

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

			var map = new naver.maps.Map('map', mapOptions);
			map.setCursor('pointer');//지도 위에서의 커서 모양은 'pointer'
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

									map.setCenter(point);
								});
			}


			function initGeocoder() {

				$('#address').on('keydown', function(e) {
					var keyCode = e.which;

					if (keyCode === 13) { // Enter Key
						addrSearch($('#address').val());
						var txt = $('#address').val();
						$('#serchtxt').html("<b>      '"+txt+"'에 대한 검색결과</b>");
					}
				});
				//id가 submit인 태그가 클릭됬을경우 실행!	
				$('#submit').on('click', function(e) {
					e.preventDefault();

					addrSearch($('#address').val());
					var txt = $('#address').val();
					$('#serchtxt').html("<b>      '"+txt+"'에 대한 검색결과</b>");
				});

				addrSearch('역삼');
			}

			naver.maps.onJSContentLoaded = initGeocoder;
			//------검색하고자하는 주소에 따른 결과 출력 문장 끝 ----	
			//------검색하고자하는 주소에 따른 결과 출력 문장 끝 ----	

			//------DB의 내용을 지도상에 뿌려주는 문장 시작----		
			var marker = [];
			var infoWindows = [];
			var i = 0;
			
			//--DB의 내용을 가져오기 위한 반복문 시작 --
			<c:forEach items="${shoplist}" var="mapslist" >
			
			var name = '${mapslist.shop_name}';
			var lat = '${mapslist.shop_lat}';
			var lng = '${mapslist.shop_lng}';
			var addr = '${mapslist.shop_addr}';
			
			var markerOptions = {
				title : name,
				position : new naver.maps.LatLng(lat, lng),
				map : map

			};

			marker[i] = new naver.maps.Marker(markerOptions);
			// 깃발(마커) 정보창 내용과 디자인 시작
			var contentString = [
					'<div class=""style="cursor:pointer;"onClick="gopage(${mapslist.shop_idx})">',
					'   <p style="text-align:center;">이미지 삽입 예정</p>',
					'   <p style="text-align:center;"><b> ' + name + '</b></p>',
					'   <p>정상좌표 : ' + lat + ', ' + lng + '<br />',
					'   </p>',
					'   <p style="text-align:center;"><b> ' + addr + '</b></p>',
					'</div>' ].join('');

			var infoWindow = new naver.maps.InfoWindow({
				content : contentString,
				maxWidth : 300,
				backgroundColor : "#eee",
				borderColor : "#000000",
				borderWidth : 3,
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
					var markertmp = marker[markIdx],
					// var markertmp = markers[seq],
					infoWindow = infoWindows[markIdx];

					if (infoWindow.getMap()) {
						infoWindow.close();
					} else {
						infoWindow.open(map, markertmp);
					}
				}
			}

			for (var i = 0, ii = marker.length; i < ii; i++) {
				naver.maps.Event.addListener(marker[i], 'click',
						getClickHandler(i));
			}
		</script>
	</div>
</div>
</body>
</html>