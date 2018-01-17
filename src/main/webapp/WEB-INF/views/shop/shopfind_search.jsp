<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8"> 
<title>10Cm_CAFE</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style>
.white_content {
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0, 0, 0, 0.8);
    opacity:0;
    -webkit-transition: opacity 200ms ease-in;
    -moz-transition: opacity 200ms ease-in;
    transition: opacity 200ms ease-in;
    pointer-events: none;
}
.white_content:target {
    opacity:1;
    pointer-events: auto;
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
.white_content > div {
	position: absolute;
	top: 5%;
	margin: auto;
	}
</style>
<script src="js/httpRequest.js"></script>
<script>
	function show(addr){//요청함수

		var param = 'addr='+addr;

		sendRequest('shopfind_addr.do',param,showResult,'GET');
	}
	
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				var divs ='';

				if(data.trim()=='no'){

					//document.getElementById('shopList').innerHTML="검색된 매장이 없습니다.";
					divs+='<table border="0"><tr><td align="center"> 검색된 매장이 없습니다.</td></tr></table>';
				}else{
					var shopData = eval('('+data+')');//eval()은 텍스트를 객체로 변환,안쪽에 소콸호 입력
					
					
	 				for(var i = 0; i<shopData.nfc_shop.length;i++){
						divs+='<table border="1" height="40" width="380px">';
						
						divs+='<tr>';
						divs+='<td width="300px">지점명 : '+shopData.nfc_shop[i].shop_name+'</td>';
						//divs+='<td rowspan="3"><input type="button" value="지도용"></td>';
						divs+='<td rowspan="3"><a href="javascript:lookshop('+shopData.nfc_shop[i].shop_idx+');">지도용</a></td>';
						divs+='</tr>';
						divs+='<tr>';
						divs+='<td>주소 : '+shopData.nfc_shop[i].shop_area+'<br>'+shopData.nfc_shop[i].shop_addr+'</td>';
						
						divs+='</tr>';	
						divs+='<tr>';
						divs+='<td>PHONE : '+shopData.nfc_shop[i].shop_tel+'</td>';
						divs+='</tr>';	
						
						divs+='</table>';
					}
				}
				
				document.getElementById('shopList').innerHTML=divs;
			}
		}
	}
</script>
</head>
<body>
<div>
<A href="javascript:show('서울')">서울</A>
<A href="javascript:show('경기')">경기</A>
<A href="javascript:show('대전')">대전</A>
<A href="javascript:show('충청')">충청</A>
<A href="javascript:show('대구')">대구</A>	
<A href="javascript:show('제주')">제주</A>	
</div>
<div id="123">
<table >
<tr>
	<td id="shopList" width="380px" >
	
	</td>
</tr>	
</table>
</div>

   <div class="white_content" id="open" onClick="location.href='#close'">

        <div id="map" style="width:80%;height:80%;">
        <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8WStogCDUynVUNDduy5&submodules=geocoder"></script>
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
			var position =new naver.maps.LatLng(37.500742, 127.036925);
			var mapOptions = {
				mapTypeId : naver.maps.MapTypeId.TERRAIN,
				//tileSize: new naver.maps.Size(50, 128),
				center : position,
				zoom : 10,

				lngoControl : false,
				mapDataControl : false,

			};
			
			var map = new naver.maps.Map(mapdiv, mapOptions);

			map.setCursor('pointer');//지도 위에서의 커서 모양은 'pointer'
			var marker = new naver.maps.Marker({
			    position: position,
			    map: map
			});
			function lookshop(idx){
				var param = 'idx='+idx;
				sendRequest('lookshop.do',param,showmap,'GET');
				location.href='#open';
			}
			function showmap(){
				if(XHR.readyState==4){
					if(XHR.status==200){
						var data=XHR.responseText;
						if(data.trim()=='no'){
							return;
						}
						var shopData = eval('('+data+')');
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

</body>
</html>