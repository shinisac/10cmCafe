<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css" >
<title>10Cm_CAFE</title>
</head>
<body>
<h2>후기게시판 본문 샘플</h2>
<div class="container">
<table class="table table-bordered">
	<tr>
		<td>${dto.review_img }</td>
	</tr>
	<tr height="250">
		<td colspan="4" align="left" valign="top">
			${dto.review_content }
		</td>
	</tr>
	</table>

</div>
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>