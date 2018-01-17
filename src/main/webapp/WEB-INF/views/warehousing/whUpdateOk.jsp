<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert('${msg}');
	location.href='whContent.do?idx='+${wh_idx}+'&cp='+${cp}+'&shop_idx='+${shop_idx};
</script>