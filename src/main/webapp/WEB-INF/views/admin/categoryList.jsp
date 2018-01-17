<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<thead>
	<tr>
		<td colspan="7">
			<div style="float: right;">
				<input type="hidden" name="cp" value="${cp }">
				<input type="button" value="등록" id="update" onclick="cateWrite()">
				<input type="button" value="삭제" id="update" onclick="goSubmit()">
			</div>

		</td>
	</tr>
	<tr>
		<th><input type="checkbox" name="allck" onchange="show()"></th>
		<th>번호</th>
		<th>이름</th>
		<th>이미지</th>
	</tr>
</thead>
<tfoot>
	<tr>
		<td colspan="5" align="center">${pageStr }</td>
	</tr>
</tfoot>
<tbody>
	<c:if test="${empty list }">
		<tr>
			<td colspan="5" align="center">등록된 재고가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${list }">
		<tr>
			<td><input type="checkbox" name="ck" value="${dto.category_idx }"></td>
			<td onclick="cateReWrite('${dto.category_idx}')">${dto.category_idx }</td>
			<td onclick="cateReWrite('${dto.category_idx}')">${dto.category_name }</td>
			<td onclick="cateReWrite('${dto.category_idx}')">
			<img src="img/menu/${dto.category_img }" width="150" height="150"></td>
		</tr>
	</c:forEach>
</tbody>
