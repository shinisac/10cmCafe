<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<script src="js/Num.js"></script>
<script type="text/javascript" src="js/date.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
    <script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      
   	  var sum=${dto.ja+dto.fa+dto.march+dto.ap+dto.ma+dto.june+dto.ju+dto.au+dto.sa+dto.oc+dto.no+dto.de};  
      var sum2=${dto2.ja+dto2.fa+dto2.march+dto2.ap+dto2.ma+dto2.june+dto2.ju+dto2.au+dto2.sa+dto2.oc+dto2.no+dto2.de};
      var sum3=${dto3.ja+dto3.fa+dto3.march+dto3.ap+dto3.ma+dto3.june+dto3.ju+dto3.au+dto3.sa+dto3.oc+dto3.no+dto3.de};
         
    	
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Month');
      data.addColumn('number', '2018년 매출\n총 매출:'+setComma(sum));
      data.addColumn('number', '2017년 매출\n총 매출:'+setComma(sum2));
      data.addColumn('number', '2016년 매출\n총 매출:'+setComma(sum3));
	     
	     
      data.addRows([
          [1,  ${dto.ja},  ${dto2.ja}, ${dto3.ja}],
          [2,  ${dto.fa}, ${dto2.fa}, ${dto3.fa}],
          [3,  ${dto.march}, ${dto2.march}, ${dto3.march}],
          [4,  ${dto.ap}, ${dto2.ap}, ${dto3.ap}],
          [5,  ${dto.ma}, ${dto2.ma}, ${dto3.ma}],
          [6,  ${dto.june}, ${dto2.june}, ${dto3.june}],
          [7,  ${dto.ju}, ${dto2.ju}, ${dto3.ju}],
          [8,  ${dto.au}, ${dto2.au}, ${dto3.au}],
          [9,  ${dto.sa}, ${dto2.sa}, ${dto3.sa}],
          [10, ${dto.oc}, ${dto2.oc}, ${dto3.oc}],
          [11, ${dto.no}, ${dto2.no}, ${dto3.no}],
          [12, ${dto.de}, ${dto2.de}, ${dto3.de}],
        ]);

      var options = {
        chart: {
          title: 'KH커피 매출확인',
          subtitle: '월 매출(단위:만원)'
        },
        width: 800,
        height: 500,
        axes: {
          x: {
            0: {side: 'top'}
          }
        }
      };

      var chart = new google.charts.Line(document.getElementById('line_top_x'));

      chart.draw(data, google.charts.Line.convertOptions(options));
    }
    function show(){
		var salesSearcha=document.salesSearch.startdate.value;
		var salesSearchb=document.salesSearch.enddate.value;
		if(salesSearcha==""){
			alert('날짜를 입력해주세요.');
			return;
		}else if(salesSearchb==""){
			alert('날짜를 입력해주세요.');
			return;
		}else{
			salesSearch.submit();
		}
	}
  </script>
<style type="text/css">
	div{
		margin: 0px auto;
	}
	a:link{
		text-decoration:none;
	}
	a:visited{
		text-decoration:none;
	}
</style>
</head>
<body>
<%@include file="../admin_header2.jsp"%>
<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title"><h3 align="center">${shop_name }매장 매출확인</h3></div>
			<section>
	<article>
		<table border="0" cellspacing="0" width="1000" align="center">
			<tr>
				<th align="left" width="200">오늘 매출 현황</th>
				<td><fmt:formatNumber value="${todayPrice}" pattern="#,##0" />원</td>
			</tr>
			<tr>
				<th align="left" width="200">오늘 주문 건수</th>
				<td><fmt:formatNumber value="${todayCount}" pattern="#,##0" />건</td>
			</tr>
		</table>
		<br>
		
		<div id="line_top_x"></div>
		
		<form name="salesSearch" action="sales.do" method="POST">
		<input type="hidden" name="shop_name" value="${shop_name }">
		<input type="hidden" name="shop_idx" value="${shop_idx }">
		<input type="hidden" name="cp" value="${cp }">
			<table border="0" cellspacing="0" width="1000" align="center">
					<tr>
						<td colspan="5">
							<div style="float: left;">
		                  		<input type="button" value="차트보기" onclick="drawChart()" id="update">
		                  	</div>
							<div style="float: right;">
								<input type="text" name="startdate" onclick = "datePicker(event,'startdate')" readonly> ~
			           		    <input type="text" name="enddate" onclick = "datePicker(event,'enddate')" readonly>
								<input type="button" value="검색" id="update" onclick="show()">
							</div>
							<div style="float: right;">	
							</div>
						</td>
					</tr>
				</thead>
				<tfoot>
					<tr>
					<c:if test="${!empty list }">
						<td colspan="6" align="center">
							${pageStr }
						</td>
					</c:if>
					<c:if test="${empty list }">
						<td colspan="6" align="center">
							<a href="sales.do?cp=1&shop_idx=${shop_idx}&shop_name=${shop_name}">메인으로</a>
						</td>
					</c:if>	
					<c:if test="${!empty date or !empty date2}">
						<td colspan="5" align="center">
							<a href="sales.do?cp=1&shop_idx=${shop_idx}&shop_name=${shop_name}">메인으로</a>
						</td>
					</c:if>
					</tr>
				</tfoot>
				<tbody>
					<tr>
						<th>주문번호</th>
						<th>결제방식</th>
						<th>주문상태</th>
						<th>메뉴가격</th>
						<th>주문날짜</th>
					</tr>
					<c:if test="${empty list }">
						<tr>
							<td align="center" colspan="5">등록된 주문이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list}">
						<tr>
								<td>${dto.order_idx}</td>
								<td>${dto.order_pay}</td>
								<td>${dto.order_state}</td>
								<td><fmt:formatNumber value="${dto.order_price}" pattern="#,##0" /></td>
								<td><fmt:formatDate value="${dto.order_date}" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</article>
</section>
		</div>
	</div>
</body>
</html>