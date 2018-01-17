<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css"media="all" />
<link rel="styLesheet" type="text/css" href="css/adminmainmenu.css">
<script src="js/httpRequest.js"></script>
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
	text-align: center;
	border-collapse: collapse;
	background-color: white;
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
	   width: 120px;
	   height: 30px; /*--버튼 크기---*/
}
#hr{
	height: 50px;
	width: 0px;
	border-right: 0px;
}
</style>
<script>
	function baljuList() {
		var cp = '${param.cp}';
		var shop_idx = '${shop_idx}';

		if (cp == '') {
			cp = 1;
		}
		var param = 'cp=' + cp + '&shop_idx=' + shop_idx;
		sendRequest('baljuList.do', param, baljuListResult, 'GET');

	}

	function baljuListResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data1 = XHR.responseText;

				var str1 = document.all.table1;

				str1.innerHTML = data1;

			}
		}
	}

	function baljuList2() {
		var cp = '${param.cp}';
		var shop_idx = '${shop_idx}';

		if (cp == '') {
			cp = 1;
		}
		var param = 'cp=' + cp + '&shop_idx=' + shop_idx;
		sendRequest('baljuList2.do', param, baljuListResult2, 'GET');

	}

	function baljuListResult2() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data2 = XHR.responseText;

				var str2 = document.all.table2;

				str2.innerHTML = data2;

			}
		}
	}
</script>
<script>
	function openPop(balju_idx) {
		window.open('baljuContent.do?balju_idx=' + balju_idx, 'baljuContent',
				'width=700 height=450');
	}
</script>
<script>
	function baljuList_reshow(i, shop_idx) {

		var cp = i;

		if (cp == '') {
			cp = 1;
		}

		var param = 'cp=' + cp + '&shop_idx=' + shop_idx;

		sendRequest('baljuList.do', param, baljuListResult, 'GET');

	}
</script>
<script>
	function baljuList_reshow2(i, shop_idx) {

		var cp = i;

		if (cp == '') {
			cp = 1;
		}

		var param = 'cp=' + cp + '&shop_idx=' + shop_idx;

		sendRequest('baljuList2.do', param, baljuListResult2, 'GET');

	}
</script>
<!-- <script>
	window.onload = function(){
		baljuList();
		baljuList2();
	}
</script> -->
<style>
#left {
	height: 800px;
	width: 560px;
	float: left;
	margin: 10px;
	padding: 10px;
	text-align: center;
}

#right {
	height: 800px;
	width: 610px;
	float: right;
	margin: 10px;
	border-left: 2px solid darkgray;
	padding: 10px;
	text-align: center;
}
</style>
</head>
<body bgcolor="gray">
<%@include file="../admin_header.jsp" %>
	<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title"><h3>${shop_name}매장 발주관리</h3></div>
			
			<div id="left">
				<section>
					<article align="center">
						<h2>발주신청리스트</h2><br>
						<input type="button" value="신청리스트보기" onclick="baljuList()" id="update">
						<table align="center" border="0" id="table1" width="580">
							<tr>
								<td colspan="2">리스트보기 버튼을 눌러주세요.</td>
							</tr>
						</table>
					</article>
				</section>
			</div>
			<div id="right">
				<section>
					<article align="center">
						<h2>발주완료리스트</h2><br>
						<input type="button" value="신청리스트보기" onclick="baljuList2()" id="update">
						<table align="center" border="0" id="table2" width="550">
							<tr>
								<td colspan="2">리스트보기 버튼을 눌러주세요.</td>
							</tr>
						</table>
					</article>
				</section>
			</div>
			
		</div>
	</div>
</body>
</html>