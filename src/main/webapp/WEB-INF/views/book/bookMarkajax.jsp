<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<form name="">
<table width="300">
   <tr>
      <td colspan="3" align="center">매장</td>
   </tr>
   <tr><td>&nbsp;</td></tr>
   <c:if test="${empty dto }">
      <tr>
         <td>즐겨찾기 매장이 없습니다</td>
      </tr>
   </c:if>   
   
   <c:forEach var="arr" items="${dto}">
   <tr>
      <td><a href="shop_menuList.do?shop=${arr.shop_idx }"><img src="img/shop/shop${arr.shop_img }.jpg" width="100" height="100"></a></td>
      <td><a href="shop_menuList.do?shop=${arr.shop_idx }">${arr.shop_name }</a></td>
      <td><a href="javascript:bookMarkAdd('${arr.shop_idx }')">&nbsp;&nbsp;&nbsp;&nbsp;<img src="img/star1.jpg"></a></td>
   </tr>   
   </c:forEach>
   <tr>
   <input type="hidden" name="cp" id="cp" value="${cp}">
   
   </tr>
</table>
</form>