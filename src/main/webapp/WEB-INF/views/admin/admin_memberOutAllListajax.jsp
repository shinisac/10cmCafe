<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<tr>
	<th><input type="checkbox" name="allck" onchange="show()"></th>
	<th>회원번호</th>
	<th>상태</th>
	<th>ID</th>
	<th>이름</th>
	<th>전화번호</th>
	<th>포인트</th>
	<th>가입일</th>
</tr>
<!-- 이프문 -->
<c:if test="${empty outList }">
	<tr>
		<td colspan="8">등록된 회원이 없습니다.</td>
	</tr>
</c:if>

<c:forEach var="arr" items="${outList }">
	<tr align="center">
	
		<td><input type="checkbox" name="ck" value="${arr.member_idx}"></td>
	
		<td>${arr.member_idx}</td>

		<td><input type="hidden" name="member_idx"
			value="${arr.member_idx }"> <select name="levelsel"
			onchange="member_state(this.form,'${arr.member_email }',this.value)">
				<c:if test="${arr.member_state=='탈퇴' }">
					<option value="탈톼ㅣ">탈퇴</option>
				</c:if>
		</select>
			<input type="hidden" name="f_sel" id="f_sel" value="${sel}">
			<input type="hidden" name="f_tx" id="f_tx" value="${tx}">
			<input type="hidden" name="f_cp" id="f_cp" value="${cp}">
	
		</td>
								<!-- 숨겨둔 인풋 -->

		<td id="cur" onClick="memberinfo('${arr.member_idx}')">${arr.member_email}</td>
		<td id="cur" onClick="memberinfo('${arr.member_idx}')">${arr.member_name}</td>
		<td id="cur" onClick="memberinfo('${arr.member_idx}')">${arr.member_phone}</td>
		<td id="cur" onClick="memberinfo('${arr.member_idx}')"><fmt:formatNumber value="${arr.member_point}" pattern="#,##0" /></td>
		<td id="cur" onClick="memberinfo('${arr.member_idx}')">${arr.member_date}</td>

	</tr>
</c:forEach>
<tr>
	<td colspan="8">${pagestr }</td>
</tr>