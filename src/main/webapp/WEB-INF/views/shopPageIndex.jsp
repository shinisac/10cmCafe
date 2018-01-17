<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/Num.js"></script>
<%-- <c:if test="${empty sessionScope.id }">
<script>
alert('로그인이 필요한 페이지입니다.');
location.href='shopPageMain.do';	
</script>
</c:if> --%>
 <script type="text/javascript">
      google.charts.load('current', {'packages':['line']});
      google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
      
   	  var sum=${dto.ja+dto.fa+dto.march+dto.ap+dto.ma+dto.june+dto.ju+dto.au+dto.sa+dto.oc+dto.no+dto.de};  
      var sum2=${dto2.ja+dto2.fa+dto2.march+dto2.ap+dto2.ma+dto2.june+dto2.ju+dto2.au+dto2.sa+dto2.oc+dto2.no+dto2.de};
      var sum3=${dto3.ja+dto3.fa+dto3.march+dto3.ap+dto3.ma+dto3.june+dto3.ju+dto3.au+dto3.sa+dto3.oc+dto3.no+dto3.de};
         
    	
      var data = new google.visualization.DataTable();
      data.addColumn('number', 'Month');
      data.addColumn('number', '2017년 매출\n총 매출:'+setComma(sum));
      data.addColumn('number', '2016년 매출\n총 매출:'+setComma(sum2));
      data.addColumn('number', '2015년 매출\n총 매출:'+setComma(sum3));
	     
	     
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
  </script>
<style type="text/css">
   div{
      margin: 0px auto;
   }
</style>
</head>
<body>
<%@include file="admin_header2.jsp" %>
<section align="center">
	<article>
		<%-- <div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<img alt="어드민로고" src="img/adminlogo.jpg" width="50" height="50">
				<h1><a href="#">10cm CAFE</a></h1>
			</div>
			<div id="menu"> 
				<ul>
					<li><a href="orderList.do?shop_idx=${shop_idx }">주문리스트</a></li>
					<li><a href="invenList.do?shop_idx=${shop_idx }">재고관리</a></li>
					<li><a href="whList.do?shop_idx=${shop_idx }">입고관리</a></li>
					<li><a href="baljuAdd.do?shop_idx=${shop_idx }">발주신청</a></li>
					<li><a href="baljuDetailList.do?shop_idx=${shop_idx }">발주리스트</a></li>
					<li><a href="sales.do?shop_idx=${shop_idx }&shop_name=${shop_name}">매출확인</a></li>
					<li><a href="logout.do">로그아웃</a></li>
				</ul>
				
			</div>
			
		</div>
		</div> --%>
		<div class="wrapper">
			<div id="welcome" class="container">
				<div class="title">
					<h3 align="center">매장 매출확인</h3>
					<div id="line_top_x"></div>
				</div>
			</div>
		</div>
	</article>
</section>
</body>
</html>