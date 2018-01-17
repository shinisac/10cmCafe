<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
container {
 width: 100%;
 text-align: center;
 }
#diva {
 display: inline-block;
 }
</style>
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

<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->

<title>10Cm_CAFE</title>
<link rel="stylesheet" href="css/login.css">

	<script>
		function pwdCheck() {
			if (document.PWDfind_ok.member_pwd.value == '') {
				window.alert('비밀번호를 입력해주세요.');
				document.PWDfind_ok.member_pwd.focus();
				return false;
			} else if(document.PWDfind_ok.member_pwd.value.length<8){
				window.alert('비밀번호는 8자이상 입력해주세요');
				document.PWDfind_ok.member_pwd.focus();
				return false;
			} else if (document.PWDfind_ok.member_pwdOk.value == '') {
				window.alert('비밀번호 확인을 입력해주세요.');
				document.PWDfind_ok.member_pwdOk.focus();
				return false;
			} else {
				//같을떄 서브밋
				if (document.PWDfind_ok.member_pwd.value == document.PWDfind_ok.member_pwdOk.value) {
										
					return true;//submit 보내기
				} else {
					window.alert('비밀번호가 맞지않습니다');
					return false;
				}
			}
		}

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
<!-- 요기 -->
<section class="section section-bg-edge">
<div class="container">
		
			
			
				<h1 >비밀번호 변경</h1>

				<form name="PWDfind_ok" action="pwdFindOk.do"
					onsubmit='return pwdCheck()' method="POST" align="center">
					
					
					<input type="hidden" name="member_email" value="${email}">

					<div>
						 <input type="password"
							name="member_pwd"  required="required"
							placeholder="비밀번호를 입력하세요"
							onKeyup="this.value=chkemail(this.value)">
						
					</div>
					<p id="pwdCheck"></p>
					<div >
						 <input
							type="password" name="member_pwdok" 
							required="required" placeholder="비밀번호를 한번 더 입력하세요"
							onkeyup="pwdCheckOk()">

						
					</div>
					<p id="pwdCheckOk"></p>
					<div id="diva">
						<input type="submit" value="확인"  />
						<input type="reset" value="다시작성" />
					</div>

				</form>
		
			</div>
		</section>
	</div>


<!-- 요기까지 -->
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