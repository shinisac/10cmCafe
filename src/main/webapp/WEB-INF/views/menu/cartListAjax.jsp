<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

               		<c:set var="i" value="0"></c:set>
               		<c:set var="totalprice" value="0"></c:set>
                	<!-- 장바구니 내역 부분 시작 -->
                	<c:if test="${empty cartList}">
						<input type="hidden" name="chks" id="cartck" value="off">
					</c:if>
                	<c:forEach var="cartlist" items="${cartList}" >
                	<input type="hidden" name="chks" id="cartck" value="on">
                	<form id="${i}">
	                	 <table class="table-cart">
	                    <tr>
	                        <td class="title" style="width: 150px;">
	                        	<input type="hidden" name="idx" value="${cartlist.order_menu_idx}">
	                            <span class="name"><input class="intext" type="text" name="name" style="width: 80px" value="${cartlist.order_menu_name}"></span>
	                            <span class="caption text-muted">

		                            	<input class="lotext text-muted" type="text" size="1" style="width: 25px" name="optiona" value="${cartlist.order_menu_optiona}">,


		                            	<input class="lotext text-muted" type="text" size="1" style="width: 30px" name="optionb" value="${cartlist.order_menu_optionb}">,
		
	
		                            	<input class="lotext text-muted" type="text" size="1" style="width: 25px" name="optionc" value="${cartlist.order_menu_optionc}">
                            	                                                        
	                            </span>
	                        </td>
	                        <td class="price"><input class="intext" style="width: 60px" type="text" name="price" value="<fmt:formatNumber value="${cartlist.order_menu_price}" pattern="#,##0" />"></td>
	                        <td><a href="javascript:;" onclick="mamount('${i}');totalprice();cartcount();">-</a> <input type="text" class="intext" name="cartamount" size="1"id="cartamount" value="${cartlist.order_menu_amount}" readonly="readonly"> <a href="javascript:;" onClick="pamount('${i}');totalprice();cartcount();">+</a></td>
	                        <td class="actions">      
	                            <a href="javascript:;" onclick="cartdel('${i}')"><i class="ti ti-close"></i></a>
	                        </td>
	                    </tr>
	                	<!-- 장바구니 내역 부분 끝 -->
	                	</table>
                	</form>
                	<c:set var="i" value="${i+1}"></c:set>
                	<c:set var="totalprice" value="${totalprice+cartlist.order_menu_price*cartlist.order_menu_amount}"></c:set>
                	</c:forEach>
                
                <!-- 장바구니 토탈 정보 시작 -->
                <div class="cart-summary">
                    <hr class="hr-sm">
                    <div class="row text-lg">
                        <div class="col-7 text-right text-muted">Total:</div>
                        <div class="col-5" ><strong id="tprice"><fmt:formatNumber value="${totalprice}" pattern="#,##0" /></strong></div>
                    </div>
                </div>
                <!-- 장바구니 토탈 정보 끝-->  