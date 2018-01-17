 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<script src="js/date.js"></script>
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
a:link{
		text-decoration:none;
	}
a:visited{
		text-decoration:none;
}
</style>

<script>
	function baljuContent(balju_idx,cp,shop_idx){
		var param='?balju_idx='+balju_idx+'&cp='+cp+'&shop_idx='+shop_idx;
		location.href='baljuDetail.do'+param;
	}
	function show(){
		var salesSearcha=document.fm.startdate.value;
		var salesSearchb=document.fm.enddate.value;
		if(salesSearcha==""){
			alert('날짜를 입력해주세요.');
			return;
		}else if(salesSearchb==""){
			alert('날짜를 입력해주세요.');
			return;
		}else{
			fm.submit();
		}
	}	
</script>
</head>
<body>
<%@include file="../admin_header2.jsp" %>


<form name="fm" action="baljuDetailList.do" method="post">
<input type="hidden" name="shop_idx" value="${shop_idx }">
<input type="hidden" name="cp" value="${cp }">
<section>
	<article>
	<div class="wrapper">
			<div id="welcome" class="container">
				<div class="title">
				<h3 align="center">발주신청현황</h3><br><br>
		<table>
			<thead>
				<tr>
					<td colspan="3">
						<div style="float: right;">
							<input type="text" name="startdate" onclick = "datePicker(event,'startdate')" readonly> ~
		           		    <input type="text" name="enddate" onclick = "datePicker(event,'enddate')" readonly>
							<input type="button" value="검색" id="update" onclick="show()">
						</div>
						<div style="float: right;">	
						</div>
					</td>
				</tr>
				<tr>
					<th>발주번호</th>
					<th>매장번호</th>
					<th>발주날짜</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<c:if test="${empty date and empty date2}">
					<c:if test="${!empty list }">
						<td colspan="3" align="center">
							${pageStr }
						</td>
					</c:if>
					<c:if test="${empty list }">
						<td colspan="3" align="center">
							<a href="baljuDetailList.do?cp=1&shop_idx=${shop_idx}">메인으로</a>
						</td>
					</c:if>
					
				</c:if>
				<c:if test="${!empty date or !empty date2}">
					<td colspan="3" align="center">
						<a href="baljuDetailList.do?cp=1&shop_idx=${shop_idx}">메인으로</a>
					</td>
				</c:if>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="3">등록된 입고물품이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr onclick="baljuContent('${dto.balju_idx}','${cp }','${shop_idx }');">
							<td>${dto.balju_idx}</td>
							<td>${dto.shop_idx}</td>
							<td>${dto.balju_date}</td>
					</tr>
				</c:forEach>
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