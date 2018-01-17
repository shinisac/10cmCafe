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
<link rel="stylesheet" href="css/bootstrap.css" />

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

<script type="text/javascript">
   function gohome(){
      location.href='index.do';
   }
</script>

</head>

<body>

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
                        <h1 class="mb-0">Order OK</h1>
                    </div>
                </div>
            </div>
        </div>
      <br><br>
        <!-- Section -->
        <section class="section section-bg-edge">

        
            <div class="container">

         <div align="center">


         <h2>이용해주셔서 감사합니다.</h2>
         <input type="button" class="btn btn-primary" value="메인홈으로" onClick="gohome()">
         </div>
      
                    
               
            </div>

        </section>
      <br><br>
        <!-- Section -->
        <section class="section section-lg dark bg-dark">

            <!-- BG Image -->
            <div class="bg-image bg-parallax"><img src="assets/img/photos/bg-croissant.jpg" alt=""></div>
        
            <div class="container text-center">
                <div class="col-lg-8 push-lg-2">
                    <h2 class="mb-3">Would you like to visit Us?</h2>
                    <h5 class="text-muted">Book a table even right now or make an online order!</h5>
                    <a href="shopfind.do" class="btn btn-primary"><span>Order Online</span></a>
                    <a href="index.do" class="btn btn-outline-primary"><span>Main</span></a>
                </div>
            </div>

        </section>

        <!-- Footer -->
        <footer id="footer" class="bg-dark dark">
            
            <div class="container">
                <!-- Footer 1st Row -->
                <div class="footer-first-row row">
                    <div class="col-lg-4 col-md-6">
                        <h5 class="text-muted">고객센터</h5>
                        <ul class="list-posts">
                             <li><b>전화</b><h3>1670-0876</h3></li>
                             <li><a href=#>서비스 소개</a></li>
                        <li><a href=#>이용약관</a></li>
                        <li><a href=#>개인정보취급방침</a></li>
                        <li><a href=#>고객의 소리</a></li>
                        <li><a href=#>입점/제휴 문의</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-5 col-md-6">
                        <h5 class="text-muted">without us</h5>
                  <span>상호명 :(주)NFC카페 이메일 : Myhome@naver.com<br> 
                  대표이사 : 박성훈<br> 
                  사업자등록번호 : 111-11-11111<br>
                     통신판매업신고번호 : 제2014-서울관악-0792호<br>
                     주소 : 서울특별시 관악구 남부순환로 1935 2층<br>
                    NICEPAY 안전거래 서비스 : 고객님의 안전거래를 위해 현금 결제 시<br>저희 사이트에서 가입한 구매안전 서비스를 이용할 수 있습니다.
                     </span>
                  <br><br><br>
                        <h5 class="text-muted mb-3">Social Media</h5>
                        <a href="#" class="icon icon-social icon-circle icon-sm icon-facebook"><i class="fa fa-facebook"></i></a>
                        <a href="#" class="icon icon-social icon-circle icon-sm icon-google"><i class="fa fa-google"></i></a>
                        <a href="#" class="icon icon-social icon-circle icon-sm icon-twitter"><i class="fa fa-twitter"></i></a>
                        <a href="#" class="icon icon-social icon-circle icon-sm icon-youtube"><i class="fa fa-youtube"></i></a>
                        <a href="#" class="icon icon-social icon-circle icon-sm icon-instagram"><i class="fa fa-instagram"></i></a>
                    </div>
                </div>
                <!-- Footer 2nd Row -->
                <div class="footer-second-row">
                    <span class="text-muted">Copyright Soup 2017©. Made with love by Shin</span>
                </div>
            </div>

            <!-- Back To Top -->
            <a href="#" id="back-to-top"><i class="ti ti-angle-up"></i></a>

        </footer>
        <!-- Footer / End -->

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
<script src="assets/plugins/twitter-fetcher/js/twitterFetcher_min.js"></script>
<script src="assets/plugins/skrollr/dist/skrollr.min.js"></script>
<script src="assets/plugins/animsition/dist/js/animsition.min.js"></script>

<!-- JS Core -->
<script src="assets/js/core.js"></script>

</body>

</html>