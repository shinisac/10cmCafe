<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<form name="">
	<table width="500">
		<tr>
			<th>메뉴 이미지</th>
			<th>메뉴</th>
			<th>가격</th>
			<th>&nbsp;</th>
			<th>&nbsp;</th>
		</tr>
		<tr><td>&nbsp;</td></tr>
		<c:if test="${empty dto }">
			<tr>
				<td colspan="5">즐겨찾기 메뉴가 없습니다</td>
			</tr>
		</c:if>
		<c:forEach var="arr" items="${dto}">
			<tr>
				<th><img src="img/menu/${arr.menu_img}" width="50" height="50"></th>
				<th>${arr.menu_name }</th>
				<th><fmt:formatNumber value="${arr.menu_price }" pattern="#,##0" /></th>
				<th><input type="button" data-target="#productModal" data-toggle="modal" value="주문하기" onclick="menushow('${arr.menu_idx}')" id="button"></th>
				<th>
					<a href="javascript:;" onClick="bookMenuAdd(${arr.menu_idx})" ><img src="img/star1.jpg"></a>
				</th>
				<!-- <th><a href="bookMenuAdd.do?shop_idx=${arr.shop_idx }&menu_idx=${arr.menu_idx}"><img src="img/star1.jpg"></a></th> -->
			</tr>
		</c:forEach>
		<tr>
			<input type="hidden" name="cp" id="cp" value="${cp}">
		</tr>
	</table>
</form>
