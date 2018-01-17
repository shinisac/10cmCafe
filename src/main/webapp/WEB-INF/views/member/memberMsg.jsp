<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:choose>
	<c:when test="${msg eq '로그인 완료'}">	
	<script>	
		location.href='${page}';
	</script>
	</c:when> 
	<c:otherwise>
	<script>
	
		window.alert('${msg}');
		location.href='${page}';
	
	</script>	
	</c:otherwise>
</c:choose>