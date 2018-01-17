<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<meta charset="UTF-8"> 

<!-- Meta -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<!-- Title -->
<title>10Cm_CAFE</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<style>
   .selcolor{
      background-color: green;
   }
.intext{
   border: 0px;
   font-weight:bold;
   cursor: default;
   pointer-events:none;
}
.lotext{
   border: 0px;
   cursor: default;
   pointer-events:none;
   font-size: 10px;
}
.textbig{
   font-size: 20px;
}
.textbig2{
   font-size: 20px;
}
.textcolor{
   background-color: #f3f4f4;
}
.bg-image, .bg-slideshow {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-position: center center;
    background-size: cover;
    background-repeat: no-repeat;
    z-index: 0;
}
</style>
<script src="js/httpRequest.js"></script>
<script src="js/Num.js"></script>
<script src="js/httpPage.js"></script>
<script>
   function gomenu(idx,shop){//메뉴 상세페이지 이동
      sendPost('shop_menu.do','idx='+idx+'&shop='+shop);
      //location.href='shop_menu.do?idx='+idx+'&shop='+shop;
   }
   function gocartList(){
      var shop = document.getElementById("shop_idx").value;
      sendPost('go_cart.do','shop='+shop);
      //location.href='go_cart.do?shop='+shop;
   }
   function show(idx){//요청함수
      var param = 'idx='+idx;

      sendRequest('category_menu2.do',param,showResult,'GET');
   }
   
   function showResult(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            var data=XHR.responseText;

            $('#menuList').html(data).trigger('create');
            //document.getElementById('menuList').innerHTML=data;
         }
      }
   }
      function bookMenuList(){
            var shop = document.getElementById("shop_idx").value;
            sendPost('bookMenuForm.do','shop_idx='+shop);
           // location.href='bookMenuForm.do?shop_idx='+shop;
         }
      function menushow(idx){
         var param = 'idx='+idx;

         sendRequest('shop_menu.do',param,menuResult,'GET');
      }
      function menuResult(){
         if(XHR.readyState==4){
            if(XHR.status==200){
               var data=XHR.responseText;

               $('#menucontent').html(data).trigger('create');
               //document.getElementById('menucontent').innerHTML=data;
            }
         }
      }
      function cartcount(){
         sendRequest('shop_menu.do',param,cartcountResult,'GET');
      }
      function cartdelsult(){
         if(XHR.readyState==4){
            if(XHR.status==200){
               var data=XHR.responseText;
               cartcount()
            }
         }
      }
      function totalprice(){
         
         var total = document.getElementsByName("cartamount");
         var price = document.getElementsByName("price");
         var j = 0;
         
         for(var i = 0;i<total.length;i++){
               var result = parseInt(total[i].value)*getNumString(price[i].value);
               j+=parseInt(result);
            
         }
         document.getElementById("tprice").innerText= setComma(j);
         
      }      
      
      function loadcartList(idx){
         var param = 'shop='+idx;
         sendRequest('shop_cartAjax.do',param,loadcartResult,'GET');
         
      }
      function loadcartResult(){
         if(XHR.readyState==4){
            if(XHR.status==200){
               var data=XHR.responseText;
               document.getElementById("carts").innerHTML= data;
            }
         }
      }
</script>
<script>

   function mshow(idx){//요청함수
      //alert(idx);
      var param = 'order_menu_idx='+idx;
      param+='&order_menu_name='+document.getElementById('order_menu_name').value;
      param+='&order_menu_amount='+document.getElementById('amount').value;
      param+='&order_menu_price='+document.getElementById('order_menu_price').value;
      param+='&order_menu_optiona='+document.getElementById('optiona').value;
      param+='&order_menu_optionb='+document.getElementById('optionb').value;
      param+='&order_menu_optionc='+document.getElementById('optionc').value;
      param+='&shop_idx=${param.shop}';
      sendRequest('cartIn.do',param,mshowResult,'GET');
   }
   
   function mshowResult(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            var data=XHR.responseText;
            var shop = document.getElementById('shop_idx').value;
            cartcount()
            
         }
      }
   }

   function amount(obj){
      var amounts = document.getElementById('amount').value;
      var price = document.getElementById('order_menu_price').value;
      if(obj==0&&amounts>1){
         document.getElementById('amount').value=(parseInt(amounts)-1);
      }else if(obj==1){
         document.getElementById('amount').value=(parseInt(amounts)+1);
      }
      var totalprice = parseInt(price)*parseInt(document.getElementById('amount').value); 
      document.getElementById('totalprice').innerHTML='총 결재 금액:    '+setComma(totalprice)+' 원';
   }
   function goOrder(){
      var shop = document.getElementById('shop_idx').value;
      document.getElementById('menu_shopidx').value=shop;
      fm_menu.submit();
      
   }
   function goOrdercart(){
      var shop = document.getElementById('shop_idx').value;
      location.href='order.do?shop='+shop;
      
   }   
   function changeamount(i){
      var param = 'order_menu_idx='+document.getElementById(i).idx.value;
      param+='&order_menu_name='+document.getElementById(i).name.value;
      param+='&order_menu_amount='+document.getElementById(i).cartamount.value;
      param+='&order_menu_price='+getNumString(document.getElementById(i).price.value);
      param+='&order_menu_optiona='+document.getElementById(i).optiona.value;
      param+='&order_menu_optionb='+document.getElementById(i).optionb.value;
      param+='&order_menu_optionc='+document.getElementById(i).optionc.value;
      param+='&shop=${param.shop}';
      sendRequest('cart_amount.do',param,amounts,'GET');
   }
   function amounts(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            var data=XHR.responseText;
            
         }
      }
   }
   function mamount(i){
      var amounts = document.getElementById(i).cartamount.value;
      if(amounts>1){
         document.getElementById(i).cartamount.value=(parseInt(amounts)-1);
         changeamount(i)
      }
   }
   function pamount(i){
      var amounts = document.getElementById(i).cartamount.value;
         document.getElementById(i).cartamount.value=(parseInt(amounts)+1);
         changeamount(i)
   }
   function cartdel(i){
      var param = 'order_menu_idx='+document.getElementById(i).idx.value;
      param+='&order_menu_name='+document.getElementById(i).name.value;
      param+='&order_menu_amount='+document.getElementById(i).cartamount.value;
      param+='&order_menu_price='+getNumString(document.getElementById(i).price.value);
      param+='&order_menu_optiona='+document.getElementById(i).optiona.value;
      param+='&order_menu_optionb='+document.getElementById(i).optionb.value;
      param+='&order_menu_optionc='+document.getElementById(i).optionc.value;
      param+='&shop=${param.shop}';
      sendRequest('cart_del.do',param,cartdelsult,'GET');
   }
   
</script>
<script>
   //즐겨찾기 추가및 삭제
   function bookMenuAdd(menu_idx,chk){
      
      sendRequest('bookMenuAdd.do','menu_idx='+menu_idx,bookMenuAddResult,'GET');
       
      
      if(chk==0){
         $('#b_'+menu_idx).attr('src','img/star1.png');
         $('#a_'+menu_idx).attr('onClick','bookMenuAdd('+menu_idx+',1)');
      }
       if(chk==1)   {
         $('#b_'+menu_idx).attr('src','img/star0.png');
         $('#a_'+menu_idx).attr('onClick','bookMenuAdd('+menu_idx+',0)');   
      }
   }
   
   function bookMenuAddResult(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            var data=XHR.responseText;
            
            
            //alert(data);
            //var str=document.all.bookMarkForm;
            //str.innerHTML=data;

         }
      }
   }
</script>
<script>
   function cartcount(){
      var shop = document.getElementById('shop_idx').value;
      var param = 'shop='+shop;

      sendRequest('cart_count.do',param,cartcntResult,'GET');
   }
   function cartcntResult(){
      if(XHR.readyState==4){
         if(XHR.status==200){
            var data=XHR.responseText;
            var cartData = eval('('+data+')');
            var count = cartData.cartcount;
            var tprice = cartData.tprice;
            document.getElementById('cartcount').innerHTML=count;
            document.getElementById('cartprice').innerHTML=setComma(tprice);
            var shop = cartData.shop;
            loadcartList(shop);
            
         }
      }
   }
</script>
</head>

<body onload="show('${cate}')">
<div id="body-wrapper" class="animsition">
<%@include file="/in/header.jsp" %>
    <!-- Content -->
    <div id="content">

        <!-- Page Title -->
        <div class="page-title bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 push-lg-4">
                        <h1 class="mb-0">Menu</h1>
                        <h4 class="text-muted mb-0">10cm CAFE</h4>
                    </div>
                </div>
            </div>
        </div>

        <!-- Page Content -->
        <div class="page-content">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-3">
                        <!-- Menu Navigation -->
                        <nav id="menu-navigation" class="stick-to-content" data-local-scroll>
                            <ul class="nav nav-menu bg-dark dark">
                        <c:forEach var="cate" items="${shopcategory}">
                           <li><A href="javascript:;" onclick="javascript:show('${cate.category_idx}')">${cate.category_name}</A></li>
                        </c:forEach>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-md-9" id="menuList">
                        <!-- 카테고리 클릭시 변경해야 되는부분 시작-->
                        <div id="Coffee" class="menu-category">
                            <div class="menu-category-title">
                                <div class="bg-image" style="background-image:url('img/menu/cate2.jsp');"></div>
                                <h2 class="title"></h2>
                            </div>
                            <div class="menu-category-content padded">
                                <div class="row gutters-sm">
                                <!-- 메뉴 리스트부분 시작 -->
                                <c:forEach var="list" items="${menuList}">
                                    <div class="col-lg-4 col-6">
                                        <!-- Menu Item -->
                                        <div class="menu-item menu-grid-item">
                                            <img class="mb-4" src="img/menu/${list.menu_img }" alt="" height="263"><!-- 이미지 변경 요망 -->
                                            <h6 class="mb-0">${list.menu_name}</h6>
                                            <span class="text-muted text-sm"></span>
                                            <div class="row align-items-center mt-4">
                                                <div class="col-sm-6"><span class="text-md mr-4"><span class="text-muted"></span><fmt:formatNumber value="${list.menu_price}" pattern="#,##0" /></span></div>
                                            </div>
                                        </div>
                                    </div>
                                 </c:forEach>   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

                        <!-- 카테고리 클릭시 변경해야 되는부분 시작-->
   <%@include file="/in/footer.jsp" %>
                  
                      </div>
                      
    <!-- 장바구니 부분 -->
    <div id="panel-cart">
    <input type="hidden" name="shop_idx" id="shop_idx" value="${shop}">
        <div class="panel-cart-container">
            <div class="panel-cart-title">
                <h5 class="title">Your Cart</h5>
                <button class="close" data-toggle="panel-cart"><i class="ti ti-close"></i></button>
            </div>
            <div class="panel-cart-content" id="carts">
                     <c:set var="i" value="0"></c:set>
                     <c:set var="totalprice" value="0"></c:set>
                   <!-- 장바구니 내역 부분 시작 -->
                   <c:forEach var="cartlist" items="${cartList}" >
                   <form id="${i}">
                       <table class="table-cart">
                       <tr>
                           <td class="title" style="width: 150px;">
                              <input type="hidden" name="idx" value="${cartlist.order_menu_idx}">
                               <span class="name"><input class="intext" type="text" name="name" style="width: 80px" value="${cartlist.order_menu_name}"></span>
                               <span class="caption text-muted">

                                     <input class="lotext text-muted" type="text" size="1" style="width: 25px" name="optiona" value="${cartlist.order_menu_optiona}">,


                                     <input class="lotext text-muted" type="text" size="1" style="width: 30px" name="optionb" value="${cartlist.order_menu_optionb}">,
      
   
                                     <input class="lotext text-muted" type="text" size="1" style="width: 25px" name="optionc" value="${cartlist.order_menu_optionc}">
                                                                                       
                               </span>
                           </td>
                           <td class="price"><input class="intext" style="width: 60px" type="text" name="price" value="<fmt:formatNumber value="${cartlist.order_menu_price}" pattern="#,##0" />"></td>
                           <td><a href="javascript:;" onclick="mamount('${i}');totalprice();">-</a> <input type="text" class="intext" name="cartamount" size="1"id="amount" value="${cartlist.order_menu_amount}" readonly="readonly"> <a href="javascript:;" onClick="pamount('${i}');totalprice();">+</a></td>
                           <td class="actions">      
                               <a href="javascript:;" onclick="cartdel('${i}')"><i class="ti ti-close"></i></a>
                           </td>
                       </tr>
                      <!-- 장바구니 내역 부분 끝 -->
                      </table>
                   </form>
                   <c:set var="i" value="${i+1}"></c:set>
                   <c:set var="totalprice" value="${totalprice+cartlist.order_menu_price*cartlist.order_menu_amount}"></c:set>
                   </c:forEach>
                
                <!-- 장바구니 토탈 정보 시작 -->
                <div class="cart-summary">
                    <hr class="hr-sm">
                    <div class="row text-lg">
                        <div class="col-7 text-right text-muted">Total:</div>
                        <div class="col-5" ><strong id="tprice"><fmt:formatNumber value="${totalprice}" pattern="#,##0" /></strong></div>
                    </div>
                </div>
                <!-- 장바구니 토탈 정보 끝-->                
            </div>
        </div>
        <a href="javascript:;" class="panel-cart-action btn btn-secondary btn-block btn-lg" onClick="goOrdercart()"><span>Go to checkout</span></a>
    </div>

    <!-- Panel Mobile -->
    <nav id="panel-mobile">
        <div class="module module-logo bg-dark dark">
            <a href="index.do">
                <img src="img/LOGO-4.svg" alt="" width="130" height="130">
                       
            </a>
            <button class="close" data-toggle="panel-mobile"><i class="ti ti-close"></i></button>
        </div>
        <nav class="module module-navigation"></nav>
        
    </nav>

    <!-- Body Overlay -->
    <div id="body-overlay"></div>


</div>



<!-- 메뉴 상세보기 div 시작-->
<div class="modal fade" id="productModal" role="dialog">
    <div class="modal-dialog" role="document">
    <form name="fm_menu" action="order.do" method="POST" id="menucontent">

    </form>    
    </div>
</div>
<!-- 메뉴 상세보기 div 끝-->



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