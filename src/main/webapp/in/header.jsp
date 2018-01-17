 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- Header -->
    <header id="header" class="light">

        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <!-- Logo -->
                    <div class="module module-logo dark">
                        <a href="index.do"> <!-- 로고 이미지 변경합시다. -->
                            <img src="img/LOGO-WHITE.svg" alt="" width="130" height="130">
                        </a>
                    </div>
                </div>
                <div class="col-md-7">
                    <!-- Navigation -->
                    <nav class="module module-navigation left mr-4">
                        <ul id="nav-main" class="nav nav-main">
                            <li class="has-dropdown">
                                <a href="javascript:;">주문하기</a>
                                <div class="dropdown-container">
                                    <ul>
                                 <li><a href="shopfind.do">매장찾기</a></li>
                                 <li><a href="bookMarkForm.do">즐겨찾기 매장</a></li>
                                    </ul>
                                    <div class="dropdown-image">
                                        <img src="img/dropdown-order.jpg" alt="">
                                    </div>
                                </div>
                            </li>
                            <li class="has-dropdown">
                                <a href="javascript:;">메뉴 </a>
                                <div class="dropdown-container">
                                    <ul class="dropdown-mega">
                                        <li><a href="shop_menuCate.do?shop=1&cate=2">커피</a></li>
                                        <li><a href="shop_menuCate.do?shop=1&cate=3">차</a></li>
                                        <li><a href="shop_menuCate.do?shop=1&cate=4">디저트</a></li>
                                        <li><a href="shop_menuCate.do?shop=1&cate=5">주스</a></li>
                                 
                                    </ul>
                                    <div class="dropdown-image">
                                        <img src="img/dropdown-menu.jpg" alt="">
                                    </div>
                                </div>
                            </li>

                            <c:if test="${empty sessionScope.id }">
                            <li><a href="loginForm.do">로그인</a></li>
                            <li><a href="joinForm.do">회원가입</a></li>
                            </c:if>
                            <c:if test="${!empty sessionScope.id}">
                                <li class="has-dropdown">   
                                <a href="javascript:;">마이페이지</a>
                                <div class="dropdown-container">
                                    <ul class="dropdown-mega">
                               <li><a href="myPageForm.do?email=${sessionScope.id}">나의 정보</a></li>
                               <li><a href="myPointForm.do">포인트내역</a></li>
                               <li><a href="beforeOrderListForm.do">주문내역</a></li>
                                    </ul>
                                    <div class="dropdown-image">
                                        <img src="img/dropdown-mypage.jpg" alt="">
                                    </div>
                                </div>
                            </li>
                            <li><a href="logout.do">로그아웃</a></li>

                            </c:if>
                        </ul>
                    </nav>
                  
                </div>
                <!--  장바구니
                <div class="col-md-2">
                    <a href="javascript:;" class="module module-cart right" data-toggle="panel-cart">
                        <span class="cart-icon">
                            <i class="ti ti-shopping-cart"></i>
                            <span class="notification">2</span>
                        </span>
                        <span class="cart-value">27,000원</span>
                    </a>
                </div>
                 -->
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
                <img src="img/LOGO-BLACK.svg"  alt="" width="130" height="130">
            </a>
        </div>
<!-- 장바구니
        <a href="javascript:;" class="module module-cart" data-toggle="panel-cart">
            <i class="ti ti-shopping-cart"></i>
            <span class="notification">2</span>
        </a>
 -->
    </header>
    <!-- Header / End -->
                <!-- Back To Top -->
            <i><a href="javascript:;" id="back-to-top"><i class="ti ti-angle-up"></i></a>
    