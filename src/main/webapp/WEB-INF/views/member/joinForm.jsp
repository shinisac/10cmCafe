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


<title>10Cm_CAFE</title>
<link rel="stylesheet" href="css/login.css">
<script  src="js/login.js"></script>
<script  src="js/httpRequest.js"></script>
<script>
	function chkkor(value) {
		return value.replace(/[^ㄱ-ㅎㅏ-ㅣ가-힁]/gi, "");

	}
	function chkjoo(value) {
		return value.replace(/[^0-9-]/gi, "");

	}
	function chkemail(value) {
		return value.replace(/[^_0-9a-zA-Z@\.]/gi, "");

	}
	function chkphone(value) {
		return value.replace(/[^-0-9]/gi, "");

	}
	function AddNum(obj) {
		var n = obj.value;
		var reg = /(\d{4})(\d{2})(\d{2})/;
		n += '';
		while (reg.test(n))
			n = n.replace(reg, '$1' + '-' + '$2' + '-' + '$3');
		obj.value = n;
	}
	function AddPhone(obj) {
		var n = obj.value;
		var reg = /(\d{3})(\d{4})(\d{4})/;
		n += '';
		while (reg.test(n))
			n = n.replace(reg, '$1' + '-' + '$2' + '-' + '$3');
		obj.value = n;
	}
	function allchk() {
		var pwd = /^[0-9a-zA-Z]+$/;

		var phone = /^01(?:0|1|[\d])-(\d{4})-\d{4}$/;
		var name = /^[가-힁]+$/;
		var email = /^[_\w-]+@[\._\w-]+\.[a-zA-Z]+$/;
		if(!document.join.member_email.value.match(email)){
	         alert("이메일형식을 확인해주세요.");
	         document.join.member_email.focus();
	         return false;     
	   }else if(document.join.member_pwd.value.length<8){
	         alert("비밀번호를 8글자 이상 입력해주세요.");
	         document.join.member_pwd.focus();
	         return false;
	   }else if(!document.join.member_pwd.value.match(pwd)){
	         alert("비밀번호 조건이 맞지않습니다.");
	         document.join.member_pwd.focus();
	         return false;
	   }else if(document.join.member_pwd.value!=document.join.member_pwdok.value){
	         alert("비밀번호를 확인해주세요.");
	         document.join.member_pwd.focus();
	         return false;
	   }else if(document.join.member_name.value<1){
	         alert("이름을 입력해주세요.");
	         document.join.member_name.focus();
	         return false;
	         
	      }else if(!document.join.member_name.value.match(name)){
	         alert("이름은 한글로 입력해주세요.");
	         document.join.member_name.focus();
	         return false;   
	         
	      
	      }else if(document.join.member_phone.value==''){
	         alert("전화번호를 입력해주세요.");
	         document.join.member_phone.focus();
	         return false;   
	         
	      }else if(!document.join.member_phone.value.match(phone)){
	         alert("전화번호형식을 확인해주세요.");
	         document.join.member_phone.focus();
	         return false;   
	         
	      }else{

	            return true;
	      }

	}
</script>


<script>
	//이메일 중복확인 메서드
	function emailCheck() {
		var email = /^[_\w-]+@[\._\w-]+\.[a-zA-Z]+$/;
		var member_email = document.join.member_email.value;

		if (document.join.member_email.value.match(email)) {
			sendRequest('emailCheckOk.do', 'email=' + member_email,
					emailCheckResult, 'GET');
		} else {
			var str = document.all.emailCheck;

			str.innerHTML = '<font color=red>' + member_email
					+ ' 은 이메일 형식이 아닙니다</font>';
		}
	}

	function emailCheckResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var str = document.all.emailCheck;
				str.innerHTML = '<font color=blue>' + data + '</font>';
			}
		}

	}
	function pwdCheckOk() {
		var pwd = /^[0-9a-zA-Z]+$/;
		var member_pwd = document.join.member_pwd.value;

		var member_pwdok = document.join.member_pwdok.value;
		if (member_pwd == member_pwdok) {

			var pwdCheckOk = document.all.pwdCheckOk;
			pwdCheckOk.innerHTML = '<font color=blue>패스워드가 일치합니다.</font>';
		} else {
			var pwdCheckOk = document.all.pwdCheckOk;
			pwdCheckOk.innerHTML = '<font color=red> 패스워드가  일치하지않습니다.</font>';
		}
	}
	function phoneCheck() {
		var member_phone = document.join.member_phone.value;

		sendRequest('phoneCheck.do', 'phone=' + member_phone, phoneCheckResult,
				'POST');
	}
	function phoneCheckResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var str = document.all.phoneCheck;
				str.innerHTML = data;
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
<div id="container">
<section id="content">
		<!-- Contact -->
		
<!--  요기 -->		
			<h1  align="center">회원가입</h1>
			<form method="post" name="join" action="joinOk.do"
				onsubmit="return allchk();">
				<div >
					EMAIL <input type="text"
						name="member_email" required="required" 
						placeholder="이메일을 적어주세요"
						onKeyup="this.value=chkemail(this.value);emailCheck()">
					<p id="emailCheck"></p>
				</div>
				<div >
					<label for="member_pwd">PASSWORD</label> <input type="password"
						name="member_pwd"  required="required"
						placeholder="비밀번호를 8자이상 입력해주세요"
						onKeyup="this.value=chkemail(this.value)">
					<p id="pwdCheck"></p>
				</div>
				<div >
					<label for="member_pwdok">PASSWORD TOO</label> <input
						type="password" name="member_pwdok" 
						required="required" placeholder="비밀번호를 한번 더 입력해주세요"
						onkeyup="pwdCheckOk()">
					<p id="pwdCheckOk"></p>
				</div>
				<div >
					<label for="member_name">NAME</label> <input type="text"
						name="member_name"  required="required"
						placeholder="이름을 적어주세요" onKeyup="this.value=chkkor(this.value)">
				</div>

				<div >
					<label for="message">PHONE</label> <input type="text"
						name="member_phone"  required="required"
						placeholder="핸드폰 번호를 적어주세요" maxlength="13"
						onKeyup="this.value=chkphone(this.value);AddPhone(this);phoneCheck()">
					<p id="phoneCheck"></p>
				</div>
				<div id="diva">
					<input type="submit" value="확인"  />
					<input type="reset" value="다시작성" />
			
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