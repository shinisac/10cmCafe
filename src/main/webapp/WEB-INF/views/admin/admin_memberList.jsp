<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>10Cm_CAFE</title>
<script  type="text/javascript" src="js/httpRequest.js"></script>
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
#member_Result tr:hover{
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

#tx1 {
	color:red, text-decoration:underline;
}
#sel{
	
}

</style>
<script>
//현재 cp값 멤버변수



function displaydiv(value){
	if(value=='member_date'){
		document.getElementById('searchtext').style.display = 'none';
		document.getElementById('di').style.display='block';
	}else{
		document.getElementById('searchtext').style.display='block';
		document.getElementById('di').style.display = 'none';
	}
	
}
//회원 리스트
function allList(){
	var cp='${param.cp}';
	if(cp==''){
		cp=1;
	}
	sendRequest('admin_memberList.do','cp='+cp,allListResult,'GET');
	
	
}
function allListResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			
			var str=document.all.member_Result;
			
			str.innerHTML=data;
			
		}
	}
}

//검색기능 
function member_find(){
	var sel=document.getElementById('sel').value;
	var tx=document.getElementById('tx1').value;
	var cp=1;
	if(sel=='member_date'){
		
		var year=document.getElementById('year').value;
		var month=document.getElementById('month').value;
		var days=document.getElementById('days').value;

		tx=year+'/'+month+'/'+days;
		
		alert(tx);
	}
	
	
	
	
	sendRequest('admin_member_find.do','sel='+sel+'&tx='+tx+'&cp='+cp,member_findResult,'GET')
	
}

function member_refind(i){
	var sel=document.getElementById('f_sel').value;
	var tx=document.getElementById('f_tx').value;
	var cp=i;
	if(cp==''){
		cp=1;
	}
	if(sel==null){
		alert('타냐');
		sendRequest('admin_memberList.do','cp='+cp,allListResult,'GET');
	}else{
	
	sendRequest('admin_member_find.do','sel='+sel+'&tx='+tx+'&cp='+cp,member_findResult,'GET')
	}
}
//검색기능 결과 ajax
function member_findResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			
			var str=document.all.member_Result;
			str.innerHTML=data;
			
		}
	}
}


function memberinfo(idx){
	location.href='member_info.do?idx='+idx;
}

//포인트 지급
function pointGive(){
	var idx=0;
	window.open('admin_pointGiveForm.do?idx='+idx,'pointGive','width=550,height=250')
}
</script>
</head>
<body onload="allList()">
<%@include file="../admin_header.jsp" %>
<div class="wrapper">
		<div id="welcome" class="container">
			<section>
				<article>
				<h3 align="center">회원관리</h3>
						<table>
							<tr>
								<td>
									<div class="search">
										<select name="searchsel" id="sel" onchange="displaydiv(this.value);">
											<option value="all">전체검색</option>
											<option value="member_email">ID</option>
											<option value="member_name">이름</option>
											<option value="member_phone">전화번호</option>
											<option value="member_date">가입날짜</option>
										</select>
									</div>		
										<div class="search" id="searchtext"><input type="text" id="tx1" ></div>
										<div id="di"><input class="dates" type="text" maxlength="4" id="year" name="year" >/<input class="date2" maxlength="2" type="text"id="month" name="month" >/<input class="date2" maxlength="2" type="text" id="days" name="days"></div>
										<div class="search">
											<input type="button" value="검색" onclick="member_find()" id="update">
										</div>	
								</td>
								<td align="right" ><input type="button" value="포인트지급" id="update" onclick="pointGive()"></td>
							</tr>		
						</table>
							
						<table id="member_Result">
				
						
							</table>
						<!--  <table id="member_Result" align="center">
						검색결과 ajax
				
						</table>-->	
						<!-- 페이징처리부분 -->
					
						<div align="center">
							<input type="button" value="탈퇴관리" onclick="location.href='admin_memberOutListForm.do'" id="update">
						</div>
				</article>
			</section>
		</div>
	</div>
</body>
</html>