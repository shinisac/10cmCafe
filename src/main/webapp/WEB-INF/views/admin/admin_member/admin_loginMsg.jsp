<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert('${msg}');
if(${result==1}){
	location.href='admin_indexForm.do';
}else {
	location.href='admin_index.do';
}
</script>