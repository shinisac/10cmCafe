<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css" >

<title>10Cm_CAFE</title>
	
	

</head>
<body>

<div class="container">
<table class="table table-hover">
	<c:forEach var="dto" items="${list}">

		<tr align="center">	
			<td>
			${dto.shop_name }<br><br>${dto.shop_addr }<br><br>
			<input type="button" value="상세보기" onClick="location.href='shopInfo.do'">&nbsp;&nbsp;
			<input type="button" value="주문하기" onClick="location.href='#'">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:url var="bookmarkPage" value="bookPage.do">
			<c:param name="shop_idx">${dto.shop_idx }</c:param>
			</c:url>
			<a href="${bookmarkPage}">즐겨찾기</a>
			</td>
			<td>
			<div>
			</div>
			</td>
		</tr>
		</c:forEach>
</table>
</div>


<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>