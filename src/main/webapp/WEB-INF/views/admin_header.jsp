<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<c:if test="${empty sessionScope.admin_member_id }">
<script>
alert('로그인이 필요한 페이지입니다.');
location.href='admin_index.do';   
</script>
</c:if>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<img alt="어드민로고" src="img/test.png" width="50" height="50">
				<h1><a href="admin_indexForm.do">10cm CAFE</a></h1>
			</div>
			<div id="menu">
				<ul>
					<li><a href="admin_memberListForm.do">회원관리</a></li>
					<li><a href="admin_shop.do">매장관리</a></li>
					<li><a href="categoryListForm.do">카테고리관리</a></li>
					<li><a href="menuShop.do">메뉴관리</a></li>
					<li><a href="baljuShop.do">발주관리</a></li>
					<li><a href="salesShop.do">매출확인</a></li>
					<li><a href="adminLogout.do">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>