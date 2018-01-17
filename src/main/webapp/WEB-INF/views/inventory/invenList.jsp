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
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
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
<c:if test="${empty sessionScope.id }">
<script>
alert('로그인이 필요한 페이지입니다.');
location.href='index.do';	
</script>
</c:if>
<script src="js/date.js"></script>
<script>
function show(cp,idx,state,shop_idx){
	location.href='invenDetail.do?cp='+cp+'&idx='+idx+'&state='+state+'&shop_idx='+shop_idx;
}
function displaydiv(value){
	if(value=='material_date'){
		document.getElementById('searchtext').style.display = 'none';
		document.getElementById('di').style.display='block';
	}else{
		document.getElementById('searchtext').style.display='block';
		document.getElementById('di').style.display = 'none';
	}
}
function showSearch(){
	var salesSearcha=document.invenListForm.startdate.value;
	var salesSearchb=document.invenListForm.enddate.value;
	if(salesSearcha==""){
		alert('날짜를 입력해주세요.');
		return;
	}else if(salesSearchb==""){
		alert('날짜를 입력해주세요.');
		return;
	}else{
		invenListForm.submit();
	}
}	
</script>
<!-- <script>
function allchk(){
    var idx= /^[0-9/]*$/;
    //var name = /^[가-힁a-zA-Z]+$/;
    if(!invenListForm.startdate.value.match(idx)){
        alert("날짜를 확인해주세요(ex)2015/12/23)");
        document.invenListForm.startdate.focus();
        return false;
    }else if(!invenListForm.enddate.value.match(idx)){
        alert("날짜를 확인해주세요(ex)2015/12/23)");
        document.invenListForm.enddate.focus();
        return false;
    }else{
    	invenListForm.submit();
        return false;
    }
    
 }
</script> -->

</head>
<body>
<%@include file="../admin_header2.jsp" %>
<section align="center">
<form name="invenListForm" action="invenSearch.do">
<input type="hidden" name="shop_idx" value="${shop_idx }">
<input type="hidden" name="cp" value="${cp }">
	<article>
	
	
		<div class="wrapper">
			<div id="welcome" class="container">
				<div class="title">
				<h3 align="center">재고현황</h3>
					<table>
					<thead>
					<tr>
						<td colspan="7">
							<div style="float:right;">
								<input type="text" name="startdate" onclick = "datePicker(event,'startdate')" readonly> ~
								<input type="text" name="enddate" onclick = "datePicker(event,'enddate')" readonly>
								<input type="button" value="검색" id="update" onclick="showSearch()">
							</div>
						
						</td>
					</tr>
					<tr>
						<th>번호</th>
						<th>상태</th>
						<th>이름</th>
						<th>규격</th>
						<th>가격</th>
						<th>수량</th>
						<th>입고날짜</th>
					</tr>
					</thead>
					<tfoot>
						<tr>
						<c:if test="${empty date and empty date2}">
							<c:if test="${!empty list }">
								<td colspan="7" align="center">
									${pageStr }
								</td>
							</c:if>
							<c:if test="${empty list }">
								<td colspan="7" align="center">
									<a href="invenList.do?cp=${cp }&shop_idx=${shop_idx}">메인으로</a>
								</td>
							</c:if>
							
						</c:if>
						<c:if test="${!empty date or !empty date2}">
							<td colspan="7" align="center">
								<a href="invenList.do?cp=${cp }&shop_idx=${shop_idx}">메인으로</a>
							</td>
						</c:if>
					
						
						</tr>
					</tfoot>
					<tbody>
						<c:if test="${empty list }">
							<tr>
								<td colspan="7" align="center">
									등록된 재고가 없습니다.
								</td>
							</tr>
						</c:if>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td onclick="show('${cp}','${dto.jego_idx }','${dto.material_state }','${shop_idx }')">${dto.jego_idx }</td>
								<td onclick="show('${cp}','${dto.jego_idx }','${dto.material_state }','${shop_idx }')">${dto.material_state }</td>
								<td onclick="show('${cp}','${dto.jego_idx }','${dto.material_state }','${shop_idx }')">${dto.material_name }</td>
								<td onclick="show('${cp}','${dto.jego_idx }','${dto.material_state }','${shop_idx }')">${dto.material_size }</td>
								<td onclick="show('${cp}','${dto.jego_idx }','${dto.material_state }','${shop_idx }')">
									<fmt:formatNumber value="${dto.material_price }" pattern="#,##0" />
								</td>
								<td onclick="show('${cp}','${dto.jego_idx }','${dto.material_state }','${shop_idx }')">
									<fmt:formatNumber value="${dto.material_amount }" pattern="#,##0" />
								</td>
								<td onclick="show('${cp}','${dto.jego_idx }','${dto.material_state }','${shop_idx }')">${dto.material_date }</td>
								<c:if test="${dto.material_state eq '입고요망'}">
									<td style="border-bottom: none;">
										<input type="button" value="발주신청" onclick="location.href='baljuAdd.do?shop_idx=${shop_idx}'" id="update">
									</td>
								</c:if>
							</tr>
							
						</c:forEach>
					</tbody>
					</table>
				</div>
			</div>
	</div>
	
	</article>
</form>
</section>
</body>
</html>