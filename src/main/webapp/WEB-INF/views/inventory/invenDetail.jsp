<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>10Cm_CAFE</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Quicksand:400,700|Questrial"
	rel="stylesheet" />
<link href="css/default.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="fonts/fonts.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="styLesheet" type="text/css" href="css/adminmainmenu.css">
<style>
.dates {
	border: 0px;
	width: 30px;
	margin: 0px 0px 0px 0px;
	text-align: center;
}

.date2 {
	border: 0px;
	width: 15px;
	margin: 0px 0px 0px 0px;
}

#di {
	display: none;
	width: 80px;
	text-align: center;
	border: 1px solid gray;
	height: 22px;
	padding: 0px 0px 0px 0px;
	box-shadow: 0px 0px 1px 0px inset;
	float: left;
}

.search {
	float: left;
	padding: 0px 5px 0px 5px;
}

article table {
	margin: 40px auto;
	width: 500px;
	height: 100px;
	border-collapse: collapse;
}

article table th {
	height: 40px;
	background-color: #EAEAEA;
	border-bottom: 2px solid #ddd;
}

article table td {
	border-bottom: 2px solid #ddd;
	height: 35px;
}

article table th a {
	color: black;
	text-decoration: none;
}

#cur:hover {
	cursor: pointer;
}

#main tr:hover {
	background-color: #E6FFFF;
}

#update {
	border: none; /*---테두리 정의---*/
	background-Color: darkgray; /*--백그라운드 정의---*/
	font: 12px 굴림; /*--폰트 정의---*/
	font-weight: bold; /*--폰트 굵기---*/
	color: white; /*--폰트 색깔---*/
	width: 70px;
	height: 30px; /*--버튼 크기---*/
}
</style>

</head>

<body>
	<%@include file="../admin_header2.jsp"%>
	<div class="wrapper">
		<div id="welcome" class="container">
			<div class="title">
				<h2 align="center">재고 상세내역</h2>


				<form name="invenDetailForm" action="invenUpdate.do">
					<input type="hidden" name="cp" value="${cp }"> <input
						type="hidden" name="idx" value="${idx }"> <input
						type="hidden" name="shop_idx" value="${shop_idx }">
					<section>
						<article>
							<table>
								<thead>
									<tr>
										<td colspan="8"></td>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<td colspan="4" align="center"><input type="submit"
											id="update" value="수정" id="update">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input type="button" id="update" value="닫기"
											onClick="location.href='invenList.do?cp=${cp}&shop_idx=${shop_idx }'"
											id="update"></td>
									</tr>
								<tfoot>
								<tbody>
									<tr>
										<th>물품번호</th>
										<td>${dto.material_idx }</td>
									</tr>

									<tr>
										<th>물품이름</th>
										<td>${dto.material_name }</td>
									</tr>
									<tr>
										<th>물품규격</th>
										<td>${dto.material_size }</td>
									</tr>
									<tr>
										<th>물품가격</th>
										<td>${dto.material_price }</td>
									</tr>
									<tr>
										<th>물품상태</th>
										<td><select name="level">
												<c:if test="${state eq '입고요망'}">
													<option value="입고요망" selected>입고요망</option>
													<option value="입고중">입고중</option>
													<option value="게시중">게시중</option>
												</c:if>
												<c:if test="${state eq '입고중'}">
													<option value="입고중" selected>입고중</option>
													<option value="입고요망">입고요망</option>
													<option value="게시중">게시중</option>
												</c:if>
												<c:if test="${state eq '게시중'}">
													<option value="게시중" selected>게시중</option>
													<option value="입고요망">입고요망</option>
													<option value="입고중">입고중</option>
												</c:if>

										</select></td>
									</tr>
									<tr>
										<th>물품수량</th>
										<td><input type="number" name="amount_s"
											value="${dto.material_amount }" id="text"></td>
									</tr>
									<tr>
										<th>입고날짜</th>
										<td>${dto.material_date }</td>
									</tr>
									<tr>
										<th>비고</th>
										<td><textarea rows="10" cols="20" name="bigo"
												value="${dto.material_bigo }">${dto.material_bigo }</textarea></td>
									</tr>



								</tbody>

							</table>
						</article>
					</section>
				</form>
			</div>
		</div>
	</div>
</body>
</html>