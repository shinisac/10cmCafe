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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#div1_1").click(function(){
        $("#div3_1").fadeToggle("slow");
        $("#div2_1").fadeToggle("slow");
    });
    $("#div1_2").click(function(){
        $("#div3_2").fadeToggle("slow");
        $("#div2_2").fadeToggle("slow");
    });
    $("#div1_3").click(function(){
        $("#div3_3").fadeToggle("slow");
        $("#div2_3").fadeToggle("slow");
    });
});
</script>


</head>
<body>


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
                
                <!-- 내용 넣기ajax 포인트내역 -->
<div class="container">
<div class="product-image">
                                <img src="assets/img/photos/product-single.jpg" alt="">
                            </div>
                            <div class="product-content">
                                <div class="product-header text-center">
                                    <h1 class="product-title">매장정보확인</h1>
                                    <span class="product-caption text-muted">각 매장들의 정보를 확인할수 있습니다.</span>
                                </div>
                                <div class="container" id="content">
                        <table class="table table-hover">
                           
                              <tr>
                               <td colspan="2">
                                    <input type="hidden" value="${dto.shop_idx}">
                                    <img src="img/shop/shop${dto.shop_img }.jpg">
                               </td>
                              </tr>
                              <tr>   
                                 <th>매장이름</th>
                                 <td>${dto.shop_name }</td>
                              </tr>   
                              <tr>   
                                 <th>매장주소</th>
                                 <td>${dto.shop_area}<br>${dto.shop_addr }</td>
                              </tr>
                              <tr>      
                                 <th>매장전화번호</th>
                                 <td>${dto.shop_tel }</td>
                              </tr>   
                        </table>
                        <br><br>
                        <h3 align="center"><b>REVIEW</b></h3>
<table class="table">
   <thead>

   </thead>

   <tbody>
      <c:if test="${empty list }">
      <tr>
         <td colspan="5" align="center">
         등록된 게시글이 없습니다.
         </td>
      </tr>
      </c:if>
      <c:set var="i" value="1" />
      <c:forEach var="dto" items="${list}">
      <tr>
      
         <td>${dto.review_idx }</td>
         <c:url var="contentUrl" value="bbsContent.do">
         <c:param name="review_idx">${dto.review_idx }</c:param>
         </c:url>
         <td><div id="div1_${i}">${dto.review_subject }</div></td>
         <td>${dto.review_writer }</td>
         <td>${dto.review_date }
         </td>
         <td><c:url var="contentDel" value="bbsDel.do">
            <c:param name="review_idx">${dto.review_idx }</c:param>
            <c:param name="shop_idx">${shop_idx }</c:param>
         </c:url>
         <c:url var="contentUpdate" value="bbsUpdateForm.do">
            <c:param name="review_idx">${dto.review_idx }</c:param>
            <c:param name="shop_idx">${shop_idx }</c:param>
         </c:url>
         <c:if test="${dto.review_GPA==1 }">
            <img src="image/star/star_1.JPG">
         </c:if>
         <c:if test="${dto.review_GPA==2 }">
            <img src="image/star/star_2.JPG">
         </c:if>
         <c:if test="${dto.review_GPA==3 }">
            <img src="image/star/star_3.JPG">
         </c:if>
         <c:if test="${dto.review_GPA==4 }">
            <img src="image/star/star_4.JPG">
         </c:if>
         <c:if test="${dto.review_GPA==5 }">
            <img src="image/star/star_5.JPG">
         </c:if>
         <br>
         <c:if test="${sessionScope.id eq dto.review_writer }">
         	<a href="${contentUpdate}">글수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         	<a href="${contentDel}">글삭제</a>
         </c:if>
        
         	
        
      </tr>
            <tr>
         <td colspan="2" align="center"><div id="div2_${i}" style="display: none"><img src="img/${dto.review_img }"></div></td>
         <td colspan="3"><div id="div3_${i}" style="display: none">${dto.review_content }   
         
         </div></td>
      </tr>
      <c:set var="i" value="${i+1}" />
      </c:forEach>
   </tbody>   

</table>


   <a class="btn btn-default pull-right" href="bbsWrite.do?shop_idx=${shop_idx }">후기쓰기</a>
   
   <div class="text-center">
      <ul class="pagination">               
            <li>${pageStr}</li>
      </ul>
   </div>
</div>

          </div>
</div>
</article>
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

<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>