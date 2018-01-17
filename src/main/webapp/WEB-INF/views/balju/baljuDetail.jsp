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
	width:850px;
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
</style>

</head>
<body>
<%@include file="../admin_header2.jsp" %>

<form name="fm">
<section>
	<article>
	<div class="wrapper">
			<div id="welcome" class="container">
				<div class="title">
				<h2 align="center">발주 상세내역</h2><br><br>
		<table border="0" cellspacing="0" align="center">
			<thead>
				<tr>
					<th>물품번호</th>
					<th>물품이름</th>
					<th>물품규격</th>
					<th>물품가격</th>
					<th>물품수량</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="5" align="center">
						<input type="button" id="update" value="닫기" onClick="location.href='baljuDetailList.do?cp=${cp}&shop_idx=${shop_idx }'">
					</td>
				</tr>
			<tfoot>
			<tbody>
				<c:set var="sum" value="0"></c:set>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.material_idx}</td>
						<td>${dto.material_name}</td>
						<td>${dto.material_size}</td>
						<td><fmt:formatNumber value="${dto.material_price}" pattern="#,##0" /></td>
						<td><fmt:formatNumber value="${dto.material_amount}" pattern="#,##0" /></td>
					</tr>
					<c:set var="sum" value="${sum+dto.material_price*dto.material_amount}"></c:set>
					</c:forEach>
					<tr>
						<td colspan="5"><h3>총 가격:<fmt:formatNumber value="${sum}" pattern="#,##0" />원</h3></td>
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