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
<script  type="text/javascript" src="js/httpRequest.js"></script>
<script src="js/Num.js"></script>
<script src="js/httpPage.js"></script>
<script>
function bookMenuAdd(menu_idx){

   param='menu_idx='+menu_idx;
   sendRequest('bookMenuAdd.do',param,bookMenuAddResult,'GET');
}

function bookMenuAddResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;
         alert(data);
         bookMarkMenuList(1,'${shop}');
      }
   }
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

function bookMarkMenuList(i,shop){
   var cp=i;
   if(cp==''){
      cp=1;
   }

   sendRequest('bookMarkMenuList.do','cp='+cp+'&shop_idx='+shop,bookMarkMenuListResult,'GET');
   
}
function bookMarkMenuListResult(){
   if(XHR.readyState==4){
      if(XHR.status==200){
         var data=XHR.responseText;
         
         var str=document.all.bookMarkMenuForm;
         str.innerHTML=data;
         
      }
   }
}
</script>
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
      location.href='shop_menuList.do?shop='+idx;
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
            document.getElementById('cartcount2').innerHTML=count;
            document.getElementById('cartprice').innerHTML=setComma(tprice);
            var shop = cartData.shop;
            loadcartList(shop);
            
         }
      }
   }
</script>
<script>

function mapi(){
   var optionb=document.getElementById('optionbs').value;
   var price= document.getElementById('order_menu_price').value;
   if(optionb=='false'){
      document.getElementById('order_menu_price').value=parseInt(price)-500;
      document.getElementById('mprice').value=setComma(parseInt(price)-500);
      var totalprice = parseInt(document.getElementById('order_menu_price').value)*parseInt(document.getElementById('amount').value); 
      document.getElementById('totalprice').innerHTML='총 결재 금액:    '+setComma(totalprice)+' 원';
      document.getElementById('optionb').value='레귤러';
      document.getElementById('optionbs').value='true';
   }
   
}
function adpi(){
   var optionb=document.getElementById('optionbs').value;
   var price= document.getElementById('order_menu_price').value;
   if(optionb=='true'){
      document.getElementById('order_menu_price').value=parseInt(price)+500;
      document.getElementById('mprice').value=setComma(parseInt(price)+500);
      var totalprice = parseInt(document.getElementById('order_menu_price').value)*parseInt(document.getElementById('amount').value); 
      document.getElementById('totalprice').innerHTML='총 결재 금액:    '+setComma(totalprice)+' 원';
      document.getElementById('optionb').value='라지';
      document.getElementById('optionbs').value='false';
   }
   

}
function optionaA(){
   document.getElementById('optiona').value='HOT'
}
function optionaB(){
   document.getElementById('optiona').value='ICE'
}
function optioncA(){
   document.getElementById('optionc').value='매장';
}
function optioncB(){
   document.getElementById('optionc').value='포장';
}
</script>
<c:if test="${empty sessionScope.id }">
<script>
alert('로그인이 필요한 페이지입니다.');
location.href='index.do';   
</script>
</c:if>
<style>
#button{
	   border: none; /*---테두리 정의---*/
	   background-Color: #D6C8A1; /*--백그라운드 정의---*/
	   font: 12px 굴림; /*--폰트 정의---*/
	   font-weight: bold; /*--폰트 굵기---*/
	   color: white; /*--폰트 색깔---*/
	   width: 70px;
	   height: 30px; /*--버튼 크기---*/
	   border-radius: 10px;
}
</style>  
</head>
<body onload="bookMarkMenuList('${cp}','${shop}')">

<!-- Body Wrapper -->
<div id="body-wrapper" class="animsition">
<!-- Header -->
    <header id="header" class="light">

        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <!-- Logo -->
                    <div class="module module-logo dark">
                       
                        <a href="index.do">
                            <img src="img/LOGO-4.svg" alt="" width="130" height="130">
                        </a>
                    </div>
                </div>
                <div class="col-md-7">
                    <!-- Navigation -->
                    <nav class="module module-navigation left mr-4">
                        <ul id="nav-main" class="nav nav-main">
                           <li class="has-dropdown">
                                <a href="javascript:;">Menu</a>
                                <div class="dropdown-container">
                                    <ul>
                              <c:forEach var="cate" items="${list}">
                                 <li><A href="javascript:;" onclick="show('${param.shop}')">${cate.category_name}</A></li>
                              </c:forEach>
                                    </ul>
                                </div>
                            </li>
                            <li><a href="bookMenuForm.do?shop=${param.shop}">즐겨찾기</a></li>
                          
                        </ul>
                    </nav>
                </div>
               
            </div>
        </div>

    </header>
    <!-- Header / End -->

    <!-- Header -->
    <header id="header-mobile" class="light">
   
        <div class="module module-nav-toggle">
            <a href="javascript:;" id="nav-toggle" data-toggle="panel-mobile"><span></span><span></span><span></span><span></span></a>
        </div>    

        <div class="module module-logo">
            <a href="index.do">
               <img src="img/LOGO-BLACK.svg" alt="">
                       
            </a>
        </div>

        <a href="javascript:;" class="module module-cart" data-toggle="panel-cart">
            <i class="ti ti-shopping-cart"></i>
            <span class="notification" id="cartcount2">${cartcnt}</span>
        </a>

    </header>
    <!-- Header / End -->
   
    <!-- Content -->
    <div id="content">

        <!-- Page Title -->
        <div class="page-title bg-light">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 push-lg-4">
                        <h1 class="mb-0">즐겨찾기</h1>
                        <h4 class="text-muted mb-0">메뉴 즐겨찾기</h4>
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
                                <li>메뉴 목록</li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-md-9">
                        <!-- Menu Category / Burgers -->
                        <div id="Burgers" class="menu-category">
                            <div class="menu-category-title">
                                <div class="bg-image"><img src="img/bookmenu.jpg" alt=""></div>
                                <input type="hidden" name="shop_idx" id="shop_idx" value="${param.shop}">
                                <h2 class="title">MenuBookMark</h2>
                            </div>
                            <div class="menu-category-content">
                                <!-- Menu Item -->
                                <div class="menu-item menu-list-item">
                                    <div class="row align-items-center">
                              <div class="container" id="bookMarkMenuForm" align="center">
                              </div>
                                    </div>
                                </div>

                                    </div>
                                </div>
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

<!-- 메뉴 상세보기 div 시작-->
<div class="modal fade" id="productModal" role="dialog">
    <div class="modal-dialog" role="document">
    <form name="fm_menu" action="order.do" method="POST" id="menucontent">
		
    </form>    
    </div>
</div>
<!-- 메뉴 상세보기 div 끝-->
       
</div>
 <%@include file="/in/footer.jsp" %>


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