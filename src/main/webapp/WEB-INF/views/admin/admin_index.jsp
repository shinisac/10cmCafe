<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<script src="js/Num.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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
  </script>
  <style type="text/css">
	div{
		margin: 0px auto;
	}
</style>
<meta name="keywords" content="" />
<meta name="description" content="" />
<linkhref="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
<%@include file="../admin_header.jsp" %>
	<div class="wrapper">
		<div id="welcome" class="container">
			<div id="line_top_x"></div>
		</div>
	</div>
</body>
</html>