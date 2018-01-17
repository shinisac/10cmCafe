<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
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

function cancel(){
	window.self.close();
}
</script>
</head>
<body>
<section>
	<article>
		<form action="pointGive.do" >
			<table border="0"  cellspacing="0" >
				<tr>
					<th>지급사유</th>
					<th>포인트점수</th>
				</tr>
				<tr>
					<input type="hidden" name="idx" value="${ idx}">
					<td align="center"><input type="text" name="point_content"  placeholder="지급사유를 입력하세요"></td>
					<td align="center"><input type="text" name="point" placeholder="포인트점수를 입력하세요"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="확인" id="update">
						<input type="button" value="취소" onclick="cancel()" id="update">
					</td>
				</tr>
			</table>
		</form>
	</article>
</section>
</body>
</html>