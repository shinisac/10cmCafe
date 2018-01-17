<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

              <div class="modal-content">
            <div class="modal-header modal-header-lg dark bg-dark">
                <div class="bg-image"><img src="assets/img/photos/modal-add.jpg" alt=""></div>
                <h4 class="modal-title">Cart Order</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><i class="ti-close"></i></button>
            </div>
            <!-- 메뉴 상세정보 시작 -->
            <div class="modal-product-details">
                <div class="row align-items-center">
                <div class="col-10">
                                 
                                 <span class="text-muted"></span>
                                 <input type="hidden" name="shop" id="menu_shopidx" value="">
                                 <input type="hidden" name="order_menu_price" id="order_menu_price" maxlength="3" value="${menucontent.menu_price}">
                                 <input type="hidden" name="order_menu_idx" id="order_menu_idx" maxlength="3" value="${menucontent.menu_idx}">
                                 <input type="hidden" name="optionbs" id="optionbs" value="true">
             </div>

               <table style="width: 100%;">
                      <tr>
                         <td rowspan="2" style="width: 40%;">
                            <img src="img/menu/${menucontent.menu_img}" style="width: 150px; height: 111px;"> 
                           </td>
                           <td>
                              <input class="intext textcolor text-lg" type="text" name="order_menu_name" id="order_menu_name" value="${menucontent.menu_name}">
                           </td>
                           <td rowspan="2">
                               <a id="a_${ menucontent.menu_idx}" href="javascript:;" onClick="bookMenuAdd('${ menucontent.menu_idx}',${menucontent.book })"><img id="b_${ menucontent.menu_idx}" src="img/star${menucontent.book }.png"></a>
                           </td>
                        </tr>
                        <tr>
                           <td>
                              <div class="text-lg"><input   class="intext textcolor" type="text" id="mprice" name="mprice" value="<fmt:formatNumber value="${menucontent.menu_price}" pattern="#,##0" />"></div>
                           </td>
                        </tr>
               </table>
                </div>
            </div>
            <!-- 메뉴 상세정보 끝 -->
            <!-- 메뉴 옵션 시작 -->
            <div class="modal-body panel-details-container">
            <!-- 메뉴정보관련 div -->
            <div>
               <table style="width: 100%;">
                  <tr>
                     <td>amount</td>
                     <td id="amounttype"><a href="javascript:;" onClick="amount('0')"><label class="intext textbig">-</label></a>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="order_menu_amount" size="1"id="amount" value="1" class="intext textbig2"><a href="javascript:;" onClick="amount('1')"><label class="intext textbig">+</label></a></td>
                  </tr>
                  <tr>
                     <td>HOT/ICE</td>
                     <td>
                        <div class="checks">
                        <input type="hidden" id="optiona" name="optiona" value="HOT">
                               <input type="radio" id="HOT" name="order_menu_optiona" value="HOT"  onclick="optionaA()" checked> 
                               <label for="HOT"  onclick="optionaA()">HOT</label>&nbsp;&nbsp;&nbsp;
                               <input type="radio" id="ICE" name="order_menu_optiona" value="ICE"  onclick="optionaB()"> 
                               <label for="ICE"  onclick="optionaB()">ICE</label> 
                             </div>
                    
                            </td>
                  </tr>
                  <tr>
                     <td>사이즈</td>
                     <td>
                        <div class="checks">
                        <input type="hidden" id="optionb" name="optionb" value="레귤러">
                               <input type="radio" id="re" name="order_menu_optionb" value="레귤러" onClick="mapi()" checked > 
                               <label for="re" onClick="mapi()">레귤러</label>&nbsp;&nbsp;&nbsp;
                               <input type="radio" id="la" name="order_menu_optionb" value="라지" onClick="adpi()" > 
                               <label for="la" onClick="adpi()">라지</label> 
                             </div>   
                            </td>
                  </tr>
                  <tr>
                     <td>포장</td>
                     <td>
                        <div class="checks">
                        <input type="hidden" id="optionc" name="optionc" value="매장">
                               <input type="radio" id="in" name="order_menu_optionc" value="매장"   onclick="optioncA()" checked> 
                               <label for="in" value="매장"  onclick="optioncA()">매장</label>&nbsp;&nbsp;&nbsp;
                               <input type="radio" id="out" name="order_menu_optionc"   onclick="optioncB()"value="포장"> 
                               <label for="out" value="포장"  onclick="optioncB()">포장</label> 
                             </div>   
                            </td>
                  </tr>
               </table>
            </div>
            <div id="footer">
               <table style="width: 100%;border-top: 1px solid black;">
                  <tr>
                     <td colspan="2" id="totalprice" class="panel-details-title" style="text-align: right; font-size: 15px; font-weight: bold;">
                        총 결재 금액 : <fmt:formatNumber value="${menucontent.menu_price}" pattern="#,##0" /> 원
                     </td>
                  </tr>
               </table>
            </div>   
            </div>
            <!-- 메뉴 옵션 끝 -->
           <c:if test="${cart==1 }">
            <button type="button" class="modal-btn btn btn-secondary btn-block btn-lg" data-dismiss="modal" onclick="mshow('${menucontent.menu_idx}');"><span>Add to Cart</span></button>
            </c:if>
            <button type="button" class="modal-btn btn btn-secondary btn-block btn-lg" data-dismiss="modal" onclick="goOrder();"><span>Order</span></button>
      