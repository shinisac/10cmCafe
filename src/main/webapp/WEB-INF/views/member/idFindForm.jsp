<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>

<meta charset="UTF-8">
<title>10Cm_CAFE</title>

<script src="js/httpRequest.js"></script>
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
<script>
	function idCheck(){
		if(document.idFind.member_name.value==''){
			window.alert('이름을 입력해주세요.');
			document.idFind.member_name.focus();
			return false;
		}else if(document.idFind.member_phone.value==''){
			window.alert('전화번호를 입력해주세요.');
			document.idFind.member_phone.focus();
			return false;
		}else{
			return true;//submit 보내기
		}
	}

</script>
<script>
	//아이디 찾기
	function show(){
		var name=document.idFind.member_name.value;
		var phone=document.idFind.member_phone.value;
		
		sendRequest('idFind.do','name='+name+'&phone='+phone,idFindResult,'POST');

	}
	function idFindResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				
				var str=document.all.idFindResult;
				str.innerHTML=data;
				
			}
		}
	}
	
	//패스워드 찾기
	function show3(){
		var name='';
		var email='';
		if(document.pwdFind.member_name.value==''){
			window.alert('이름을 입력해주세요.');
			document.pwdFind.member_name.focus();
			name=document.pwdFind.member_name.value;
		
		}else if(document.pwdFind.member_email.value==''){
			window.alert('아이디를 입력해주세요.');
			document.pwdFind.member_email.focus();
			email=document.pwdFind.member_email.value;
		}else{
			name=document.pwdFind.member_name.value;
			email=document.pwdFind.member_email.value;
			// window.open('pwdFindForm.do?name='+name+'&email='+email+'','login','width=500,height=130');
			sendRequest('pwdFind.do','email='+email+'&name='+name,pwdFindResult,'POST');
		}
	}
	function show2(){
	
	email=document.pwdFind.member_email.value;
	name=document.pwdFind.member_name.value;
	
	sendRequest('pwdFind.do','email='+email+'&name='+name,pwdFindResult,'POST');
	}
	
	
	function pwdFindResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data=XHR.responseText;
				//비번이 맞을때 페이지이동
				
				
				if(data.trim()=='일치'){
					
					document.pwdFind.submit();
				}else{
				
				var str=document.all.pwdFindResult;
				str.innerHTML=data;
				
				}
			}
		}
	}
</script>
<style>
.container {
 width: 100%;
 text-align: center;
 }
#diva {
 display: inline-block;
 }
</style>
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
                
<div class="container">
<section id="content">
   <article align="center">
   <form name="idFind"  id="searchbox" >
      		<h2>이메일 찾기</h2>
      		 전화번호 <input type="text" name="member_phone" placeholder="핸드폰 번호를 입력하세요">
               이&nbsp;&nbsp;&nbsp;름 <input type="text" name="member_name" placeholder="이름을 입력해주세요"><br>
              <div id="diva">
          		<input type="button" value="이메일 찾기" class="button-3d" onclick="show()">
               </div>  
               <p id="idFindResult"> </p>
   </form>
   </article>

	<article align="center">
	<form name="pwdFind" id="searchbox" action="pwdFindForm.do">
	<h2>비밀번호 찾기</h2>
			이메일 <input type="text" name="member_email" placeholder="아이디을 입력해주세요">
			이&nbsp;&nbsp;&nbsp;름 <input type="text" name="member_name" placeholder="이름을 입력해주세요"><br>
					<div id="diva">
					<input type="button" value="비밀번호찾기" class="button-3d" onclick="show2()">
					</div>
					<p id="pwdFindResult"></p>
	</form>
	</article>
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