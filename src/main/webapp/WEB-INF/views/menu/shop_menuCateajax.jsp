<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 카테고리 클릭시 변경해야 되는부분 시작-->
<div class="menu-category">
	<div class="menu-category-title">
		<div class="bg-image"  style="background-image:url('img/menu/${cate.category_img}');">
		
			<!--  이부분 사진 안먹힘-->
			<img src="img/menu/cate${cate.category_idx }.jpg" alt="">
				<!--  이부분 사진 안먹힘-->
	
		</div>
		
		<h2 class="title">${cate.category_name}</h2>
	</div>
	<div class="menu-category-content padded">
		<div class="row gutters-sm">
			<!-- 메뉴 리스트부분 시작 -->
			<c:if test="${empty list}">
				<div class="col-lg-4 col-6" style="height: 200px;">
					<h6 class="mb-0">등록된 메뉴가 없습니다.</h6>
				</div>
			</c:if>
			<c:forEach var="menulist" items="${list}">
				<div class="col-lg-4 col-6">
					<!-- Menu Item -->
					<div class="menu-item menu-grid-item">
						 <img class="mb-4" src="img/menu/${menulist.menu_img }" alt="" height="263">
						<h6 class="mb-0">${menulist.menu_name}</h6>
						<span class="text-muted text-sm"></span>
						<div class="row align-items-center mt-4">
							<div class="col-sm-6">
								<span class="text-md mr-4"><span class="text-muted"></span>
									<fmt:formatNumber value="${menulist.menu_price}" pattern="#,##0" /></span>
							</div>
						
						</div>
					</div>
				</div>
			</c:forEach>
			<!-- 메뉴 리스트부분 끝 -->

		</div>
	</div>
</div>
<!-- 카테고리 클릭시 변경해야 되는부분 시작-->