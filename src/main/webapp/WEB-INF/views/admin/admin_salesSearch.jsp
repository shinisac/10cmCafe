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
	width:1000px;
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
<script type="text/javascript" src="js/date.js"></script>
<script type="text/javascript">
function show(){
		var salesSearcha=document.Admin_salesSearch.startdate.value;
		var salesSearchb=document.Admin_salesSearch.enddate.value;
		if(salesSearcha==""){
			alert('날짜를 입력해주세요.');
			return;
		}else if(salesSearchb==""){
			alert('날짜를 입력해주세요.');
			return;
		}else{
			Admin_salesSearch.submit();
		}
}	
</script>
<style>
	td{
		text-align: center;
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
<%@include file="../admin_header.jsp"%>
<div class="wrapper">
		<div id="welcome" class="container">
		<h2 align="center">${shop_name }매출검색 결과</h2>
		<h4 align="center">${date} ~ ${date2}</h4>
		<section>
			<article>
			<form name="Admin_salesSearch" action="AdminSales.do" method="POST">
				<input type="hidden" name="shop_name" value="${shop_name }">
				<input type="hidden" name="shop_idx" value="${shop_idx }"> 
				<input type="hidden" name="cp" value="${cp }">
				<table border="0" cellspacing="0">
					<tr>
						<td colspan="5">
							<div style="float: left;"><b>검색 총 매출:<fmt:formatNumber value="${totalPrice}" pattern="#,##0" />원</b></div>
							<div style="float: right;">
								<input type="text" name="startdate" onclick="datePicker(event,'startdate')" readonly> ~ 
								<input type="text" name="enddate" onclick="datePicker(event,'enddate')" readonly>
								<input type="button" value="검색" id="update" onclick="show()">
							</div>
						</td>
					</tr>
					</thead>
					<tfoot>
						<tr>
						<c:if test="${empty date and empty date2}">
							<c:if test="${!empty list }">
								<td colspan="5" align="center">
									${pageStr }
								</td>
							</c:if>
							<c:if test="${empty list }">
								<td colspan="5" align="center">
									<a href="AdminSales.do?cp=${cp }&shop_idx=${shop_idx}&shop_name=${shop_name}">메인으로</a>
								</td>
							</c:if>
							
						</c:if>
						<c:if test="${!empty date or !empty date2}">
							<td colspan="5" align="center">
								<a href="AdminSales.do?cp=${cp }&shop_idx=${shop_idx}&shop_name=${shop_name}">메인으로</a>
							</td>
						</c:if>
						</tr>
					</tfoot>
					<tbody>
						<tr>
							<th>주문번호</th>
							<th>결제방식</th>
							<th>주문상태</th>
							<th>메뉴가격</th>
							<th>주문날짜</th>
						</tr>
						<c:if test="${empty list }">
							<tr>
								<td align="center" colspan="5">등록된 주문이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.order_idx}</td>
								<td>${dto.order_pay}</td>
								<td>${dto.order_state}</td>
								<td><fmt:formatNumber value="${dto.order_price}" pattern="#,##0" /></td>
								<td><fmt:formatDate value="${dto.order_date}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
							</tr>
						</c:forEach>
						</div>
						</td>
						</tr>
					</tbody>
				</table>
			</form>
			</article>
		</section>
	</div>
</div>
</body>
</html>