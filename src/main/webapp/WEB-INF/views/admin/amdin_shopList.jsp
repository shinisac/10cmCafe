<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>10Cm_CAFE</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="js/httpRequest.js"></script>
<script>
	function show(){//요청함수
		var shopname= document.getElementById("name").value;
		var param = 'name='+shopname;
		alert(shopname);
		sendRequest('search_name.do',param,showResult,'GET');
	}
	
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				var divs ='';

				if(data.trim()=='no'){

					//document.getElementById('shopList').innerHTML="검색된 매장이 없습니다.";
					divs+='<table border="0"width="100%"><tr><td align="center"> 검색된 매장이 없습니다.</td></tr></table>';
				}else{
					var shopData = eval('('+data+')');//eval()은 텍스트를 객체로 변환,안쪽에 소콸호 입력
					
					
	 				for(var i = 0; i<shopData.nfc_shop.length;i++){
						divs+='<table border="1" height="40%" width="100%">';
						
						divs+='<tr>';
						divs+='<td width="80%">지점명 : '+shopData.nfc_shop[i].shop_name+'</td>';
						//divs+='<td rowspan="3"><input type="button" value="지도용"></td>';
						divs+='<td rowspan="3" width="20%"><a href="javascript:lookshop('+shopData.nfc_shop[i].shop_idx+');">지도용</a></td>';
						divs+='</tr>';
						divs+='<tr>';
						divs+='<td>주소 : '+shopData.nfc_shop[i].shop_area+'<br>'+shopData.nfc_shop[i].shop_addr+'</td>';
						
						divs+='</tr>';	
						divs+='<tr>';
						divs+='<td>PHONE : '+shopData.nfc_shop[i].shop_tel+'</td>';
						divs+='</tr>';							
						divs+='</table>';
					}
				}
				
				document.getElementById('shopList').innerHTML=divs;
			}
		}
	}
</script>
</head>
<body>



<div id="123">
<table width="100%">

<tr>
	<td id="shopList" width="100%" >
	
	</td>
</tr>	
</table>
</div>
</body>
</html>