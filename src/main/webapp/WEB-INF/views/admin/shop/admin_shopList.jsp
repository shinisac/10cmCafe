<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="styLesheet" type="text/css" href="css/adminmainmenu.css">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/httpRequest.js"></script>
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
<!-- <style>
	#shopList{
		border: 1px solid black;
		height: 200px;
		margin:40px auto;
		width:850px;
		text-align: center;
		border-collapse: collapse;
	}
	#shopList td{
	vertical-align: top;
	}
	#contentlist{
		margin:0px;
		padding:0px;
		
		width: 100%;
	}
	#contentlist tr,td,th{
		border: 1px solid black;
	}
	#page{
		height: 10%;
	}
</style> -->
<script>
	function show(){//요청함수
		var cp='${param.cp}';
		if(cp==''){
			cp=1;
		}
		var param = 'cp='+cp;
		sendRequest('admin_shopList_Ajax.do',param,showResult,'GET');
	}
	
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				
				document.getElementById('shopList').innerHTML=data;	
			}
		}	
				
	}
	
	function shopadd(){
		
		cw=590;
		ch=800;

		sw=screen.availWidth;
		sh=screen.availHeight;

		px=(sw-cw)/2;
		py=(sh-ch)/2;
		test=window.open('admin_shopAdd.do','shop','left='+px+',top='+py+',width='+cw+',height='+ch);
	}
	function shopcontent(idx){
		
		cw=530;
		ch=770;

		sw=screen.availWidth;
		sh=screen.availHeight;

		px=(sw-cw)/2;
		py=(sh-ch)/2;
		test=window.open('admin_content.do?idx='+idx,'shop','left='+px+',top='+py+',width='+cw+',height='+ch);
	}	
</script>
</head>
<body onload="show()">
<section>
	<article>
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
			<div class="title"><h3>관리자용 매장 리스트</h3></div>
	<div>
		<a href="javascript:shopadd()">매장등록</a>
	</div>
	<div>
		<table id="shopList">
		
		</table>
	</div>
		</div>
	</div>
</body>
</article>
</section>
</html>