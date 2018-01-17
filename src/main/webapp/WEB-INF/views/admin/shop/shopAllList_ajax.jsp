<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<tr>
	<td>
		<table id="contentlist">
			<tr>
				<th>체크</th>
				<th>상태</th>
				<th>지점명</th>
				<th>주소</th>
				<th>전화번호</th>

			</tr>
			<!-- 이프문 -->
			<c:if test="${empty shopList}">
				<tr>
					<td colspan="5">등록된 매장이 없습니다.</td>
				</tr>
			</c:if>

			<c:forEach var="arr" items="${shopList}">
				<tr align="center" onClick="shopcontent('${arr.shop_idx}');">
					<td>${arr.shop_idx}</td>

					<td>공백</td>

					<td>${arr.shop_name}</td>
					<td>${arr.shop_area} &nbsp;${arr.shop_addr}</td>
					<td>${arr.shop_tel}</td>

				</tr>

			</c:forEach>
		</table>
	</td>
</tr>
<tr id="page">
	<td colspan="5">${page}</td>
</tr>