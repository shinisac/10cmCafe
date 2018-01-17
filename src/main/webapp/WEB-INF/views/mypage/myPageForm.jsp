<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<script>
	function pwdOpen(){
		var email=document.myPageForm.member_email.value;
		var name=document.myPageForm.member_name.value;

		location.href='pwdFindForm.do?member_email='+email+'&member_name='+name;
	}
	function memberDel(){
		var idx=document.myPageForm.member_idx.value;
		location.href='memberOutForm.do?idx='+idx;
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
                        <h1 class="mb-0">Member Info</h1>
                        <h4 class="text-muted mb-0">회원 정보를 확인할 수 있습니다.</h4>
                    </div>
                </div>
            </div>
        </div>

        <!-- Section -->
        <section class="section section-bg-edge">

            <div class="image left bottom col-md-7">
                <div class="bg-image"></div>
            </div>
        
            <div class="container">
                <form name="myPageForm" action="memberUpdate_ok.jsp" method="POST">
         <div align="center">
      
         <table class="table" style="border:0px solid lightgray; width:100%;" >
         <tr>
            <th>회원번호</th> 
            <td> ${dto.member_idx }</td>
            <input type="hidden" name="member_idx" value="${dto.member_idx }">
         </tr>
         <tr>
            <th>회원아이디 </th>
            <td>${dto.member_email }</td>
            <input type="hidden" name="member_email" value="${dto.member_email }">
         </tr>
         <tr>
            <th>전화번호 </th>
            <td>${dto.member_phone }</td>
            <input type="hidden" name="member_phone" value="${dto.member_phone }">
         </tr>
         <tr>
            <th>회원이름 </th>
            <td>${dto.member_name }</td>
            <input type="hidden" name="member_name" value="${dto.member_name }">
         </tr>
         <tr>
            <th>회원비밀번호</th>
            <td>
               <input type="button" name="member_pwd" value="수정" onclick="pwdOpen()" class="btn btn-primary">
            </td>
         </tr>
         <tr>
            <th>포인트</th>
            <td><fmt:formatNumber value="${dto.member_point }" pattern="#,##0" />포인트</td>
            <input type="hidden" name="member_mileage" value="${dto.member_point }">
         </tr>

         <tr>
            <td colspan="2" align="center">
               <br>
               <input type="button" value="목록으로"  onclick="location.href='index.do'" class="btn btn-primary"> 
               <input type="button" value="탈퇴하기" onclick="memberDel()" class="btn btn-primary">
            </td>
         </tr>
      </table></div>
      </form>
                    
               
            </div>

        </section>
        
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
