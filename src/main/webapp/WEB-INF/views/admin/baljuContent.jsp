<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC>
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
	width:550px;
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
<form name="baljufm" action="baljuOk.do">
<input type="hidden" name="balju_idx" value="${balju_idx }">
<input type="hidden" name="totalPrice" value="${totalPrice }">
	<section>
		<article>
			<h2 align="center">발주내역</h2>
			<table border="0" cellspacing="0">
				<thead>
					<tr>
						<th>발주번호</th>
						<th>재료번호</th>
						<th>재료이름</th>
						<th>재료수량</th>
						<th>재료가격</th>
						<th>재료규격</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="7">등록된 발주가 없습니다.</td>
					</tr>
				</c:if>
				<tr>
			
				<c:forEach var="dto" items="${list }">
					<tr>
						<td>${dto.balju_idx }</td>
						<td>${dto.material_idx }</td>
						<td>${dto.material_name }</td>
						<td>${dto.material_amount }</td>
						<td><fmt:formatNumber value="${dto.material_price }" pattern="#,##0" /></td>
						<td>${dto.material_size }</td>
					</tr>
				</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7" align="center">
							총 발주금액 : <fmt:formatNumber value="${totalPrice}" pattern="#,##0" />원
						</td>
					</tr>
					<tr>
						<td colspan="7" align="center">
							<input type="submit" value="출고" id="update">
						</td>
					</tr>
				</tfoot>
			</table>
		</article>
	</section>
</form>
</body>
</html>