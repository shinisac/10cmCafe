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

  var count = 0;
	
   function show(idx) {
	var param='shop_idx=' + idx;
	var result=false;
	var chk =document.getElementsByName('ck');
		
		for(i=0; i<chk.length; i++){
			if(chk[i].checked==true){
				result=true;
				param +='&ck='+chk[i].value;
			}
		}
		if(result==true){
			sendRequest('materialAdd.do', param , showResult, 'GET');
		}
      
      
   }
   
   function showResult() {
      if (XHR.readyState == 4) {

         if (XHR.status == 200) {
            var data = XHR.responseText;
            var dtos = eval('(' + data + ')');
            var list = dtos.list;

            for (var i = 0; i < list.length; i++) {
               var dto = list[i];
            }
            
        	var str="";
        		str+='<tr><th>물품번호</th><th>물품이름</th><th>물품규격</th><th>물품가격</th><th>물품수량</th></tr>';
        	for(var i=0; i<list.length; i++){
        		
            	str+='<td class="bottomline"><input type="text" class="textline" name="balju_list['+i+'].material_idx" value="'+list[i].material_idx+'" readonly></td>';
            	str+='<td class="bottomline"><input type="text" class="textline" name="balju_list['+i+'].material_name" value="'+list[i].material_name+'" readonly></td>';
            	str+='<td class="bottomline"><input type="text" class="textline" name="balju_list['+i+'].material_size" value="'+list[i].material_size+'" readonly></td>';
            	str+='<td class="bottomline"><input type="text" class="textline" name="balju_list['+i+'].material_price" value="'+list[i].material_price+'" readonly></td>';
            	str+='<td class="bottomline"><input type="number" name="balju_list['+i+'].material_amount"></td></tr>';
            	
            	
            }
        	str+='<tr><td colspan="5" align="center"><input type="submit" value="발주신청"></td></tr>';
        	opener.document.getElementById('table').innerHTML=opener.document.getElementById('table').innerHTML+str;
        	window.close();
         }
        	
        	 
  	 }
   } 
</script>
</head>
<body>
<h2 align="center">재료품목 리스트</h2>
<form name="fm" action="materialList.do">
<input type="hidden" name="shop_idx" value="${shop_idx }">
<section>
	<article>
		<table>
	<thead>
		<tr>
			<th></th>
			<th>품목코드</th>
			<th>품목이름</th>
			<th>품목규격</th>
			<th>품목가격</th>

		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>
				<input type="checkbox" name="ck" value="${dto.material_idx}">
			</td>
	
			<td>${dto.material_idx }</td>
			<td>${dto.material_name }</td>
			<td>${dto.material_size }</td>
			<td>${dto.material_price }</td>
			
		</tr>
	</c:forEach>
	</tbody>
	<tfoot id="foot">
		<tr>
			<td colspan="6" align="center">
				<input type="button" value="추가" onclick="show('${shop_idx}')" id="update">
			</td>
		</tr>
		
	</tfoot>
</table>
	</article>
</section>

</form>
</body>
</html>