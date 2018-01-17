<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<style>
   #reserve{
      float: left;
   }
   #detail{
      float: right;
   }
   #fd{
      width: 300px;
   }
   th{
      float: left;
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
   #orderTable{
      	 width: 850px;
         border: 1px solid white;
         border-spacing: 15px;      
   }
   #orderTable td{
         border-radius: 10px;
         width: 150px;
         font-weight: bold; /*--폰트 굵기---*/
   }
   #fd{
      border: 1px solid ligthgray;
      border-radius: 10px;
   }
</style>
<script src="js/Num.js"></script>
<script src="js/httpRequest.js"></script>
<script>
   var count = 0;

   function show(idx) {
      
      sendRequest('orderDetail.do', 'idx=' + idx, showResult, 'GET');
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

            count++;
            var date2=foo(dto.order_date);
         	var date = foo(dto.order_date);
            var newItem = document.createElement('div');
            newItem.setAttribute('id', 'menu' + count);
            var look = document.getElementById('menuList');
            look.outerHTML = '<div id="menuList"></div>';
            var totalprice=0;
            var str = '<table><tr><th>주문번호:</th><td>'
                  + dto.order_idx
                  + '</td></tr><tr><th>주문상태:</th><td>'
                  + dto.order_state
                  + '</td></tr><tr><th>주문시간:</th><td>'
                  + date2
                  + '</td></tr><tr><th>메뉴순서:</th><td>'
                  + dto.order_menu_turn
                 
          
                     
                
                  for(var i=0; i<list.length; i++){
                     str+='</td></tr><tr><td colspan="2">---------------------------------------------------'
                     str+= '</td></tr><tr><th>메뉴이름:</th><td>'
                      str+= list[i].order_menu_name
                     str+= '</td></tr><tr><th>메뉴수량:</th><td>'
                      str+= list[i].order_menu_amount
                      str+= '개</td></tr><tr><th>메뉴가격:</th><td>'
                 str+=   setComma(list[i].order_menu_price*list[i].order_menu_amount)
                      str+= '원</td></tr><tr><th>HOT/ICE:</th><td>'
                      str+= list[i].order_menu_optiona
                      str+= '</td></tr><tr><th>SIZE:</th><td>'
                      str+= list[i].order_menu_optionb
                      str+= '</td></tr><tr><th>Takteout/Stroe:</th><td>'
                      str+= list[i].order_menu_optionc
                      
                      totalprice += list[i].order_menu_price*list[i].order_menu_amount;
                     
                  }
                  
                  str+= '</td></tr><tr><td colspan="2">---------------------------------------------------</td></tr>'
                 
                  str+='<tr><th>총 주문금액:</th><td>'+setComma(totalprice)+'원</td></tr>'
                 +'<tr><td colspan="2" align="right">'
                     if(dto.order_state=='예약접수'){
                        str += '<input type="button" id="update" value="주문접수" onclick="reserveChange('+dto.order_idx+','+dto.shop_idx+')">';
                     }else{
                        str += '<input type="button" id="update" value="주문완료" onclick="orderChange('+dto.order_idx+','+dto.shop_idx+')">&nbsp;&nbsp;';
                        str += '<input type="button" id="update" value="주문삭제" onclick="orderDel('+dto.order_idx+','+dto.shop_idx+')">';
                     }
                  str+='</td></tr>'
                  +'</table>';
            newItem.innerHTML=str;
            var menuList = document.getElementById('menuList');
            menuList.prepend(newItem);
            
         }
      }
   }
   function reserveChange(idx,shop_idx) {
      location.href='reserveOk.do?idx='+idx+'&shop_idx='+shop_idx;
   }
   function orderChange(idx,shop_idx) {
      location.href='orderOk.do?idx='+idx+'&shop_idx='+shop_idx;
   }
   function orderDel(idx,shop_idx){
      location.href='orderDel.do?idx='+idx+'&shop_idx='+shop_idx;
   }
</script>
<script>
//선택시 체크박스 전체선택
function allcheck()
   {
   var ckl=document.fm.ck.length;
   
   for(i=0;i<ckl;i++)
      {
      if(document.fm.allck.checked)
         {
         document.fm.ck[i].checked=true;
         }
      else{
         document.fm.ck[i].checked=false;
         }
      }
   }
</script>
</head>
<body>
   <%@include file="../admin_header2.jsp" %>
      <div class="wrapper">
         <div id="welcome" class="container">
            <div class="title"><h3 align="center">주문현황</h3></div>
            <section align="left">
            <article>
               <c:set var="i" value="0" />
               <c:set var="j" value="5" />
               
               <table align="left" id="orderTable">
                  <tbody>
                     <c:if test="${empty list }">
                        <tr>
                           <td align="center">등록된 주문이 없습니다.</td>
                        </tr>
            
                     </c:if>
                     <c:forEach var="dto" items="${list}">
                        <c:if test="${i%j==0 }">
                           <tr>
                        </c:if>
                        <c:if test="${dto.order_state eq '주문접수' }">
                           <td bgcolor="#FFD9FA" onclick="show('${dto.order_idx}')">
                              주문번호 : ${dto.order_idx }<br> --------------------------<br>
                              주문날짜 <br><fmt:formatDate value="${dto.order_date }" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /><br>
      
                           </td>
                        </c:if>
                        <c:if test="${dto.order_state eq '예약접수' }">
                           <td bgcolor=#D4F4FA onclick="show('${dto.order_idx}')">주문번호 :
                              ${dto.order_idx }<br> --------------------------<br> 주문날짜
                              <br><fmt:formatDate value="${dto.order_date }" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /><br>
                           </td>
                        </c:if>
                        <c:if test="${i%j==j-1}%5==0">
                           </tr>
                        </c:if>
                        <c:set var="i" value="${i+1 }" />
                     </c:forEach>
                     <section id="detail">
                        <fieldset id="fd">
                           <h3>주문 상세내역</h3>
                           <div id="menuList"></div>
                        </fieldset>
                     </section>
                  </tbody>
               </table>
            </div>
         </article>
   </section>   
      </div>
</body>
</html>



