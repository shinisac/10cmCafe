<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<link rel="styLesheet" type="text/css" href="css/adminmainmenu.css">
<script type="text/javascript">
function show(shop_idx,shop_name){
	location.href='AdminSales.do?shop_idx='+shop_idx+'&shop_name='+shop_name;
}
function show2(){
	location.href='salesList.do';
}
</script>
</head>
<body>
	<%@include file="../admin_header.jsp"%>
	<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title">
				<h3>매출확인</h3>
			</div>
			<c:set var="i" value="0" />
			<c:set var="j" value="5" />
			<table align="center" cellspacing="50">
				<tr>
					<td colspan="10" align="center" onclick="show2()">
						<img alt="총매장사진" src="img/1.jpg" width="100" height="80"><br>
						총 매출확인
					</td>
				</tr>
				<c:forEach var="dto" items="${list}">
				<c:if test="${i%j==0 }">
					<tr>
				</c:if>
					
					<td colspan="2" onclick="show('${dto.shop_idx}','${dto.shop_name}')">
						<img alt="매장사진" src="img/shop/shop${dto.shop_img}.jpg" width="100" height="80"><br>
						${dto.shop_name}
					</td>
				<c:if test="${i%j==j-1}%5==0">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1 }" />
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>