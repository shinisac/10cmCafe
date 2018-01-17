<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert('${msg}');
	location.href='menuList.do?cp='+${cp}+"&shop_idx="+${shop_idx}+"&shop_name="+'${shop_name}';
</script>