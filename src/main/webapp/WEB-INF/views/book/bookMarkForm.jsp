<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<c:if test="${empty sessionScope.id }">
<script>
alert('로그인이 필요한 페이지입니다.');
location.href='index.do';   
</script>
</c:if> 
<script  type="text/javascript" src="js/httpRequest.js"></script>
<script>
//즐겨찾기 리스트
function bookMarkAdd(shop_idx){
   param='shop_idx='+shop_idx;
   sendRequest('bookMarkAdd.do',param,bookMarkAddResult,'GET');
}

function bookMarkAddResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;
         alert(data);
         bookMarkList(1);
      }
   }
}

function bookMarkList(i){
   var cp=i;
   if(cp==''){
      cp=1;
   }

   sendRequest('bookMarkList.do','cp='+cp,bookMarkListResult,'GET');
   
}
function bookMarkListResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;
         
         var str=document.all.bookMarkForm;
         str.innerHTML=data;
         
      }
   }
}
</script>
</head>

<body onload="bookMarkList('${cp}')">

<!-- Body Wrapper -->
<div id="body-wrapper" class="animsition">
<%@include file="/in/header.jsp" %>
   
    <!-- Content -->
    <div id="content">

        <!-- Page Title -->
        <div class="page-title bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 push-lg-4">
                        <h1 class="mb-0">즐겨찾기</h1>
                        <h4 class="text-muted mb-0">매장 즐겨찾기</h4>
                    </div>
                </div>
            </div>
        </div>

        <!-- Page Content -->
        <div class="page-content">
            <div class="container">
                <div class="row no-gutters">
               <div class="col-md-3">
                        <!-- Menu Navigation -->
                        <nav id="menu-navigation" class="stick-to-content" data-local-scroll>
                            <ul class="nav nav-menu bg-dark dark">
                                <li>매장 목록</li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-md-9">
                        <!-- Menu Category / Burgers -->
                        <div id="Burgers" class="menu-category">
                            <div class="menu-category-title">
                                <div class="bg-image"><img src="img/bookmenu.jpg" alt=""></div>
                                <h2 class="title">BookMark</h2>
                            </div>
                            <div class="menu-category-content">
                                <!-- Menu Item -->
                                <div class="menu-item menu-list-item">
                                    <div class="row align-items-center">
                              <div class="container" id="bookMarkForm" align="center">  
                              </div>
                                    </div>
                                </div>

                                    </div>
                                </div>
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


       
</div>
 <%@include file="/in/footer.jsp" %>
 <%@include file="/in/cart.jsp" %>

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
<script src="assets/plugins/twitter-fetcher/js/twitterFetcher_min.js"></script>
<script src="assets/plugins/skrollr/dist/skrollr.min.js"></script>
<script src="assets/plugins/animsition/dist/js/animsition.min.js"></script>

<!-- JS Core -->
<script src="assets/js/core.js"></script>

</body>

</html>
