<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<link rel="styLesheet" type="text/css" href="css/adminmainmenu.css">
<script type="text/javascript">
function show(shop_idx,shop_name){
	location.href='baljuListForm.do?shop_idx='+shop_idx+'&shop_name='+shop_name;
}
</script>
<style type="text/css">
	nav{
		margin: 0px auto;
	}
	nav li{
		list-style-type: none;
		display: inline;
		margin: 10px;
	}
	a:link{
		text-decoration:none;
	}
	a:visited{
		text-decoration:none;
	}
</style>
</head>
<body>
<%@include file="../admin_header.jsp" %>
	<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title">
				<h3>발주관리</h3>
			</div>
			<c:set var="i" value="0" />
			<c:set var="j" value="5" />
			<table align="center" cellspacing="50">
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