<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert('${msg}')
if(${result}>0){
	window.close();
	opener.location.reload();
}else{
	location.href='baljuContent.do?balju_idx='+${balju_idx};
}
</script>