<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="styLesheet" type="text/css" href="css/adminmainmenu.css">
<style>
.dates{
	border:0px;
    width:30px;
    margin:0px 0px 0px 0px;
    text-align:center;
    
}
.date2{
	border:0px;
    width:15px;
    margin:0px 0px 0px 0px;
    
}
#di{
	display:none;
    width:80px;
    text-align:center;
    border: 1px solid gray;
    height:22px;
    padding:0px 0px 0px 0px;
    box-shadow:0px 0px 1px 0px inset;
    float:left;
}
.search{
	float:left;
	padding:0px 5px 0px 5px;
}
article table{
	margin:40px auto;
	width:500px;
	text-align: center;
	border-collapse: collapse;
}
article table th{
	height:40px;
	background-color: #EAEAEA;
	border-bottom: 2px solid #ddd;

}
article table td{
	border-bottom: 2px solid #ddd;
	height:35px;
}
article table th a{
	color:black;
	text-decoration: none;
}
#cur:hover{
	cursor: pointer;
	
	
}
#main tr:hover{
 	background-color: #E6FFFF;
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
a:link{
		text-decoration:none;
	}
a:visited{
		text-decoration:none;
}
</style>

<script src="js/httpRequest.js"></script>
<script>
	function shop_del(){
		var param = 'idx=${dto.shop_idx}';
		sendRequest('shop_del_Ajax.do',param,delResult,'GET');
	}

	function delResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				alert(data);
				opener.location.reload();
				self.close();
			}
		}	
				
	}
	function update(idx){
		location.href="admin_shopupdate.do?idx="+idx;
		
	}
</script>
</head>
<body>
<section>
	<article>
	
	

	<div class="container" id="content">
		
		<table class="table table-hover">
			<tr>
				<td colspan="2"><h2>매장정보확인</h2></td>
			</tr>
			<tr>
				<th colspan="2"><img src="img/shop/shop${dto.shop_img }.jpg" width="500" height="400"></th>
			</tr>
			<tr>
				<th>매장이름</th>
				<td>${dto.shop_name }</td>
			</tr>
			<tr>
				<th>매장주소</th>
				<td>${dto.shop_area}<br>${dto.shop_addr }</td>
			</tr>
			<tr>
				<th>매장전화번호</th>
				<td>${dto.shop_tel }</td>
			</tr>
			<tr>
				<td colspan="2">
					<div id="map" style="width: 90%; height: 90%;">
						<script type="text/javascript"
							src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=h8WStogCDUynVUNDduy5&submodules=geocoder"></script>
						<script type="text/javascript">
							var mapdiv = document.getElementById('map');
							var lat = ${dto.shop_lat};
							var lng = ${dto.shop_lng};
							var position = new naver.maps.LatLng(${dto.shop_lat}, ${dto.shop_lng});
							$(window).on(
									'load',
									function() {
										var newSize = new naver.maps.Size(500,300);

										map.setSize(newSize);
									});

							var mapOptions = {
								mapTypeId : naver.maps.MapTypeId.TERRAIN,
								//tileSize: new naver.maps.Size(50, 128),
								center : position,
								zoom : 10,

								lngoControl : false,
								mapDataControl : false,

							};
							
							var map = new naver.maps.Map('map', mapOptions);
							//var map = new naver.maps.Map(mapdiv, mapOptions);
							var marker = new naver.maps.Marker({
								position : position,
								map : map
							});
						</script>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					
					<input type="button" value="수정" onClick="update('${dto.shop_idx}')" id="update">&nbsp;
					<input type="button" value="삭제" onClick="shop_del()" id="update">&nbsp;
					<input type="button" value="닫기" onClick="self.close();" id="update">
				
				</td>
			</tr>
		</table>
	</div>
	</article>
</section>
</body>

</html>