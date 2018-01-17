<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
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
	height:100px;
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
.text {
	text-align: left;
}
</style>
<script>
function whUpdate(wh_idx){
	   location.href='whUpdate.do?wh_idx='+wh_idx;
	}
</script>

</head>
<body>
<%@include file="../admin_header2.jsp" %>

<form name="whDel" action="whDel.do">
<input type="hidden" name="wh_idx" value="${dto.wh_idx}">
<input type="hidden" name="shop_idx" value="${shop_idx }">
<input type="hidden" name="cp" value="${cp }">
<section>
	<article>
	<div class="wrapper">
			<div id="welcome" class="container">
				<div class="title">
				<h2 align="center">입고 상세내역</h2>
		<table>
			<thead>
				<tr>
					<th colspan="2">물품정보</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
						<input type="button" id="update" value="수정" onclick="location.href='whUpdate.do?wh_idx=${dto.wh_idx}&cp=${cp}&shop_idx=${shop_idx }'">
						<input type="submit" id="update" value="삭제">
						<input type="button" id="update" value="닫기" onClick="location.href='whList.do?cp=${cp}&shop_idx=${shop_idx }'">
					</td>
				</tr>
			<tfoot>
			<tbody>
				<tr>
					<th>매장번호</th>
					<td class=text>${dto.shop_idx}</td>
				</tr>
				<tr>
					<th>물품번호</th>
					<td class=text>${dto.material_idx}</td>
				</tr>
				<tr>
					<th>물품이름</th>
					<td class=text>${dto.material_name}</td>
				</tr>
				<tr>
					<th>물품규격</th>
					<td class=text>${dto.material_size}</td>
				</tr>
				<tr>
					<th>물품가격</th>
					<td class=text><fmt:formatNumber value="${dto.material_price}" pattern="#,##0" /></td>
				</tr>
				<tr>
					<th>물품상태</th>
					<td class=text>${dto.material_state}</td>
				</tr>
				<tr>
					<th>물품수량</th>
					<td class=text><fmt:formatNumber value="${dto.material_amount}" pattern="#,##0" /></td>
				</tr>
				<tr>
					<th>입고날짜</th>
					<td class=text>${dto.material_date}</td>
				</tr>
				<tr>
					<th>비고</th>
					<td class=text>
						${dto.material_bigo}
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		</div>
		</div>
	</article>
</section>
</form>
</body>
</html>