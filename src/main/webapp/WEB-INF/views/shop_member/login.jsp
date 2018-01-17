<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<link rel="styLesheet" type="text/css" href="../css/myhomeLayout.css">
<meta name="keywords" content="" />
<meta name="description" content="" />
<linkhref="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css" media="all" />
<style rel="stylesheet">
body {
   font: 13px/20px 'Helvetica Neue', Helvetica, Arial, sans-serif;
   color: #333333;
}
.form-group .form-remember input[type='checkbox'] {
  display: inline-block;
  width: auto;
  margin: 0 10px 0 0;
}
.signUp {
   position: relative;
   margin: 50px auto;
   width: 280px;
   padding: 33px 25px 29px;
   background: #FFFFFF;
   border-bottom: 1px solid #C4C4C4;
   border-radius: 5px;
   -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
   box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
}

.signUp:before,
.signUp:after {
   content: '';
   position: absolute;
   bottom: 1px;
   left: 0;
   right: 0;
   height: 10px;
   background: inherit;
   border-bottom: 1px solid #D2D2D2;
   border-radius: 4px;
}

.signUp:after {
   bottom: 3px;
   border-color: #DCDCDC;
}

.signUpTitle {
   margin: -25px -25px 25px;
   padding: 15px 25px;
   line-height: 35px;
   font-size: 26px;
   font-weight: 300;
   color: #2056ac;
   text-align: center;
   text-shadow: 0 1px rgba(255, 255, 255, 0.75);
   background: white;
}

.signUpTitle:before {
   content: '';
   position: absolute;
   top: 0;
   left: 0;
   right: 0;
   height: 8px;
   background: white;
   border-radius: 5px 5px 0 0;
}

input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
}

.signUpInput {
   width: 100%;
   height: 50px;
   margin-bottom: 25px;
   padding: 0 15px 2px;
   font-size: 17px;
   background: white;
   border: 2px solid #EBEBEB;
   border-radius: 4px;
   -webkit-box-shadow: inset 0 -2px #EBEBEB;
   box-shadow: inset 0 -2px #EBEBEB;
}

.signUpInput:focus {
   border-color: #62C2E4;
   outline: none;
   -webkit-box-shadow: inset 0 -2px #62C2E4;
   box-shadow: inset 0 -2px #62C2E4;
}

.lt-ie9 .signUpInput {
   line-height: 48px;
}

.signUpButton {
   position: relative;
   vertical-align: top;
   width: 100%;
   height: 54px;
   padding: 0;
   font-size: 22px;
   color: white;
   text-align: center;
   background: #2056ac;
   border: 0;
   border-radius: 5px;
   cursor: pointer;
   -webkit-box-shadow: inset 0 -2px lightgray;
   box-shadow: inset 0 -2px lightgray;
}

.signUpButton:active {
   top: 1px;
   outline: none;
   -webkit-box-shadow: none;
   box-shadow: none;
}

:-moz-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-placeholder {
   color: #AAAAAA;
   opacity: 1;
   font-weight: 300;
}

::-webkit-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

:-ms-input-placeholder {
   color: #AAAAAA;
   font-weight: 300;
}

::-moz-focus-inner {
   border: 0;
   padding: 0;
}
</style>
</head>
<body>
<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<img alt="어드민로고" src="img/test.png" width="50" height="50"><br><br>
				<h1><a href="admin_index.do">10cm CAFE<br></a></h1>
				<h2><a href="#">매장 로그인</a></h2>
			</div>
		</div>
	</div>
<form name="myhomelogin" action="shopPageindex.do" class="signUp" id="signupForm" method="POST">
   <h1 class="signUpTitle">Login</h1>
         <input type="text" class="signUpInput" name="shop_member_id" placeholder="아이디" autofocus required value=${cookie.ck.value } >
         <input type="password" class="signUpInput" name="shop_member_pwd" placeholder="비밀번호" required>
         <input type="text" class="signUpInput" name="shop_idx" placeholder="매장번호" required>
         <div class="form-group"><label class="form-remember">
         	<input type="checkbox" name="ck" ${empty cookie.ck.value?"":"checked"}>아이디 기억하기</label>
         </div><br>
         <input type="submit" value="Login" class="signUpButton" id="signupForm"><br><br>
       
</form>
</body>
</html>