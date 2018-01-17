<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>10Cm_CAFE</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default2.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
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
	   width: 70px;
	   height: 30px; /*--버튼 크기---*/
}

#tx1 {color:red, text-decoration:underline;
}

</style>
<script>



function displaydiv(value){
	if(value=='member_date'){
		document.getElementById('searchtext').style.display = 'none';
		document.getElementById('di').style.display='block';
	}else{
		document.getElementById('searchtext').style.display='block';
		document.getElementById('di').style.display = 'none';
	}
	
}
//회원 탈퇴 리스트
function outList(){
	var cp='${param.cp}';
	if(cp==''){
		cp=1;
	}
	sendRequest('admin_memberOutList.do','cp='+cp,outListResult,'GET')
}
function outListResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			
			var str=document.all.member_Result;
			str.innerHTML=data;
			
		}
	}
}

//탈퇴회원중 검색기능 
function member_outFind(){
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
	
	
	
	sendRequest('admin_member_outFind.do','sel='+sel+'&tx='+tx,member_outFindResult,'GET')
	
}
function member_refind(i){
	var sel=document.getElementById('f_sel').value;
	var tx=document.getElementById('f_tx').value;
	
	
	
	var cp=i;

	if(cp==''){
		cp=1;
	}

	if(sel=='null'){
		
		sendRequest('admin_memberOutList.do','cp='+cp,outListResult,'GET');
	}else{
	
	sendRequest('admin_member_outFind.do','sel='+sel+'&tx='+tx+'&cp='+cp,member_outFindResult,'GET')
	}
}
//검색기능 결과 ajax
function member_outFindResult(){
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
    	   alert('회원을 선택해주세요.');
    	   return;
       }else if(document.getElementsByName("ck")[i].checked==true){
    	   document.fm.submit();
    	   return;
       }
    }
   
 }
</script>
</head>
<body onload="outList()">
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
<div class="wrapper">
		<div id="welcome" class="container">
			<section>
				<article>
				<h3 align="center">회원 탈퇴관리</h3>
					<form name="fm" action="admin_memberDel.do">
						<table>
							<tr><td>
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
									<div id="di"><input class="dates" type="text" maxlength="4" name="year" >/<input class="date2" maxlength="2" type="text" name="month" >/<input class="date2" maxlength="2" type="text" name="days"></div></div>
									<div class="search"><input type="button" value="검색" onclick="member_outFind()" id="update"></div>	
								</td>
							</tr>		
						</table>
							
						<table id="member_Result" align="center">
						
							</table>
				
						
					
						<div align="center">
							<input type="button" value="목록으로" onclick="location.href='admin_memberListForm.do'" id="update">
							<input type="button" value="탈퇴" onclick="goSubmit()" id="update">
						</div>
					</form>
				</article>
			</section>
		</div>
	</div>
</body>
</html>