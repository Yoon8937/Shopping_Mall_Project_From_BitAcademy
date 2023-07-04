<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
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

<!-- Header -->
<header>
    <!-- Header desktop -->
    <div class="container-menu-desktop">
        <!-- Topbar -->
        <div class="top-bar">
            <div class="content-topbar flex-sb-m h-full container">
                <div class="left-top-bar">
                    Thanks For Using Our Service - C h e r r y
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

                    <a class="flex-c-m trans-04 p-lr-25" style="color: white">dfs</a>

                    <a href="#" class="flex-c-m trans-04 p-lr-25">
                        USD
                    </a>
                </div>
            </div>
        </div>



<div class="container-fluid">
    <div class="row vh-100 align-items-center text-center">
        <div class="row justify-content-center">
            <form method="post" action="/member/auth" onsubmit="return formCheck(this);">
                <div id="msg">
                    <div class="row justify-content-center mb-2">
                    <div class="col-6">
                        <div class="form-floating">
                            <input type="text" id="username" name="username" class="form-control" placeholder="아이디">
                            <label for="username">아이디</label>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-6">
                        <div class="form-floating">
                            <input type="password" id="password" name="password" class="form-control"
                                   placeholder="비밀번호">
                            <label for="password">비밀번호</label>
                        </div>
                    </div>
                </div>
                <div class="flex-c-m flex-w w-full p-t-45 row justify-content-center">
                    <%--                    <button type="submit" class="col-3 flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">로그인</button>--%>
                    <button class="col-3 flex-c-m stext-101 cl0 size-103 bg1 bor1 hov-btn2 p-lr-15 trans-04">
                        로그인
                    </button>
                    <a href="/member/register"
                       class="col-3 flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
                        회원가입
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

        <c:import url="../footer.jsp"/>

        <script>
            function formCheck(frm) {

                if(frm.username.value.length==0) {
                    alert("아이디를 입력해주세요");
                    return false;
                }

                if(frm.password.value.length == 0){
                    alert("비밀번호를 입력해주세요");
                    return false;
                }

                return true;
            }
        </script>
</body>
</html>
