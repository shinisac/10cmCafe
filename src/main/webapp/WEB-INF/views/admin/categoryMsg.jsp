<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert('${msg}');
if(${result>0}){
	location.href='categoryListForm.do?cp=${cp}';
}else{
	location.href='categoryListForm.do?cp=${cp}';
}
</script>