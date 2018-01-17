<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
</head>
<body>
	<form name="addfm" action="storeAdd.do" method="POST" onkeydown = "if (event.keyCode == 13) {return false;}">
		<table border="1" style="width: 500px; height: 700px;">
			<tr>
				<th>매장명</th>
				<td><input type="text" name="name" size="30"></td>
			</tr>

			<tr>
				<th rowspan="2">주소</th>
				<td><input type="text" name="mapaddrs" id="mapaddrs" size="40" readonly="readonly"></td>
			</tr>
			<tr>
				<td >
					<input type="text" name="addr" size="40">
					<input id="lat" type="hidden" name="lat">
					<input id="lng" type="hidden" name="lng">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input id="address" type="text" placeholder="검색할 주소" value=""> 
					<input id="submit" type="button" value="검색">
					<label style="margin-left: 20px;" id="serchtxt"> </label>
				</td>
			</tr>


			<tr style="height: 600px;">
				<td colspan="2">
					<div id="map" style="width: 100%; height: 100%;">
						<script type="text/javascript"
							src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8WStogCDUynVUNDduy5&submodules=geocoder"></script>
						<script>
							$(window).on(
									'load',
									function() {
										var newSize = new naver.maps.Size($(
												'#map').width(), $('#map')
												.height());

										map.setSize(newSize);
									});
							var position = new naver.maps.LatLng(37.500742,
									127.036925);
							var mapOptions = {
								mapTypeId : naver.maps.MapTypeId.TERRAIN,
								//tileSize: new naver.maps.Size(50, 128),
								center : position,
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
															item.point.x,
															item.point.y);

													map.setCenter(point);
												});
							}
							function searchToAddress(latlng) {

								var tm128 = naver.maps.TransCoord
										.fromLatLngToTM128(latlng);

								naver.maps.Service
										.reverseGeocode(
												{
													location : tm128,
													coordType : naver.maps.Service.CoordType.TM128
												},
												function(status, response) {
													if (status === naver.maps.Service.Status.ERROR) {
														return alert('Something Wrong!');
													}

													var items = response.result.items[0];
													//return items.address;
													return $('#mapaddrs').val(
															items.address);

												});

							}
							function initGeocoder() {
								map.addListener('click', function(e) {
									searchToAddress(e.coord);
								});
								$('#address')
										.on(
												'keydown',
												function(e) {
													var keyCode = e.which;

													if (keyCode === 13) { // Enter Key
														addrSearch($('#address')
																.val());
														var txt = $('#address')
																.val();
														$('#serchtxt')
																.html(
																		"<b>      '"
																				+ txt
																				+ "'에 대한 검색결과</b>");
													}
												});
								//id가 submit인 태그가 클릭됬을경우 실행!	
								$('#submit')
										.on(
												'click',
												function(e) {
													e.preventDefault();

													addrSearch($('#address')
															.val());
													var txt = $('#address')
															.val();
													$('#serchtxt')
															.html(
																	"<b>      '"
																			+ txt
																			+ "'에 대한 검색결과</b>");
												});

								addrSearch('역삼');
							}

							naver.maps.onJSContentLoaded = initGeocoder;
							//이 핸들러는 NAVER 지도 API v3 로드 시, 함께 요청한 서브모듈의 JavaScript 콘텐츠가 웹 브라우저에 모두 로드되었을 때 한 번 호출됩니다.
							var marker = new naver.maps.Marker({
								position : position,
								map : map
							});

							naver.maps.Event.addListener(map, 'click',
									function(e) {

										marker.setPosition(e.coord);
										$('#lat').val(e.coord.lat());
										$('#lng').val(e.coord.lng());

									});
						</script>


					</div>
				</td>
			<tr>
				<td><input type="submit" value="등록"> <input
					type="button" value="뒤로가기"></td>
			</tr>
			</tr>
		</table>
	</form>
</body>
</html>