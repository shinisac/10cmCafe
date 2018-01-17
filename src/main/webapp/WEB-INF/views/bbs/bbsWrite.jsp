<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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


<script type="text/javascript" src="js/httpRequest.js"></script>

<script>
	var locked = 0;

	function show(star) {
		if (locked)
			return;
		var i;
		var image;
		var el;
		var e = document.getElementById('startext');
		var stateMsg;

		for (i = 1; i <= star; i++) {
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "image/star/star1.JPG";
		}

		switch (star) {
		case 1:
			stateMsg = "완전 별로";
			break;
		case 2:
			stateMsg = "별로";
			break;
		case 3:
			stateMsg = "보통";
			break;
		case 4:
			stateMsg = "좋아요";
			break;
		case 5:
			stateMsg = "완전 좋아요";

		}
		e.innerHTML = stateMsg;
	}

	function noshow(star) {
		if (locked)
			return;
		var i;
		var image;
		var el;

		for (i = 1; i <= star; i++) {
			image = 'image' + i;
			el = document.getElementById(image);
			el.src = "image/star/star0.JPG";
		}
	}

	function lock(star) {
		show(star);
		locked = 1;
	}

	function mark(star) {
		var num=document.getElementById('image'+star);
	
		lock(star);
		//alert("선택" + star + "점");
		document.bbsWrite.star.value = star;
		
		
	}
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
            <div class="post-image bg-parallax"><img src="assets/img/photos/modal-review.jpg" alt=""></div>
            <div class="container container-md">
                <div class="post-content">
            <div align="center"><h2>Review Write</h2></div>
															<div class="container">
																<form role="form" name="bbsWrite" action="bbsWrite.do"
																	method="post">
																	<input type="hidden" name="shop_idx" value="${shop_idx }">
																	<div class="row">
																		<div class="col-md-6">
																			<div class="form-group">
																				<label for="name">작성자</label> <input type="text"
																					class="form-control" name="review_writer"
																					id="review_writer" value="${sessionScope.id }" readonly>
																			</div>
																		</div>
																	</div>

																	<div class="form-group">
																		<label for="subject">제목</label> <input type="text"
																			class="form-control" name="review_subject"
																			id="review_subject" placeholder="제목을 적어주세요">
																	</div>


																	<div class="form-group">
																		<label for="subject">별점 선택</label>

																		<table>
																			<tr>
																				<td width="500" height="50" colspan="5">
																					<div id=rating>
																						<span> <img id=image1 onmouseover=show(1)
																							onclick=mark(1) onmouseout=noshow(1)
																							src="image/star/star0.JPG"> <img id=image2
																							onmouseover=show(2) onclick=mark(2)
																							onmouseout=noshow(2) src="image/star/star0.JPG">
																							<img id=image3 onmouseover=show(3)
																							onclick=mark(3) onmouseout=noshow(3)
																							src="image/star/star0.JPG"> <img id=image4
																							onmouseover=show(4) onclick=mark(4)
																							onmouseout=noshow(4) src="image/star/star0.JPG">
																							<img id=image5 onmouseover=show(5)
																							onclick=mark(5) onmouseout=noshow(5)
																							src="image/star/star0.JPG">
																						</span> <br>
																						<span id=startext>평가하기</span>
																					</div> <input type="hidden" name="star"
																					value="${dto.review_idx }" />
																				</td>
																		</table>
																	</div>


																	<div class="form-group">
																		<label for="content">내용</label>
																		<textarea class="form-control" rows="15"
																			name="review_content" id="review_content"></textarea>
																	</div>

																	<div class="form-group">
																		<label for="File">File input</label> <input
																			type="file" id="File" name="review_img"
																			id="review_img" class="btn btn-default">
																	</div>

																	<div align="center">
																		<input  type="submit" value="글쓰기" class="btn btn-primary">&nbsp;&nbsp;
																		<input  type="reset" value="다시쓰기" class="btn btn-primary">
																		<br><br><a href="shopInfo.do?shop_idx=${shop_idx }">목록으로</a>
																	</div>

																</form>
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
														
</body>

</html>