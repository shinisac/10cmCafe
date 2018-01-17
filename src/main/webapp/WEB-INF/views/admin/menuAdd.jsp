<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	function allchk(){
		var menua= /^[0-9]*$/;
		if(!menuAdd.menu_turn.value.match(menua)){
			 alert("메뉴순서칸에 숫자만 입력해주세요.");
			 document.menuAdd.menu_turn.focus();
		     return false;
		}else if(menuAdd.menu_name.value.match(menua)){
			alert("메뉴이름칸에 문자만 입력해주세요.");
			document.menuAdd.menu_name.focus();
		     return false;
		}else if(!menuAdd.menu_price.value.match(menua)){
			alert("메뉴가격칸에 숫자만 입력해주세요.");
			document.menuAdd.menu_price.focus();
		     return false;
		   }else{
			   menuAdd.submit();
			   return false;
		   }
		
	}
	function show(){
		var menu_category=document.menuAdd.menu_category.value;
		var menu_turn=document.menuAdd.menu_turn.value;
		var menu_name=document.menuAdd.menu_name.value;
		var menu_price=document.menuAdd.menu_price.value;
		var menu_state=document.menuAdd.menu_state.value;
		var menu_img=document.menuAdd.img.value;
		if(menu_category==""){
			alert('값을 넣어주세요');
			return;
		}else if(menu_turn==""){
			alert('값을 넣어주세요');
			return;
		}else if(menu_name==""){
			alert('값을 넣어주세요');
			return;
		}else if(menu_price==""){
			alert('값을 넣어주세요');
			return;
		}else if(menu_state==""){
			alert('값을 넣어주세요');
			return;
		}else if(menu_img==""){
			alert('이미지를 넣어주세요');
			return;
		}else{
			allchk();
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
		var img=document.menuAdd.img.value;
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
<h2 align="center">메뉴 등록</h2>
<section>
	<article>
		<form name="menuAdd" action="menuAdd.do" method="POST" enctype="multipart/form-data" onsubmit="return allchk();">
		<input type="hidden" name="shop_idx" value="${shop_idx }">
			<table border="0" cellspacing="0" align="center">
				<tfoot>
					<tr >
						<td colspan="3" align="center">
						<input type="button" value="등록" onclick="show()" id="update">
						<input type="reset" value="다시작성" id="update">
						</td>
					</tr>
				</tfoot>			
				<thead>
					<tr>
						<td colspan="4" align="center">
							
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>카테고리</th>
						<td colspan="2" float="left">
							<select name="menu_category">
							<c:forEach var="dto" items="${list}">
								<option value="${dto.category_idx}">${dto.category_name}</option>
							</c:forEach>	
							</select>
						</td>
					</tr>
					<tr>
						<th>메뉴순서</th>
						<td colspan="2">
							<input type="text" name="menu_turn">
						</td>
					</tr>
					<tr>
						<th>메뉴이름</th>
						<td colspan="2">
							<input type="text" name="menu_name">
						</td>
					</tr>				
					<tr>
						<th>메뉴가격</th>
						<td colspan="2">
							<input type="text" name="menu_price">
						</td>
					</tr>
					<tr>
						<th>메뉴상태</th>
						<td colspan="2">
							<select name="menu_state">
								<option value="진열가능">진열가능</option>
								<option value="진열대기">진열대기</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td><img id='output' width="150" height="150" src="img/0.jpg"></td>
						<td><input type="file" id="file" name="img" accept='image/*' onchange='openFile(event)'></td>
					</tr>
				</tbody>
			</table>
		</form>
	</article>
</section>
</body>
</html>