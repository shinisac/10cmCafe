<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	width:500px;
	height:100px;
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
.text {
	text-align: left;
}
.textarea {
	width:390px;
	rows:10;
	cols:20;
}
</style>
<script>
function allchk(){
    var idx= /^[0-9]*$/;
    var name = /^[가-힁a-zA-Z]+$/;
    if(!whWrite.material_idx.value.match(idx)){
        alert("물품번호를 확인해주세요(숫자만 가능합니다)");
        document.whWrite.material_idx.focus();
        return false;
    }else if(!whWrite.material_name.value.match(name)){
    	alert("물품이름을 확인해주세요(문자만 가능합니다)");
        document.whWrite.material_name.focus();
        return false;
    }else if(!whWrite.material_size.value.match(name)){
    	alert("물품규격을 확인해주세요(문자만 가능합니다)");
        document.whWrite.material_size.focus();
        return false;
    }else if(!whWrite.material_price.value.match(idx)){
    	alert("물품가격을 확인해주세요(숫자만 가능합니다)");
        document.whWrite.material_price.focus();
        return false;
    }else if(!whWrite.material_amount.value.match(idx)){
    	alert("물품수량을 확인해주세요(숫자만 가능합니다)");
        document.whWrite.material_amount.focus();
        return false;
    }else{
    	whWrite.submit();
        return false;
    }
    
 }
 function show(){
    var material_idx=document.whWrite.material_idx.value;
    var material_name=document.whWrite.material_name.value;
    var material_size=document.whWrite.material_size.value;
    var material_price=document.whWrite.material_price.value;
    var material_amount=document.whWrite.material_amount.value;
    var material_bigo=document.whWrite.material_bigo.value;

    if(material_idx==""){
       alert('값을 넣어주세요');
       return;
    }else if(material_name==""){
       alert('값을 넣어주세요');
       return;
    }else if(material_size==""){
       alert('값을 넣어주세요');
       return;
    }else if(material_price==""){
        alert('값을 넣어주세요');
        return;
    }else if(material_amount==""){
        alert('값을 넣어주세요');
        return;
    }else if(material_bigo==""){
        alert('값을 넣어주세요');
        return;
    }else{
       allchk();
    }
    
 }
</script>
</head>
<body>
	<%@include file="../admin_header2.jsp"%>
	<form name="whWrite" action="whWrite.do">
		<input type="hidden" name="shop_idx" value="${shop_idx }"> <input
			type="hidden" name="cp" value="${cp }">
		<div class="wrapper">
			<div id="welcome" class="container">
				<div class="title">
					<h2 align="center">입고내역작성</h2>
					<section>
						<article>


							<table>
								<thead>
									<tr>
										<th colspan="2">물품정보</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<td colspan="4" align="center"><input type="button"
											value="닫기"
											onClick="location.href='whList.do?cp=${cp}&shop_idx=${shop_idx }'" id="update">
										</td>
									</tr>
								<tfoot>
								<tbody>
									<tr>
										<th>매장번호</th>
										<td class=text>${shop_idx}</td>
									</tr>
									<tr>
										<th>물품번호</th>
										<td class=text><input type="text" name="material_idx"></td>
									</tr>
									<tr>
										<th>물품이름</th>
										<td class=text><input type="text" name="material_name"></td>
									</tr>
									<tr>
										<th>물품규격</th>
										<td class=text><input type="text" name="material_size"></td>
									</tr>
									<tr>
										<th>물품가격</th>
										<td class=text><input type="text" name="material_price"></td>
									</tr>
									<tr>
										<th>물품상태</th>
										<td class=text>입고완료</td>
									</tr>
									<tr>
										<th>물품수량</th>
										<td class=text><input type="number" name="material_amount"></td>
									</tr>
									<tr>
										<th>비고</th>
										<td class=text><textarea class=textarea name="material_bigo"></textarea>
										</td>
									</tr>
									<tr>
										<td colspan="2" align="center"><input type="button"
											value="내역저장" id="update" onclick="show()"> 
										<input type="reset" value="다시쓰기" id="update">
										</td>
									</tr>
								</tbody>
							</table>
						</article>
					</section>
				</div>
			</div>
		</div>
	</form>
</body>
</html>