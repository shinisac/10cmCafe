<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<tr>
				<th>회원번호</th>
				<th>상태</th>	
				<th>ID</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>포인트</th>
				<th>가입일</th>
			</tr>
<!-- 이프문 -->
<c:if test="${empty allList }">
	<tr>
	<td colspan="6">등록된 회원이 없습니다.</td>
	</tr>
</c:if>	

<c:forEach var="arr" items="${allList }">
	<tr align="center">
		<td>${arr.member_idx}</td>
		
		<td>
			<input type="hidden" name="member_idx" value="${arr.member_idx }">
			<select name="levelsel" onchange="member_state(this.form,'${arr.member_email }',this.value)">
				<c:if test="${arr.member_state=='일반' }">
				<option value="일반">일반</option></c:if>
				<c:if test="${arr.member_state=='대기' }">
				<option value="대기" >대기</option></c:if>
				<c:if test="${arr.member_state=='정지' }">
				<option value="정지">정지</option></c:if>
				<c:if test="${arr.member_state=='탈퇴' }">
				<option value="탈퇴">탈퇴</option></c:if>
			</select>
						<!-- 숨겨둔 인풋 -->
			<input type="hidden" name="f_sel" id="f_sel" value="${sel}">
			<input type="hidden" name="f_tx" id="f_tx" value="${tx}">
			<input type="hidden" name="f_cp" id="f_cp" value="${cp}">
		</td>	
								
		<td id="cur" onClick="memberinfo('${arr.member_idx}')">${arr.member_email}</td>
		<td id="cur" onClick="memberinfo('${arr.member_idx}')">${arr.member_name}</td>							
		<td id="cur" onClick="memberinfo('${arr.member_idx}')">${arr.member_phone}</td>
		<td id="cur" onClick="memberinfo('${arr.member_idx}')"><fmt:formatNumber value="${arr.member_point}" pattern="#,##0" /></td>
		<td id="cur" onClick="memberinfo('${arr.member_idx}')">${arr.member_date}</td>

	</tr>	
	
</c:forEach>
	<tr>
		<td colspan="7">${pagestr }</td>
	</tr>
	