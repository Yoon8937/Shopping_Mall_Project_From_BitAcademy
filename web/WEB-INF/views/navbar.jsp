<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>navbarrr</title>
</head>
<body>
<!-- Header -->
<header>
  <!-- Header desktop -->
  <div class="container-menu-desktop">
    <!-- Topbar -->
    <div class="top-bar">
      <div class="content-topbar flex-sb-m h-full container">
        <div class="left-top-bar">
          Free shipping for standard order over $100
        </div>

        <div class="right-top-bar flex-w h-full">
          <a href="#" class="flex-c-m trans-04 p-lr-25">
            Help & FAQs
          </a>

          <a href="#" class="flex-c-m trans-04 p-lr-25">
            My Account
          </a>

          <a href="#" class="flex-c-m trans-04 p-lr-25">
            EN
          </a>

          <a href="#" class="flex-c-m trans-04 p-lr-25">
<%--            USD--%>
            KRW
          </a>
        </div>
      </div>
    </div>

    <div class="wrap-menu-desktop">
      <nav class="limiter-menu-desktop container">

        <!-- Logo desktop -->
        <a href="/" class="logo">
          <img src="/resources/images/icons/logo-01.png" alt="IMG-LOGO">
        </a>

        <!-- Menu desktop -->
        <div class="menu-desktop">
          <ul class="main-menu">
            <li class="active-menu">
              <a href="/">Home</a>
<%--              <ul class="sub-menu">--%>
<%--                <li><a href="index.html">Homepage 1</a></li>--%>
<%--                <li><a href="home-02.html">Homepage 2</a></li>--%>
<%--                <li><a href="home-03.html">Homepage 3</a></li>--%>
<%--              </ul>--%>
            </li>

            <li>
              <a href="/">Shop</a>
            </li>

            <li>
              <a href="/">About</a>
            </li>

              <c:if test="${logIn.rank eq 'ROLE_ADMIN'}">
                <li>
                  <a href="/member/admin">회원관리</a>
                </li>
              </c:if>

            <li>
              <a href="/product/register">상풍등록</a>
            </li>

            <c:choose>
              <c:when test="${logIn eq null}">
                <li>
                  <a href="/member/login">로그인</a>
                </li>
              </c:when>
              <c:otherwise>
                <li>
                  <a href="/member/logout">로그아웃</a>
                  <%
//                    스프링 시큐리티를 사용함으로, 이렇게 해 줄 필요없음
//                    session.invalidate();
                  %>
                </li>
              </c:otherwise>
            </c:choose>

            <a href="/image">image</a>


          </ul>
        </div>

        <!-- Icon header -->
        <div class="wrap-icon-header flex-w flex-r-m">

          <c:if test="${logIn ne null}">
            <h5 style="color: black; font-weight: 600">${logIn.getNickname()} 님</h5>
<%--            <h5 style="color: bl   ack">${logIn.getNickname()} 님</h5>--%>
          </c:if>

          <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
            <i class="zmdi zmdi-search"></i>
          </div>

<%--          이것은 카트입니다.--%>
          <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
            <i class="zmdi zmdi-shopping-cart"></i>
          </div>

<%--          <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">--%>
<%--            <i class="zmdi zmdi-favorite-outline"></i>--%>
<%--          </a>--%>
        </div>
      </nav>
    </div>
  </div>

  <!-- Header Mobile -->
  <div class="wrap-header-mobile">
    <!-- Logo moblie -->
    <div class="logo-mobile">
      <a href="index.html"><img src="images/icons/logo-01.png" alt="IMG-LOGO"></a>
    </div>

    <!-- Icon header -->
    <div class="wrap-icon-header flex-w flex-r-m m-r-15">
      <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
        <i class="zmdi zmdi-search"></i>
      </div>

      <div class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti js-show-cart" data-notify="2">
        <i class="zmdi zmdi-shopping-cart"></i>
      </div>

<%--      <a href="#" class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-r-11 p-l-10 icon-header-noti" data-notify="0">--%>
<%--        <i class="zmdi zmdi-favorite-outline"></i>--%>
<%--      </a>--%>
    </div>

    <!-- Button show menu -->
<%--    <div class="btn-show-menu-mobile hamburger hamburger--squeeze">--%>
<%--				<span class="hamburger-box">--%>
<%--					<span class="hamburger-inner"></span>--%>
<%--				</span>--%>
<%--    </div>--%>

  </div>


  <!-- Menu Mobile -->
  <div class="menu-mobile">
    <ul class="topbar-mobile">
      <li>
        <div class="left-top-bar">
          Free shipping for standard order over $100
        </div>
      </li>

      <li>
        <div class="right-top-bar flex-w h-full">
          <a href="#" class="flex-c-m p-lr-10 trans-04">
            Help & FAQs
          </a>

          <a href="#" class="flex-c-m p-lr-10 trans-04">
            My Account
          </a>

          <a href="#" class="flex-c-m p-lr-10 trans-04">
            EN
          </a>

          <a href="#" class="flex-c-m p-lr-10 trans-04">
            USD
          </a>
        </div>
      </li>
    </ul>

    <ul class="main-menu-m">
      <li>
        <a href="index.html">Home</a>
        <ul class="sub-menu-m">
          <li><a href="index.html">Homepage 1</a></li>
          <li><a href="home-02.html">Homepage 2</a></li>
          <li><a href="home-03.html">Homepage 3</a></li>
        </ul>
        <span class="arrow-main-menu-m">
						<i class="fa fa-angle-right" aria-hidden="true"></i>
					</span>
      </li>

      <li>
        <a href="product.html">Shop</a>
      </li>

      <li>
        <a href="shoping-cart.html" class="label1 rs1" data-label1="hot">Features</a>
      </li>

      <li>
        <a href="blog.html">Blog</a>
      </li>

      <li>
        <a href="about.html">About</a>
      </li>

      <li>
        <a href="contact.html">Contact</a>
      </li>
    </ul>
  </div>

  <!-- Modal Search -->
  <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
    <div class="container-search-header">
      <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
        <img src="images/icons/icon-close2.png" alt="CLOSE">
      </button>

      <form class="wrap-search-header flex-w p-l-15">
        <button class="flex-c-m trans-04">
          <i class="zmdi zmdi-search"></i>
        </button>
        <input class="plh3" type="text" name="search" placeholder="Search...">
      </form>
    </div>
  </div>
</header>

<!--===============================================================================================-->
<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<script src="/resources/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/vendor/select2/select2.min.js"></script>
<%--<script>--%>
<%--  $(".js-select2").each(function(){--%>
<%--    $(this).select2({--%>
<%--      minimumResultsForSearch: 20,--%>
<%--      dropdownParent: $(this).next('.dropDownSelect2')--%>
<%--    });--%>
<%--  })--%>
<%--</script>--%>
<!--===============================================================================================-->
<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<script src="/resources/vendor/slick/slick.min.js"></script>
<script src="/resources/js/slick-custom.js"></script>
<script src="/resources/vendor/parallax100/parallax100.js"></script>
<script>
  $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="/resources/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<%--<script>--%>
<%--  $('.gallery-lb').each(function() { // the containers for all your galleries--%>
<%--    $(this).magnificPopup({--%>
<%--      delegate: 'a', // the selector for gallery item--%>
<%--      type: 'image',--%>
<%--      gallery: {--%>
<%--        enabled:true--%>
<%--      },--%>
<%--      mainClass: 'mfp-fade'--%>
<%--    });--%>
<%--  });--%>
<%--</script>--%>
<!--===============================================================================================-->
<script src="/resources/vendor/isotope/isotope.pkgd.min.js"></script>
<script src="/resources/vendor/sweetalert/sweetalert.min.js"></script>
<%--<script>--%>
<%--  $('.js-addwish-b2').on('click', function(e){--%>
<%--    e.preventDefault();--%>
<%--  });--%>

<%--  $('.js-addwish-b2').each(function(){--%>
<%--    var nameProduct = $(this).parent().parent().find('.js-name-b2').html();--%>
<%--    $(this).on('click', function(){--%>
<%--      swal(nameProduct, "is added to wishlist !", "success");--%>

<%--      $(this).addClass('js-addedwish-b2');--%>
<%--      $(this).off('click');--%>
<%--    });--%>
<%--  });--%>

<%--  $('.js-addwish-detail').each(function(){--%>
<%--    var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();--%>

<%--    $(this).on('click', function(){--%>
<%--      swal(nameProduct, "is added to wishlist !", "success");--%>

<%--      $(this).addClass('js-addedwish-detail');--%>
<%--      $(this).off('click');--%>
<%--    });--%>
<%--  });--%>

<%--  /*---------------------------------------------*/--%>

<%--  $('.js-addcart-detail').each(function(){--%>
<%--    var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();--%>
<%--    $(this).on('click', function(){--%>
<%--      swal(nameProduct, "is added to cart !", "success");--%>
<%--    });--%>
<%--  });--%>

<%--</script>--%>
<%--<!--===============================================================================================-->--%>
<script src="/resources/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
  $('.js-pscroll').each(function(){
    $(this).css('position','relative');
    $(this).css('overflow','hidden');
    var ps = new PerfectScrollbar(this, {
      wheelSpeed: 1,
      scrollingThreshold: 1000,
      wheelPropagation: false,
    });

    $(window).on('resize', function(){
      ps.update();
    })
  });
</script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>
