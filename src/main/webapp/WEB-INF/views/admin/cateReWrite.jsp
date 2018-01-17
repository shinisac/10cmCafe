<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script>
	function show(){
		var cateturn=document.cateReWrtieFm.category_turn.value;
		var catename=document.cateReWrtieFm.category_name.value;
		var cateimg=document.cateReWrtieFm.img.value;
		if(cateturn==""){
			alert('값을 넣어주세요');
			return;
		}else if(catename==""){
			alert('값을 넣어주세요');
			return;
		}else if(cateimg==""){
			alert('값을 넣어주세요');
			return;
		}else{
			document.cateReWrtieFm.submit();
		}	
	}
	
	function imgchk(img){
		var pattern = /.+(\.jpg|\.gif|\.bmp|\.png|\.jpeg)+$/gi;
		var obj= document.getElementById('file');
		if(!img.match(pattern)){
			alert('이미지 파일만 업로드 가능합니다.');
			obj.outerHTML=obj.outerHTML;//태그 초기화 개념 outerHTML:태그 안에 속성 및 자기 자신까지 포함
			var output = document.getElementById('output');
			output.outerHTML=output.outerHTML;
			return false;
		}
		return true;
	}

</script>
<script>
	var openFile = function(event) {
		var img=document.cateReWrtieFm.img.value;
		var a =imgchk(img);
		if(a==true){
		var input = event.target;
		
		var reader = new FileReader();
		reader.onload = function() {
			var dataURL = reader.result;
			var output = document.getElementById('output');
			output.src = dataURL;
		};
		reader.readAsDataURL(input.files[0]);
		}
		
	};
</script>
</head>
<body>
<form name="cateReWrtieFm" action="cateReWrite_Ok.do" onsubmit="return show()" method="POST" enctype="multipart/form-data">
<input type="hidden" name="idx" value="${idx }">
<section>
	<article>
		<h2 align="center">카테고리 수정</h2>
		<table>
			<tr>
				<td colspan="2"></td>
			</tr>
			<tr>
				<th>카테고리 순서</th>
				<td><input type="text" name="category_turn" value="${dto.category_turn }"></td>
			</tr>
			<tr>
				<th>카테고리 이름</th>
				<td><input type="text" name="category_name" value="${dto.category_name }"></td>
			</tr>
			<tr>
				<th>카테고리 이미지</th>
				<td>
					<img id='output' src="img/${dto.category_img }" width="150" height="150"  onerror="javascript:this.src='img/3.jpg'">
					<input type="file" id="file" name="img" accept='image/*' onchange='openFile(event)'>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="수정" onclick="show()" id="update">
					<input type="button" value="닫기" onclick="javascript:window.close();" id="update">
				</td>
			</tr>
		</table>
	</article>
</section>
</form>
</body>
</html>