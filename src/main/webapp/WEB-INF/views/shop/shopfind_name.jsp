<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<style>
body {
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
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/httpRequest.js"></script>
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
					divs += '<table border="0"width="100%"><tr><td align="center"> 검색된 매장이 없습니다.</td></tr></table>';
				} else {
					var shopData = eval('(' + data + ')');//eval()은 텍스트를 객체로 변환,안쪽에 소콸호 입력

					for (var i = 0; i < shopData.nfc_shop.length; i++) {
						divs += '<table border="1" height="40%" width="100%">';

						divs += '<tr>';
						divs += '<td width="80%">지점명 : '
								+ shopData.nfc_shop[i].shop_name + '</td>';
						//divs+='<td rowspan="3"><input type="button" value="지도용"></td>';
						divs += '<td rowspan="3" width="20%"><a href="javascript:lookshop('
								+ shopData.nfc_shop[i].shop_idx
								+ ');">지도용</a></td>';
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
						divs += '</table>';
					}
				}

				document.getElementById('shopList').innerHTML = divs;
			}
		}
	}
</script>
</head>
<body>
	<!-- 검색DIV -->
	<div>
		<input type="text" id="name" name="name"><input type="button"
			value="검색" onClick="show()">
	</div>
	<div >
		<table width="100%">

			<tr>
				<td id="shopList" width="100%"></td>
			</tr>
		</table>
	</div>

	<div class="white_content" id="open" onClick="location.href='#close'">

		<div id="namemap" style="width: 90%; height: 90%;">
			<script type="text/javascript"
				src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8WStogCDUynVUNDduy5&submodules=geocoder"></script>
			<script type="text/javascript">
				var mapdiv2 = document.getElementById('namemap');

				var position2 = new naver.maps.LatLng(37.500742, 127.036925);
				var mapOptions = {
					mapTypeId : naver.maps.MapTypeId.TERRAIN,
					//tileSize: new naver.maps.Size(50, 128),
					center : position2,
					zoom : 15,

					lngoControl : false,
					mapDataControl : false,

				};

				var map2 = new naver.maps.Map(mapdiv2, mapOptions);

				map2.setCursor('pointer');//지도 위에서의 커서 모양은 'pointer'
				var marker2 = new naver.maps.Marker({
					position : position2,
					map : map2
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
							map2.setCenter(position2);
							marker2.setPosition(position2);
						}
					}
				}
			</script>
		</div>

	</div>

</body>
</html>