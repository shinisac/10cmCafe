<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<c:if test="${empty sessionScope.id }">
<script>
alert('로그인이 필요한 페이지입니다.');
location.href='shopPageindex.do';   
</script>
</c:if>
</head>
<body>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<img alt="어드민로고" src="img/test.png" width="50" height="50">
				<h1><a href="shopPageMain.do?shop_idx=${shop_idx }">10cm CAFE</a></h1>
			</div>
			<div id="menu"> 
				<ul>
					<li><a href="orderList.do?shop_idx=${shop_idx }">주문리스트</a></li>
					<li><a href="invenList.do?shop_idx=${shop_idx }">재고관리</a></li>
					<li><a href="whList.do?shop_idx=${shop_idx }">입고관리</a></li>
					<li><a href="baljuAdd.do?shop_idx=${shop_idx }">발주신청</a></li>
					<li><a href="baljuDetailList.do?shop_idx=${shop_idx }">발주리스트</a></li>
					<li><a href="sales.do?shop_idx=${shop_idx }&shop_name=${shop_name}">매출확인</a></li>
					<li><a href="smemberLogout.do">로그아웃</a></li>
				</ul>
				
			</div>
			
		</div>
	</div>
</body>
</html>