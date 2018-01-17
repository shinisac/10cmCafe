<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<thead>
	<tr>
		<th>발주번호</th>
		<th>매장번호</th>
		<th>발주날짜</th>
		<th>발주상태</th>
	</tr>
</thead>
<tbody>
	<c:if test="${empty list2 }">
		<tr>
			<td colspan="4" align="center">등록된 발주가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto2" items="${list2 }">
		<tr>
			<td>${dto2.balju_idx }</td>
			<td>${dto2.shop_idx }</td>
			<td>${dto2.balju_date }</td>
			<td>${dto2.balju_state }</td>
		</tr>
	</c:forEach>
</tbody>
<tfoot>
	<c:if test="${!empty list2 }">
		<td colspan="4" align="center">${pageStr }</td>
	</c:if>
</tfoot>
