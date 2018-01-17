<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<linkhref="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
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
	width:500px;
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
	   width: 80px;
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
function gocart(idx){
	location.href='admin_cartdetail.jsp?idx='+idx;
}
function goorder(id){
	location.href='admin_orderdetail.jsp?id='+id;
}
function gobbs(id){
	location.href='admin_bbs_detail.jsp?id='+id;
}
function gorip(id){	
	location.href='admin_rip_detail.jsp?id='+id;
}

//포인트 지급
function pointGive(idx){
	
	window.open('admin_pointGiveForm.do?idx='+idx,'pointGive','width=550,height=250')
}
</script>
</head>
<body>
<%@include file="../admin_header.jsp" %>
<div class="wrapper">
		<div id="welcome" class="container">
		<div class="title"><h3>회원 정보</h3></div>
		<section>
			<article>
				<form name="fmgoodsimfo" method="POST">
					<table>
					<thead>
						<tr>
							<td colspan="4">
							</td>
						</tr>
					</thead>
						<tfoot>
							<tr>
								<td colspan="4" align="center">
									<input type="button" value="닫기" onClick="history.back();" id="update">
								</td>
							</tr>	
						<tfoot>	
						<tbody>
							<tr>
								<th>회원코드</th>
									<td style="width:100px">
									${info.member_idx }
									</td>
								<th>등급</th>
								<td>${info.member_state }</td>
							</tr>
						
							<tr>
								<th>아이디</th>
								<td colspan="3">${info.member_email }</td>
							</tr>
							<tr>
								<th>이름</th>
								<td colspan="3">${info.member_name }</td>
							</tr>
				
							<tr>
								<th>전화번호</th>
								<td colspan="3">${info.member_phone }</td>
							</tr>	
							<tr>
								<th>포인트</th>
								<td colspan="2"><fmt:formatNumber value="${info.member_point }" pattern="#,##0" /></td>
								<td><input type="button" value="포인트지급" onclick="pointGive(${info.member_idx })" id="update"></td>
							</tr>
				
							<tr>
								<th>가입일</th>
								<td colspan="3">${info.member_date }</td>
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