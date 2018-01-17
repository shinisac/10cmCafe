<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert('${msg}');
if(${result}==1){
	opener.location.reload();
	window.self.close();
}else{
	location.href='${gopage}';
}
</script>