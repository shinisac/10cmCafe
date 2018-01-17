<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert('${msg}');
if(${result==1}){
	location.href='shopPageMain.do?shop_idx=${shop_idx}&shop_name=${shop_name}';
}else {
	location.href='shopPageindex.do';
}
</script>