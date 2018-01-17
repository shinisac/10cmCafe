<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert('${msg}');
	if(${result}>0){
		opener.location.reload();
		window.close();
	}else{
		location.href='cateReWrtie.Ok.do';
	}
</script>