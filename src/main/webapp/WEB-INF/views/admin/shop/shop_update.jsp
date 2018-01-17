<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
table th {
	height:40px;
	background-color: #EAEAEA;
	border-bottom: 2px solid #ddd;
}

table td {
	border-bottom: 2px solid #ddd;
	height:35px;
}

table {
	margin:40px auto;
	width:500px;
	
	border-collapse: collapse;
}
#update{
	   border: none; /*---테두리 정의---*/
	   background-Color: darkgray; /*--백그라운드 정의---*/
	   font: 12px 굴림; /*--폰트 정의---*/
	   font-weight: bold; /*--폰트 굵기---*/
	   color: white; /*--폰트 색깔---*/
	   width: 70px;
	   height: 30px; /*--버튼 크기---*/
}

#submit{
	   border: none; /*---테두리 정의---*/
	   background-Color: darkgray; /*--백그라운드 정의---*/
	   font: 12px 굴림; /*--폰트 정의---*/
	   font-weight: bold; /*--폰트 굵기---*/
	   color: white; /*--폰트 색깔---*/
	   width: 70px;
	   height: 30px; /*--버튼 크기---*/
}

#serchtxt {
	width: 100%;
}

#search {
	position: absolute;
	z-index: 10;
}


</style>
<script>
function imgchk(img){
	var pattern = /.+(\.jpg|\.gif|\.bmp|\.png|\.jpeg)+$/gi;	//이미지확장자 패턴
	var obj= document.getElementById('fileimg'); //이미지 태그
	if(!img.match(pattern)){ //이미지태그의 value값과 패턴과 부합되는지 않는지 확인하는 조건문
		alert('이미지 파일만 업로드 가능합니다.');
		var output = document.getElementById('output');
		output.outerHTML=output.outerHTML;
		return false;
		// 부합되지않을 경우 이미지파일만 업로드 가능하다는 메세지 출력
	}
	//만약 이미지 확장자가 맞는다면
	simgpath(img);	//이미지태그의 value값을 text태그의 value값으로 옮기는 함수
	return true;	//함수를 마친다.
}
var openFile = function(event) {
	var img=document.fm_update.imgfile.value;
	var a =imgchk(img);
	if(a==true){
	var input = event.target;
	
	var reader = new FileReader();
	reader.onload = function() {
		var dataURL = reader.result;
		var output = document.getElementById('output');
		output.src = dataURL;
	};
	reader.readAsDataURL(input.files[0]);
	}
	
};
function simgpath(obj){

var path = obj;
var file = path.substring(path.lastIndexOf('\\')+1,path.length);
//이미지태그의 value값을 뒤에서 \\부분+1한 위치에서 value의 갯수 끝까지 자른다.
document.getElementById("imgtext").value=file;
//자른 값을 text태그의 value값에 넣는다.

}

function gosub(){
	var name= document.fm_update.shop_name.value;
	var area = document.fm_update.shop_area.value;
	var addr = document.fm_update.shop_addr.value;
	var img = document.fm_update.shop_img.value;
	if(name==''||area==''||addr==''||img==''){
		alert('정보를 입력해주세요.');
		return false;
	}

	return true;;
}
</script>

</head>
<body>
	
	<form name="fm_update" action="admin_shopupdate.do" method="POST" onsubmit="return onsub()" enctype="multipart/form-data">
		<div class="container" id="content">
			<table class="table table-hover">
				<tr>
					<td colspan="2" align="center">
						<h2>매장정보수정</h2>
					</td>
				</tr>
				<tr>
					<th>매장이름</th>
					<td><input type="text" name="shop_name" value="${dto.shop_name }"></td>
				</tr>
				<tr>
					<th>매장주소</th>
					<td><input type="text" name="shop_area" id="mapaddrs" size="40" value="${dto.shop_area }"
					readonly="readonly"><br><input type="text" name="shop_addr" value="${dto.shop_addr }" size="40"></td>
				</tr>
				<tr>
					<th>매장<br>전화번호</th>
					<td><input type="text" name="shop_tel" value="${dto.shop_tel }"></td>
				</tr>

				<tr>
					<th>이미지</th>
					<td>
						<input type="hidden" id="imgtext" name="shop_img" value="${dto.shop_img }" readOnly><br> 
						<img id="output" src="img/shop/shop${dto.shop_img }.jpg" width="150" height="150">
						<input type="file" id="fileimg" name="imgfile" accept='image/*' onchange='openFile(event)'>
					</td>

				</tr>
				<tr>
					<td colspan="2">
						<div style="width: 100%;" id="search">
							<input id="address" type="text" placeholder="검색할 주소" value="">
							<input id="submit" type="button" value="검색"> <label
								style="margin-left: 20px;" id="serchtxt"> </label><br>
							<input type="button" value="reset" onClick="mapreset()" id="update">	
						</div>
						<div id="map" style="width: 100%; height: 100%;">
							<script type="text/javascript"
								src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8WStogCDUynVUNDduy5&submodules=geocoder"></script>
							<script>
							$(window).on(
									'load',
									function() {
										var newSize = new naver.maps.Size(480,300);

										map.setSize(newSize);
									});
							var position = new naver.maps.LatLng(${dto.shop_lat}, ${dto.shop_lng});
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
							function mapreset(){
								map.setCenter(position);
								marker.setPosition(position);
								searchToAddress(position);
								
								
							}
						</script>


						</div> <input id="lat" type="hidden" name="shop_lat" value="${dto.shop_lat}"> <input
						id="lng" type="hidden" name="shop_lng" value="${dto.shop_lng}">
						<input type="hidden" name="shop_idx" value="${dto.shop_idx}">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정" id="update">&nbsp;&nbsp;<input
						type="button" value="닫기" onClick="self.close();" id="update"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>