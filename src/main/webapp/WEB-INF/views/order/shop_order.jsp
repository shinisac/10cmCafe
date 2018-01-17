<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- Meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Title -->
<title>10Cm_CAFE</title>

<!-- Favicons -->
<link rel="shortcut icon" href="assets/img/favicon.png">
<link rel="apple-touch-icon" href="assets/img/favicon_60x60.png">
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/favicon_76x76.png">
<link rel="apple-touch-icon" sizes="120x120" href="assets/img/favicon_120x120.png">
<link rel="apple-touch-icon" sizes="152x152" href="assets/img/favicon_152x152.png">

<!-- CSS Plugins -->
<link rel="stylesheet" href="assets/plugins/bootstrap/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/plugins/slick-carousel/slick/slick.css" />
<link rel="stylesheet" href="assets/plugins/animate.css/animate.min.css" />
<link rel="stylesheet" href="assets/plugins/animsition/dist/css/animsition.min.css" />

<!-- CSS Icons -->
<link rel="stylesheet" href="assets/css/themify-icons.css" />
<link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.min.css" />

<!-- CSS Theme -->
<link id="theme" rel="stylesheet" href="assets/css/themes/theme-beige.min.css" />
<style>
.inputtext {

	cursor: default;
	pointer-events:none;
}
</style>
<script src="js/Num.js"></script>
<script>
	function orderok() {
		var price = document.getElementById("order_price").value;
			if(document.getElementById("paypal").checked==true || document.getElementById("card").checked==true || document.getElementById("paypal").checked==true){
				fm_order.submit();
				return false;
			}else{
				alert('주문방식을 선택해주세요.');
				return;
			}

	}

	function pointuse() {
		var price = document.getElementById("view_price").value;
		var point = document.getElementById("point").value;
		var use = parseInt(document.getElementById("usepoint").value);

		price = getNumString(price);
		point = getNumString(point);

		if (use > point) {
			document.getElementById("usepoint").focus();
			document.getElementById("usepoint").value='0';
			document.getElementById("order_price").innerHTML=setComma(price);
			document.fm_order.order_price.value =price;
			alert('사용가능 마일리지보다 많습니다.');
			
			return false;
		
		} else if (use > price) {
			document.getElementById("usepoint").focus();
			document.getElementById("usepoint").value='0';
			document.getElementById("order_price").innerHTML=setComma(price);
			document.fm_order.order_price.value =price;
			alert('주문 금액보다 많습니다.');
			return false;
		}else if(use-1000<0&&use!=0){
			document.getElementById("usepoint").focus();
			document.getElementById("usepoint").value='0';
			document.getElementById("order_price").innerHTML=setComma(price);
			document.fm_order.order_price.value =price;
			alert('최소 1000포인트부터 사용하실수있습니다.');
			return false;
		}
		var viewtotal = price - use;
	document.fm_order.order_price.value = viewtotal;
	document.getElementById("order_price").innerHTML = setComma(viewtotal);
	document.fm_order.point_use.value = use;


	}
	

</script>
</head>

<body>

<!-- Body Wrapper -->
<div id="body-wrapper" class="animsition">

   <!-- Header -->
    <header id="header" class="light">

        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <!-- Logo -->
                    <div class="module module-logo dark">
                    	
                        <a href="index.do">
                            <img src="img/LOGO-4.svg" alt="" width="130" height="130">
                        </a>
                    </div>
                </div>
                <div class="col-md-7">
                    <!-- Navigation -->
                    <nav class="module module-navigation left mr-4">
                        <ul id="nav-main" class="nav nav-main">
                           <li class="has-dropdown">
                                <a href="javascript:;">Menu</a>
                                <div class="dropdown-container">
                                    <ul>
										<c:forEach var="cate" items="${shopcategory}">
											<li><A href="javascript:;" onclick="javascript:show('${cate.category_idx}')">${cate.category_name}</A></li>
										</c:forEach>
                                    </ul>
                                </div>
                            </li>
                            <li><a href="bookMenuForm.do"><b>메뉴 즐겨찾기</b></a></li>
                          
                        </ul>
                    </nav>
                </div>
               
            </div>
        </div>

    </header>
    <!-- Header / End -->

    <!-- Header -->
    <header id="header-mobile" class="light">
	
        <div class="module module-nav-toggle">
            <a href="javascript:;" id="nav-toggle" data-toggle="panel-mobile"><span></span><span></span><span></span><span></span></a>
        </div>    

        <div class="module module-logo">
            <a href="index.do">
               <img src="img/LOGO-BLACK.svg" alt="">
                       
            </a>
        </div>

    </header>
    <!-- Header / End -->

    <!-- Content -->
    <div id="content">

        <!-- Page Title -->
        <div class="page-title bg-dark dark">
            <!-- BG Image -->
            <div class="bg-image bg-parallax"><img src="img/main/orderImage.jpg" alt=""></div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 push-lg-4">
                        <h1 class="mb-0">Order</h1>
                        <h4 class="text-muted mb-0"></h4>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section -->
        <section class="section bg-light">

            <div class="container">
                <div class="row">
                    <div class="col-xl-4 push-xl-8 col-lg-5 push-lg-7">
                        <div class="shadow bg-white stick-to-content mb-4">
                        <!-- 주문 목록 시작 -->
                            <div class="bg-dark dark p-4"><h5 class="mb-0">You order</h5></div>
                            <table class="table-cart">
                            <c:set var="total" value="0"></c:set>
                           	 <c:forEach var="menu" items="${menulist}">
                                <tr>
                                    <td class="title">
                                        <span class="name">${menu.order_menu_name}</span>
                                        <span class="caption text-muted">${menu.order_menu_optiona}/${menu.order_menu_optionb}/${menu.order_menu_optionc}</span>
                                    </td>
                                    <td class="price">${menu.order_menu_amount}</td>
                                    <td class="name">
										<fmt:formatNumber value="${menu.order_menu_price*menu.order_menu_amount}" pattern="#,##0" />
                                    </td>
                                </tr>
                            <c:set var="total" value="${total+menu.order_menu_price*menu.order_menu_amount}"></c:set>    
                            </c:forEach>    
                            </table>
                        <!-- 주문 목록 끝 -->
                        </div>
                        
                    </div>
                   <form name="fm_order" action="orders.do" method="POST" class="col-xl-8 pull-xl-4 col-lg-7 pull-lg-5"> 
                    <div >
                   
                        <div class="bg-white p-4 p-md-5 mb-4">


                            <h4 class="border-bottom pb-4"><i class="ti ti-package mr-3 text-primary"></i>POINTS</h4>
                            <div class="row mb-5">
                                <div class="form-group col-sm-6">

												<table>
													<tr>
														<td>Order Price  <input type="text" id="view_price" class="form-control inputtext" name="view_price" value="<fmt:formatNumber value="${total}" pattern="#,##0" />">
														</td> 
													</tr>
												</table>
									
											<c:if test="${point>=0}">
											<table>
												<tr>
													<td>Availatble Points <input type="text" id="point" class="form-control inputtext"
														name="point" value="<fmt:formatNumber value="${point}" pattern="#,##0" />">
													</td>
												</tr>
												<tr>
													<td>Using Points <input type="text" id="usepoint" name="mpoint_use" class="form-control"
														value="0" onchange="pointuse();" onblur="getNumber(this)">
														<input type="hidden" name="point_use" value="0">
													</td>
												</tr>

											</table>

											</c:if>
											

								
                                </div>
                            </div>
                           <div class="border-bottom pb-4" style="border-top:1px solid #e0e0e0; margin-top: 100px; padding-top: 30px;">
							Total Price: <div style="float: right;margin-right: 10%;"id="order_price"><fmt:formatNumber value="${total}" pattern="#,##0" /></div><input type="hidden" name="order_price" value="${total}">
							</div>
                            <h4 class="border-bottom pb-4"><i class="ti ti-user mr-3 text-primary"></i>SHOP informations</h4>
                            <div class="row mb-5">
                            <c:forEach var="shop" items="${shopinfo}">
                                <div class="form-group col-sm-6">
                                    <input type="hidden" name="shop_idx"value="${shop.shop_idx}"><label > ${shop.shop_name}</label>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>${shop.shop_tel}</label>
                                </div>
                                <div class="form-group col-sm-6">
                                    <label>${shop.shop_area} ${shop.shop_addr}</label>
                                </div>

                            </c:forEach>
                            </div>
                            <h4 class="border-bottom pb-4"><i class="ti ti-wallet mr-3 text-primary"></i>Payment</h4>
                            <div class="row text-lg">
                                <div class="col-md-4 col-sm-6 form-group">
                                    <label class="custom-control custom-radio">
                                        <input type="radio" id="card" name="order_pay" class="custom-control-input" value="Card">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Credit Card</span>
                                    </label>
                                </div>
                                <div class="col-md-4 col-sm-6 form-group">
                                    <label class="custom-control custom-radio">
                                        <input type="radio" id="cash" name="order_pay" class="custom-control-input" value="Cash">
                                        <span class="custom-control-indicator"></span>
                                        <span class="custom-control-description">Cash</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <button class="btn btn-primary btn-lg" onClick="orderok()"><span>Order now!</span></button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>

        </section>

         <%@include file="/in/footer.jsp" %>

  

    </div>
    <!-- Content / End -->

  

    <!-- Panel Mobile -->
    <nav id="panel-mobile">
        <div class="module module-logo bg-dark dark">
            <a href="#">
                <img src="assets/img/logo-light.svg" alt="" width="88">
            </a>
            <button class="close" data-toggle="panel-mobile"><i class="ti ti-close"></i></button>
        </div>
        <nav class="module module-navigation"></nav>

    </nav>

    <!-- Body Overlay -->
    <div id="body-overlay"></div>

</div>



<!-- JS Plugins -->
<script src="assets/plugins/jquery/dist/jquery.min.js"></script>
<script src="assets/plugins/tether/dist/js/tether.min.js"></script>
<script src="assets/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/plugins/slick-carousel/slick/slick.min.js"></script>
<script src="assets/plugins/jquery.appear/jquery.appear.js"></script>
<script src="assets/plugins/jquery.scrollto/jquery.scrollTo.min.js"></script>
<script src="assets/plugins/jquery.localscroll/jquery.localScroll.min.js"></script>
<script src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="assets/plugins/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.min.js"></script>
<script src="assets/plugins/skrollr/dist/skrollr.min.js"></script>
<script src="assets/plugins/animsition/dist/js/animsition.min.js"></script>

<!-- JS Core -->
<script src="assets/js/core.js"></script>


</body>
</html>