<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<style>
	nav{
		width: 600px;
		margin: 0px auto;
	}
	nav li{
		list-style-type: none;
		display: inline;
		margin-left: 45px;
	}
	a:link{
		color:orange;
		font-size:13px;
		text-decoration:none;
	}
	a:visited{
		color:orange;
		font-size:13px;
		text-decoration:none;
	}
	a:hover{
		color:orange;
		font-size:15px;
	}
</style>
</head>
<body>
<h2 align="center">KH커피 매장</h2>
<c:forEach var="dto" items="${list}">
	<nav>
		<ul>
			<c:url var="contentUrl" value="baljuAdd.do">
				<c:param name="shop_idx">${dto.shop_idx}</c:param>
				<c:param name="shop_name">${dto.shop_name}</c:param>
			</c:url>
			<li><a href="${contentUrl}">${dto.shop_name}</a></li>
		</ul>
	</nav>
</c:forEach>
</body>
</html>