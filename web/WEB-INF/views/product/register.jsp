<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>상품등록</title>
    <link rel="icon" type="image/png" href="/resources/images/icons/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/fonts/linearicons-v1.0.0/icon-font.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/MagnificPopup/magnific-popup.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/main.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
</head>
<body>

<c:import url="../navbar.jsp"/>

<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('/resources/images/bg-01.jpg');">
    <h2 class="ltext-105 cl0 txt-center">
        Product  Register
    </h2>
</section>


<div class="container">
<%--        <div class="container-fluid">--%>
    <div class="size-210 bor10 p-lr-70 p-t-55 p-b-70 p-lr-15-lg w-full-md">

        <form action="/product/register" enctype="multipart/form-data" method="post" onsubmit="return formCheck(this);">
            <h4 class="mtext-105 cl2 txt-center p-b-30">제품 등록</h4>
            <div class="bor8 m-b-20 how-pos4-parent">
                <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text"
                       name="name" placeholder="제품명을 입력해주세요">
                <img class="how-pos4 pointer-none" src="/resources/images/icons/product%20(1).png" sizes="10" alt="ICON">
            </div>

            <div class="bor8 m-b-20 how-pos4-parent">
                <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text"
                       name="price" placeholder="가격(KRW)을 입력해주세요">
                <img class="how-pos4 pointer-none" src="/resources/images/icons/price-tag%20(1).png" alt="ICON">
            </div>

            <div class="bor8 m-b-20 how-pos4-parent">
                <input class="stext-111 cl2 plh3 size-116 p-l-62 p-r-30" type="text"
                       name="quantity" placeholder="수량을 입력해주세요">
                <img class="how-pos4 pointer-none" src="/resources/images/icons/box%20(1).png" alt="ICON">
            </div>

            <div class="bor8 m-b-30">
                    <textarea class="stext-111 cl2 plh3 size-110 p-lr-28 p-tb-25"
                              name="info" placeholder="제품 정보를 입력해주세요"></textarea>
            </div>

            <div><input type="file" name="imgFile1"></div>
            <br/>
            <div><input type="file" name="imgFile2"></div>
            <br/>
            <div><input type="file" name="imgFile3"></div>
            <br/>

            <button class="flex-c-m stext-101 cl0 size-121 bg3 bor1 hov-btn3 p-lr-15 trans-04 pointer">
                등 록 하 기
            </button>

        </form>
    </div>
</div>

<br/>
<br/>
<br/>

<script>
    function formCheck(frm) {
        if(isNaN(frm.price.value)){
            alert("가격에 숫자만 입력해주세요");
            return false;
        }
        if(isNaN(frm.quantity.value)){
            alert("수량에 숫자만 입력해주세요");
            return false;
        }
        if(frm.name.value.length==0) {
            alert("제품 이름을 입력해주세요");
            return false;
        }
        if(frm.price.value.length==0) {
            alert("가격을 입력해주세요");
            return false;
        }
        if(frm.quantity.value.length==0) {
            alert("수량을 입력해주세요");
            return false;
        }
        if(frm.info.value.length==0) {
            alert("제품 정보를 입력해주세요");
            return false;
        }
        return true;
    }
</script>
<c:import url="../footer.jsp"/>
</body>
</html>
