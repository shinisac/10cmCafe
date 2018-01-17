<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC>
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
</style>
<script src="js/httpRequest.js"></script>
<script>
function categoryList(){
	var cp='${param.cp}';
	
	if(cp==''){
		cp=1;
	}
	var param = 'cp='+cp;
	sendRequest('categoryList.do',param,cateListResult,'GET');
	
}

function cateListResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			
			var str=document.all.table1;
			
			str.innerHTML=data;
			
		}
	}
}
function cateList_reshow(i){

	var cp=i;
	
	if(cp==''){
		cp=1;
	}
	
	var param = 'cp='+cp;
	
	sendRequest('categoryList.do',param,cateListResult,'GET');
	
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
    	   alert('카테고리를 선택해주세요.');
    	   return;
       }else if(document.getElementsByName("ck")[i].checked==true){
    	   document.fm.submit();
    	   return;
       }
    }
   
 }

function cateWrite(){
	window.open('cateWrite.do','cateWrite','width=600, height=500');
}

function cateReWrite(idx){
	window.open('cateReWrite.do?idx='+idx,'cateReWrite','width=600, height=500');
}

</script>
</head>
<body onload="categoryList()">
<%@include file="../admin_header.jsp" %>
<div class="wrapper">
		<div id="welcome" class="container">
		<div class="title"><h3>카테고리 등록</h3></div>
		<form name="fm" action="categoryDel.do">
			<section align="center">
				<article>
					<table id="table1">
						
					</table>
				</article>
			</section>
		</form>
		</div>
	</div>
</body>
</html>