<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>장바구니</title>
  <link rel="icon" type="image/png" href="/resources/images/icons/favicon.png"/>
  <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
  <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
  <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
  <link rel="stylesheet" type="text/css" href="/resources/css/main.css">

    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script src="/resources/assert/updateCart.js"></script>

</head>
<body onload="updateUI()">
<c:import url="../navbar.jsp"/>
<br/>
<br/>
<br/>

<!-- breadcrumb -->
<div class="container">
  <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
    <a href="/" class="stext-109 cl8 hov-cl1 trans-04">
      Home
      <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
    </a>

    <span class="stext-109 cl4">
				Shoping Cart
			</span>
  </div>
</div>

<!-- Shoping Cart -->
<form class="bg0 p-t-75 p-b-85" method="post" action="/product/checkout">
  <div class="container">
    <div class="row">
      <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
        <div class="m-l-25 m-r--38 m-lr-0-xl">
          <div class="wrap-table-shopping-cart">
            <table class="table-shopping-cart" id="shoppingCart">
                <tbody id="tmp_tbody">
              <tr class="table_head">
                <th class="column-1">Product</th>
                <th class="column-2"></th>
                <th class="column-3">Price</th>
                <th class="column-4">Quantity</th>
                <th class="column-5">Total</th>
                <th class="column-6"></th>
              </tr>



                <c:forEach items="${cartList}" var="item">


                    <tr class="table_row">
                        <td class="column-1">
                            <div>
                                <img src="data:image/png;base64,${item.img} " alt="IMG" style="width: 60px; height: 80px"/>
<%--                                제품번호 : ${item.productId}--%>
                            </div>
                        </td>

                        <td class="column-2">${item.productName}</td>

                        <td class="column-3">${item.originalPrice} KRW</td>

                        <td class="column-4">

                            <select id="productSelect${item.id}" onchange="productMethod(${item.id}, ${item.originalPrice}, ${item.productId}, ${total}, ${item.quantity})">
                                <option selected id="selected${item.id}" value="${item.quantity}">${item.quantity}</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
<%--                            <div class="wrap-num-product flex-w m-l-auto m-r-0">--%>
<%--                                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m"--%>
<%--                                     onclick="minus_method()">--%>
<%--                                    <i class="fs-16 zmdi zmdi-minus"></i>--%>
<%--                                </div>--%>

<%--                                <input class="quantity_input mtext-104 cl3 txt-center num-product " type="number"--%>
<%--                                       name="num-product2" value="${item.quantity}" id="quantity_input">--%>

<%--                                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m" onclick="plus_method()">--%>
<%--                                    <i class="fs-16 zmdi zmdi-plus"></i>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </td>

                        <td class="column-5" id="td_price${item.productId}">${item.price}</td>

                        <td class="column-6">
                                <%--                  <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-delete-product">--%>
<%--                            삭 제 버 튼--%>
                            <button type="button" class="btn_delete fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04" onclick="deleteProduct(${item.productId}, ${item.price}, ${total})">
                                <i class="zmdi zmdi-close"></i>
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>

          </div>
        </div>
      </div>

      <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
        <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
          <h4 class="mtext-109 cl2 p-b-30">
            Cart Totals
          </h4>

          <div class="flex-w flex-t bor12 p-b-13">
            <div class="size-208">
								<span class="stext-110 cl2">
									Subtotal:
								</span>
            </div>

            <div class="size-209">
								<span class="mtext-110 cl2" id="total1">
<%--									$79.65--%>
                                    ${total} KRW(원)
								</span>
            </div>
          </div>

          <div class="flex-w flex-t bor12 p-t-15 p-b-30">
            <div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Shipping:
								</span>
            </div>

            <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
              <p class="stext-111 cl6 p-t-2">
                There are no shipping methods available. Please double check your address, or contact us if you need any help.
              </p>

              <div class="p-t-15">
									<span class="stext-112 cl8">
										Calculate Shipping
									</span>

                <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
                  <select class="js-select2" name="time">
                    <option>Select a country...</option>
                    <option>KR</option>
                    <option>USA</option>
                    <option>UK</option>
                  </select>
                  <div class="dropDownSelect2"></div>
                </div>

                <div class="bor8 bg0 m-b-12">
                  <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="State /  country">
                </div>

                <div class="bor8 bg0 m-b-22">
                  <input class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="Postcode / Zip">
                </div>

                <div class="flex-w">
<%--                  <div class="flex-c-m stext-101 cl2 size-115 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer">--%>
<%--                    Update Totals--%>
<%--                  </div>--%>
                </div>

              </div>
            </div>
          </div>

          <div class="flex-w flex-t p-t-27 p-b-33">
            <div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
            </div>

            <div class="size-209 p-t-1">
								<span class="mtext-110 cl2" id="total2">
<%--									$79.65--%>
                                    ${total} KRW(원)
								</span>
            </div>
          </div>

          <button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
<%--            Proceed to Checkout--%>
              결 제 하 기
          </button>
        </div>
      </div>

    </div>
  </div>
</form>


<c:import url="../footer.jsp"/>


<!--===============================================================================================-->
<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<script src="/resources/vendor/bootstrap/js/popper.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/vendor/select2/select2.min.js"></script>
<script>
  $(".js-select2").each(function(){
    $(this).select2({
      minimumResultsForSearch: 20,
      dropdownParent: $(this).next('.dropDownSelect2')
    });
  })
</script>
<!--===============================================================================================-->
<script>
  // $("js-delete-product").each
  var eventTarget = document.getElementsByClassName('btn_delete');

  for (var i=0; i<eventTarget.length; i++) {
    eventTarget[i].addEventListener('click', function() {
      var parent = document.querySelector('#shoppingCart tbody')
      parent.removeChild(this.parentElement.parentElement)
      i --
    })
  }

</script>
<!--===============================================================================================-->
<script src="/resources/js/main.js"></script>

</body>
</html>
