<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
   <div class="table-wrapper">
<form name="myPoint">


<h3 align="center"> 포인트 적립 및 사용내역</h3>
		
<h4 align="right">토탈 포인트: <fmt:formatNumber value="${getPoint}" pattern="#,##0" />점</h4>
		
	<table  class="table table-hover" id="myPointForm" >
	
			<tr>
			<td>날짜</td>
			<td>매장정보</td>
			<td>구분</td>
			<td>포인트</td>
			
		</tr>
	<c:if test="${empty dto }">
		<tr>
			<td colspan="4" align="center">적립 및 사용내역이 없습니다</td>
		</tr>
	</c:if>

	<c:forEach var="arr" items="${dto}">
		<tr>
			<td><fmt:formatDate value="${arr.point_date }" type="DATE" pattern="yyyy/MM/dd HH:mm:ss" /></td>
			<td>${arr.shop_name }</td>
			<c:if test="${arr.point_save!=0}">
				<c:if test="${empty arr.point_event }">
					<td>적립</td>
					<td><fmt:formatNumber value="${arr.point_save }" pattern="#,##0" /></td>
				</c:if>
				<c:if test="${!empty arr.point_event }">
					<td>${arr.point_event}</td>
					<td><fmt:formatNumber value="${arr.point_save }" pattern="#,##0" /></td>
				</c:if>

			</c:if>
			<c:if test="${arr.point_use!=0}">
			<td>사용</td>
			<td> <fmt:formatNumber value="${arr.point_use }" pattern="#,##0" /></td>
			</c:if>
		</tr>
	</c:forEach>

	<tr>
	<input type="hidden" name="cp" id="cp" value="${cp}">
	<c:if test="${!empty dto }">
      <td colspan="4" align="center"> ${pagestr }</td>
   </c:if>
	</tr>

	</table>
	
</form>
</div>
