<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
alert('${msg}');
location.href="invenDetail.do?cp="+${cp}+"&idx="+${idx}+"&state="+'${state}'+'&shop_idx='+${shop_idx};
</script>