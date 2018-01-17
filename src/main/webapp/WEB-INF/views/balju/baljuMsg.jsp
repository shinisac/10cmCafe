<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert('${msg}')
	if(${result2>0}){
		location.href='shopPageMain.do?shop_idx=${shop_idx}';
	}else{
		location.href='shopPageMain.do?shop_idx=${shop_idx}';
	}
</script>