<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>10Cm_CAFE</title>
<style>
body{
	margin: 0px;
}
	.selcolor{
		background-color: green;
	}
	div table{
		width: 100%;

	}
	#amounttype{
		font-size:20px;
		text-align: center;
	}
	#amounttype a{
		text-decoration: none;
		font-weight: bold;
		color: black;
	}
	.intext{
		border: 0px;
	}
	#footer{
		position: fixed;
		bottom: 0;
		width:100%;
		background-color:  #D6C8A1;
		
	}

	#backpop{
	position:fixed;
	top:0px;
	left:0px;
	width:100%;
	height:100%;
	background: rgba(0, 0, 0, 0.8);
	opacity:1;
	z-index:1000;

	}

	#popup{
		position:absolute;
		width:330px;
		height:180px;
		background-color: #D6C8A1;
	
	}	
</style>
<script src="js/httpRequest.js"></script>
<script src="js/Num.js"></script>
<script>

	function show(idx){//요청함수
		//alert(idx);
		var param = 'order_menu_idx='+idx;
		param+='&order_menu_name=${menucontent.menu_name}';
		param+='&order_menu_amount='+document.getElementById('amount').value;
		param+='&order_menu_price=${menucontent.menu_price}';
		param+='&order_menu_optiona='+document.getElementById('optiona').value;
		param+='&order_menu_optionb='+document.getElementById('optionb').value;
		param+='&order_menu_optionc='+document.getElementById('optionc').value;
		param+='&shop_idx=${param.shop}';
		sendRequest('cartIn.do',param,showResult,'GET');
	}
	
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;

				var clientW = $(window).width();
			    var clientH = $(window).height();
			    var scroll = $(window).scrollTop();
			    var popW = $("#popup").width();
			    var popH = $("#popup").height();
			    
			    var positionX = (clientW/2) -(popW/2);
			    var positionY = (clientH/2) -(popH/2)+scroll;

			    $("#popup").css({
			        "left":positionX,
			        "top":positionY,
			    }); 
				$("#backpop").show();
				
			}
		}
	}
	
	function closePop(){
		$("#backpop").hide();
	}

	
	$(document).ready(function() {
	    $('#option_HOT').click(function() {
			$('#optiona').val('HOT'); 
			$('#option_HOT').addClass("selcolor");
			$('#option_ICE').removeClass("selcolor");
	    }).css('cursor', 'pointer');
	    $('#option_ICE').click(function() {
	    	$("#optiona").val('ICE');
	    	$('#option_ICE').addClass("selcolor");
	    	$('#option_HOT').removeClass("selcolor");
	    }).css('cursor', 'pointer');
	    
	    $('#option_re').click(function() {
			$('#optionb').val('레귤러'); 
			$('#option_re').addClass("selcolor");
			$('#option_la').removeClass("selcolor");
	    }).css('cursor', 'pointer');	    
	    $('#option_la').click(function() {
	    	$("#optionb").val('라지');
	    	$('#option_la').addClass("selcolor");
	    	$('#option_re').removeClass("selcolor");
	    }).css('cursor', 'pointer');
	    
	    
	    $('#option_in').click(function() {
			$('#optionc').val('매장'); 
			$('#option_in').addClass("selcolor");
			$('#option_out').removeClass("selcolor");
	    }).css('cursor', 'pointer');	    
	    $('#option_out').click(function() {
	    	$("#optionc").val('포장');
	    	$('#option_out').addClass("selcolor");
	    	$('#option_in').removeClass("selcolor");
	    }).css('cursor', 'pointer');	    
	});

	function amount(obj){
		var amounts = document.getElementById('amount').value;
		if(obj==0&&amounts>1){
			document.getElementById('amount').value=(parseInt(amounts)-1);
		}else if(obj==1){
			document.getElementById('amount').value=(parseInt(amounts)+1);
		}
		var totalprice = parseInt('${menucontent.menu_price}')*parseInt(document.getElementById('amount').value); 
		document.getElementById('totalprice').innerHTML='총 결재 금액    '+setComma(totalprice)+' 원';
	}
	function goOrder(){
		fm_menu.submit();
		
	}
	
</script>
</head>
<body>

<form name="fm_menu" action="order.do" method="POST">
<div><a href="javascript:history.back()">뒤로가기</a> <a href="go_cart.do?shop=${param.shop}">장바구니</a></div>
<!-- 메뉴정보관련 div -->
<div>
<table border="1">
<tr>
	<td rowspan="2"> 
		${menucontent.menu_img}<input type="hidden" name="shop" value="${param.shop}">
	</td>
	<td>
		<input class="intext" type="text" name="order_menu_name" value="${menucontent.menu_name}">
	</td>
</tr>
<tr>

	<td>
		<fmt:formatNumber value="${menucontent.menu_price}" pattern="#,##0" /><input   class="intext" type="hidden" name="order_menu_price" value="${menucontent.menu_price}">
		
	</td>
</tr>
</table >
</div>
<div>
	<table border="1">
		<tr>
			<td>amount</td>
			<td id="amounttype"><a href="javascript:amount('0')">-</a> <input type="text" name="order_menu_amount" size="1"id="amount" value="1" readonly="readonly"> <a href="javascript:amount('1')">+</a></td>
		</tr>
		<tr>
			<td>HOT/ICE</td>
			<td><label id="option_HOT">HOT</label> / <label id="option_ICE">ICE</label><input type="hidden" id="optiona" name="order_menu_optiona" value="HOT"></td>
		</tr>
		<tr>
			<td>사이즈</td>
			<td><label id="option_re">레귤러</label> / <label id="option_la">라지</label><input type="hidden" id="optionb" name="order_menu_optionb" value="레귤러"></td>
		</tr>
		<tr>
			<td>포장</td>
			<td><label id="option_in">매장</label> / <label id="option_out">포장</label><input type="hidden" id="optionc" name="order_menu_optionc" value="매장"></td>
		</tr>
	</table>
</div>
<div id="footer">
	<table border="1">
		<tr>
			<td colspan="2" id="totalprice">
				총 결재 금액 <fmt:formatNumber value="${menucontent.menu_price}" pattern="#,##0" /> 원
			</td>
		</tr>
		<tr style="cursor:pointer;">
			<td onclick="show('${menucontent.menu_idx}');">
				장바구니
			</td>
			<td onclick="goOrder();">
				바로 주문하기
			</td>			
		</tr>
	</table>
</div>

<div id="backpop" style="display: none;">
	<div id="popup">
		<h2>추가되었습니다.</h2>
		<a href="javascript:closePop()">닫기</a>
	</div>
</div>
</form>
</body>
</html>