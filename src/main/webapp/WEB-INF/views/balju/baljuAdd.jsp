<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<script src="http://code.jquery.com/jquery-1.7.js"
   type="text/javascript"></script>
<script src="js/jquery.bpopup.min.js"></script>
<script type="text/javascript">
   function go_popup() {
      $('#popup').bPopup();

   }
</script>

<script src="js/httpRequest.js"></script>
<script>
   var count = 0;

   function show(idx) {
      var param = 'shop_idx=' + idx;
      var result = false;
      var chk = document.getElementsByName('ck');

      for (i = 0; i < chk.length; i++) {
         if (chk[i].checked == true) {
            result = true;
            param += '&ck=' + chk[i].value;
         }
      }
      if (result == true) {
         sendRequest('materialAdd.do', param, showResult, 'GET');
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
            var result=false;
            var str = "";
            str += '<tr><th>물품번호</th><th>물품이름</th><th>물품규격</th><th>물품가격</th><th>물품수량</th></tr>';
            for (var i = 0; i < list.length; i++) {
               
               str += '<tr><td class="bottomline"><input type="text" class="textline" name="balju_list['+i+'].material_idx" value="'+list[i].material_idx+'" readonly></td>';
               str += '<td class="bottomline"><input type="text" class="textline" name="balju_list['+i+'].material_name" value="'+list[i].material_name+'" readonly></td>';
               str += '<td class="bottomline"><input type="text" class="textline" name="balju_list['+i+'].material_size" value="'+list[i].material_size+'" readonly></td>';
               str += '<td class="bottomline"><input type="text" class="textline" name="balju_list['+i+'].material_price" value="'+list[i].material_price+'" readonly></td>';
               str += '<td class="bottomline"><input type="number" class="idx" name="balju_list['+i+'].material_amount"></td></tr>';
               
            }
            str += '<tr><td colspan="5" align="center"><input type="button" value="발주신청" onclick="goSubmit()" id="update"></td></tr>';
            
            document.getElementById('table').innerHTML = document
                  .getElementById('table').innerHTML + str;
         }

      }
   }
</script>
<script>
function goSubmit(){
   var result=true;
   
   var idx =document.getElementsByClassName('idx');
   for(var i=0;i<idx.length;i++){
      if(idx[i].value==''){
         result=false;
      }
   }

   if(result==false){
      alert('수량을 입력해 주세요');
   }else{
      document.baljuAddForm.submit();
   }
}
</script>

<style>
.bottomline {
   border-bottom: 1px solid;
}

.textline {
   border: 0px;
   text-align: center;
}

.Pstyle {
   opacity: 0;
   display: none;
   position: relative;
   width: auto;
   border: 5px solid #fff;
   padding: 20px;
   background-color: #fff;
}
</style>
<style>
.dates {
   border: 0px;
   width: 30px;
   margin: 0px 0px 0px 0px;
   text-align: center;
}

.date2 {
   border: 0px;
   width: 15px;
   margin: 0px 0px 0px 0px;
}

#di {
   display: none;
   width: 80px;
   text-align: center;
   border: 1px solid gray;
   height: 22px;
   padding: 0px 0px 0px 0px;
   box-shadow: 0px 0px 1px 0px inset;
   float: left;
}

.search {
   float: left;
   padding: 0px 5px 0px 5px;
}

article table {
   margin: 40px auto;
   width: 850px;
   text-align: center;
   border-collapse: collapse;
}

article table th {
   height: 40px;
   background-color: #EAEAEA;
   border-bottom: 2px solid #ddd;
}

article table td {
   text-align: center;
   border-bottom: 2px solid #ddd;
   height: 35px;
}

article table th a {
   color: black;
   text-decoration: none;
}

#cur:hover {
   cursor: pointer;
}

#main tr:hover {
   background-color: #E6FFFF;
}

#update {
   border: none; /*---테두리 정의---*/
   background-Color: darkgray; /*--백그라운드 정의---*/
   font: 12px 굴림; /*--폰트 정의---*/
   font-weight: bold; /*--폰트 굵기---*/
   color: white; /*--폰트 색깔---*/
   width: 80px;
   height: 30px; /*--버튼 크기---*/
}
#fd{
   width: 850px;
   margin: 0px auto;
   border: 1px solid darkgray;
}
</style>

</head>
<body id="body">
   <%@include file="../admin_header2.jsp"%>
   <form name="baljuAddForm" action="baljuAdd_ok.do">
      <input type="hidden" name="shop_idx" value="${shop_idx }"> <input
         type="hidden" name="shop_name" value="${shop_name }">
      <section align="center">
         <div class="wrapper">
            <div id="welcome" class="container">
               <div class="title">
                  <h3 align="center">발주신청</h3>
                  <br>
                  <br>
                  <article>


                     <fieldset id="fd">
                        <legend>
                           <h3>매장확인</h3>
                        </legend>
                        매장번호 : ${shop_idx }<br> 매장이름 : ${shop_name }<br><br> 
                        <input type="button" value="추가" onclick="go_popup('${shop_idx}')" id="update">
                     </fieldset>
                  </article>
                  <article>
                     <div id="popup" class="Pstyle">

                        <div class="content" style="height: auto; width: auto;">
                           <input type="hidden" name="shop_idx" value="${shop_idx }">
                           <table border="1">
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
                                       <td><input type="checkbox" name="ck"
                                          value="${dto.material_idx}"></td>
                                       <td>${dto.material_idx }</td>
                                       <td>${dto.material_name }</td>
                                       <td>${dto.material_size }</td>
                                       <td><fmt:formatNumber value="${dto.material_price }" pattern="#,##0" /></td>
                                    </tr>
                                 </c:forEach>
                              </tbody>
                              <tfoot id="foot">
                                 <tr>
                                    <td colspan="6" align="center"><input type="button"
                                       class="b-close" value="추가" onclick="show('${shop_idx}'),this.disabled=true; this.value='추가하는중'"
                                       id="update"></td>
                                 </tr>

                              </tfoot>
                           </table>
                        </div>
                     </div>
                  </article>
                  <article>
                     <div id="add">
                        <table id="table" align="center">
                           <tr>
                              <td id="td"></td>
                           </tr>

                        </table>
                     </div>
                  </article>
               </div>
            </div>
         </div>
      </section>
   </form>
</body>
</html>