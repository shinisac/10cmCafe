<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
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
function show(){//체크박스 모두 선택
    var len=document.getElementsByName("ck").length;
    if(document.getElementsByName("allck")[0].checked==true){//체크박스가 체크됬을떄
       for(var i=0; i<len; i++){
          document.getElementsByName("ck")[i].checked=true;
       }
    }else{
       for(var i=0; i<len; i++){
          document.getElementsByName("ck")[i].checked=false;
       }
    }
 }
 function goSubmit(){
   
    var len=document.getElementsByName("ck").length;
    for(var i=0; i<len; i++){
       if(document.getElementsByName("ck")[i].checked==false){
    	   alert('메뉴를 선택해주세요.');
    	   return;
       }else if(document.getElementsByName("ck")[i].checked==true){
    	   document.fm.submit();
    	   return;
       }
    }
   
 }

function menuAdd(shop_idx){
   window.open('menuAddForm.do?shop_idx='+shop_idx,'menuAdd','width=600, height=650');
}
function menuUpdate(menu_idx){
   window.open('menuUpdate.do?menu_idx='+menu_idx,'menuUpdate','width=600, height=650');
}
</script>
</head>
<body>
<%@include file="../admin_header.jsp" %>
<div class="wrapper">
	<div id="welcome" class="container">
		<div class="title"><h3>${shop_name}매장 메뉴 등록</h3></div>
			<section>
	<article>
		<form name="fm" action="menuDel.do">
<input type="hidden" name="shop_idx" value="${shop_idx }">
<input type="hidden" name="shop_name" value="${shop_name }">
<table border="0" cellspacing="0" width="1000" align="center">
	<thead>
		<tr>
			<td colspan="9" align="right">
				<input type="button" value="메뉴등록" onclick="menuAdd('${shop_idx}')" id="update">
				<input type="button" value="메뉴삭제" id="update" onclick="goSubmit()">
			</td>
		</tr>
		<tr>
			<th><input type="checkbox" name="allck" onchange="show()"></th>
			<th>메뉴번호</th>
			<th>메뉴이미지</th>
			<th>메뉴순서</th>
			<th>메뉴이름</th>
			<th>메뉴가격</th>
			<th>메뉴상태</th>
			<th>메뉴카테고리</th>
			<th>메뉴 수정</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="9" align="center">
				${pageStr }
			</td>
		</tr>
	</tfoot>
	<tbody>
		<c:if test="${empty list}">
			<tr>
				<td colspan="9" align="center">등록된 메뉴가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="dto" items="${list}">
			<tr>
				<td><input type="checkbox" name="ck" value="${dto.menu_idx }"></td>
				<td>${dto.menu_idx}</td>
				<td align="center"><img src="img/menu/${dto.menu_img}" width="100" height="80"></td>
				<td>${dto.menu_turn}</td>
				<td>${dto.menu_name}</td>
				<td><fmt:formatNumber value="${dto.menu_price}" pattern="#,##0" /></td>
				<td>${dto.menu_state}</td>
				<td>${dto.menu_category}</td>
				<td><input type="button" value="수정" onclick="menuUpdate('${dto.menu_idx}')" id="update"></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</form>
	</article>
</section>
		</div>
	</div>
</body>
</html>