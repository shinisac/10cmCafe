<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>10Cm_CAFE</title>
<style>
body{
margin: 0px;
}
	.intext{
		border: 0px;
		
	}
	#list{
		padding-left: 5px;
	}
	#footer{
		position: fixed;
		bottom: 0;
		width:100%;
		background-color:  #D6C8A1;
		height: 80px;
		
	}
	#content{
	margin:0px 0px 80px 0px;
	width: 100%;
	}
</style>
<script src="js/httpRequest.js"></script>
<script src="js/Num.js"></script>
<script>
	window.onload=function(){
		show('${param.shop}');
	}
	function changeamount(i){
		var param = 'order_menu_idx='+document.getElementById(i).idx.value;
		param+='&order_menu_name='+document.getElementById(i).name.value;
		param+='&order_menu_amount='+document.getElementById(i).amount.value;
		param+='&order_menu_price='+getNumString(document.getElementById(i).price.value);
		param+='&order_menu_optiona='+document.getElementById(i).optiona.value;
		param+='&order_menu_optionb='+document.getElementById(i).optionb.value;
		param+='&order_menu_optionc='+document.getElementById(i).optionc.value;
		param+='&shop=${param.shop}';
		sendRequest('cart_amount.do',param,cartdelsult,'GET');
	}
	
	function mamount(i){
		var amounts = document.getElementById(i).amount.value;
		if(amounts>1){
			document.getElementById(i).amount.value=(parseInt(amounts)-1);
			changeamount(i)
		}
	}
	function pamount(i){
		var amounts = document.getElementById(i).amount.value;
			document.getElementById(i).amount.value=(parseInt(amounts)+1);
			changeamount(i)
	}
	function cartdel(i){
		var param = 'order_menu_idx='+document.getElementById(i).idx.value;
		param+='&order_menu_name='+document.getElementById(i).name.value;
		param+='&order_menu_amount='+document.getElementById(i).amount.value;
		param+='&order_menu_price='+getNumString(document.getElementById(i).price.value);
		param+='&order_menu_optiona='+document.getElementById(i).optiona.value;
		param+='&order_menu_optionb='+document.getElementById(i).optionb.value;
		param+='&order_menu_optionc='+document.getElementById(i).optionc.value;
		param+='&shop=${param.shop}';
		sendRequest('cart_del.do',param,cartdelsult,'GET');
	}
	function cartdelsult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				show('${param.shop}');
			}
		}
	}
	function goOrder(){
		location.href='order.do?shop=${param.shop}';
		
	}
	function show(idx){//요청함수
		var param =  'shop='+idx;
		sendRequest('menu_cart.do',param,showResult,'GET');
	}
	
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				var divs ='';

				if(data.trim()=='no'){

					//document.getElementById('shopList').innerHTML="검색된 매장이 없습니다.";
					divs+='<table border="0"width="100%"><tr><td align="center"> 장바구니 물품이 없습니다.</td></tr></table>';
				}else{
					var cartData = eval('('+data+')');//eval()은 텍스트를 객체로 변환,안쪽에 소콸호 입력
					
					
	 				for(var i = 0; i<cartData.cart_list.length;i++){
	 					divs+='<form id="'+i+'">';
	 					divs+='<input type="hidden" name="idx" value="'+cartData.cart_list[i].menu_idx+'">';
						divs+='<table border="1" height="40%" width="100%">';
						divs+='<tr>';
						divs+='<td width="80%"><input class="intext" type="text" name="name" value="'+cartData.cart_list[i].menu_name+'"></td>';
						//divs+='<td rowspan="3"><input type="button" value="지도용"></td>';
						divs+='<td rowspan="4" width="20%"><a href="javascript:cartdel('+i+')">삭제</a></td>';
						divs+='</tr>';
						divs+='<tr>';
						divs+='<td>'
						if(cartData.cart_list[i].menu_optiona!=null){
							
							divs+='<input class="intext" type="text" size="1" name="optiona" value="'+cartData.cart_list[i].menu_optiona+'">/';
						}
						if(cartData.cart_list[i].menu_optionb!=null){
							
							divs+='<input class="intext" type="text" size="2" name="optionb" value="'+cartData.cart_list[i].menu_optionb+'">/';
						}
						if(cartData.cart_list[i].menu_optionc!=null){
							divs+='<input class="intext" type="text" size="1" name="optionc" value="'+cartData.cart_list[i].menu_optionc+'">';
						}						
						divs+='</td>';
						divs+='</tr>';	
						divs+='<tr>';
						divs+='<td><input class="intext" type="text" name="price" value="'+setComma(cartData.cart_list[i].menu_price)+'"</td>';
						divs+='</tr>';		
						divs+='<tr>';
						divs+='<td><a href="javascript:mamount('+i+');totalprice();">-</a> <input type="text" class="intext" name="amount" size="1"id="amount" value="'+cartData.cart_list[i].menu_amount+'" readonly="readonly"> <a href="javascript:pamount('+i+');totalprice();">+</a></td>';
						divs+='</tr>';								
						divs+='</table>';
						divs+='</form>';
					}
				}
				
				document.getElementById('cartList').innerHTML=divs;
				totalprice();
			}
		}
	}
	function totalprice(){
		
		var total = document.getElementsByName("amount");
		var price = document.getElementsByName("price");
		var j = 0;
		
		for(var i = 0;i<total.length;i++){
				var result = parseInt(total[i].value)*getNumString(price[i].value);
				j+=parseInt(result);
			
		}
		document.getElementById("tprice").innerText= '총 주문금액  : '+setComma(j)+' 원';
		
	}
	function gomenu(idx){
		location.href='shop_menuList.do?shop='+idx;
	}
</script>
</head>
<body>
<!-- 메뉴 -->
<div>메뉴화면</div>
<!-- List -->
<div id="content">
	<table width="100%" border="1">
		<tr>
			<td id="cartList" width="100%" >
			
			</td>
		</tr>	
	</table>
</div>

<!-- button -->
<div id="footer">

<table style="width: 100%;height: 80px;" border="1">
	<tr>
		<td colspan="2">
			<!-- totalprice -->
			<div id="tprice">총 주문금액 : 0 원</div>
		</td>
	</tr>
	<tr>
		<td onClick="gomenu('${param.shop}')">
			메뉴보기
		</td>
		<td onClick="goOrder()">
			주문하기
		</td>
	</tr>
</table>
</div>
</body>
</html>