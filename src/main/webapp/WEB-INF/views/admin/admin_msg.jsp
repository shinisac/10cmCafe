<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.alert('${msg}');
	opener.parent.location.href='admin_memberListForm.do'; 
	window.self.close();
	//location.href='${page}';

</script>