<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script  type="text/javascript" src="js/httpRequest.js"></script>

<!-- Meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />


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

<link rel="stylesheet" href="css/login.css">
<script  src="js/login.js"></script>
<title>10Cm_CAFE</title>

<script>

</script>
</head>


<body >


<!-- Body Wrapper -->
<div id="body-wrapper" class="animsition">

  <%@include file="/in/header.jsp" %>

    <!-- Content -->
    <div id="content" class="bg-light">

        <!-- Post / Single -->
        <article class="post single">
            <div class="post-image bg-parallax"><img src="img/main/post03.jpg" alt=""></div>
            <div class="container container-md">
                <div class="post-content">
                
<div class="container">
<section id="content">
<form name="loginForm" action="loginOk.do"  method="POST">

   <h1 >로그인</h1>
         <input type="hidden" name="shop" value="${shop }">
         <input type="hidden" name="type" value="${type }">
         <div>
         <input type="text"  name="member_email" placeholder="Email address" value="${cookie.sid.value }" autofocus required id="username">
         </div>
         <div >
         <input type="password" name="member_pwd" placeholder="Password" required id="password">
         </div>
         <div >
         <input type="checkbox" name="checkid"   ${empty cookie.sid.value?'':'checked' } >
     아이디 저장하기
        
         </div>
         <div class="">
            <input type="submit" value="Login"  >
            <a href="idFindForm.do">이메일 | 비밀번호 찾기</a>
         <a href="joinForm.do">회원가입</a>
            
        </div>
       
</form>
</section>

</div>
</div>
                </div>
</article>

</div>
</div>
 <%@include file="/in/footer.jsp" %>
 <%@include file="/in/cart.jsp" %>


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