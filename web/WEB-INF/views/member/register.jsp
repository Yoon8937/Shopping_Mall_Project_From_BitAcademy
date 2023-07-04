<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>

    <form method="post" action="/member/register">
        <input type="text" placeholder="아이디를 입력해 주세요" name="username">
        <input type="password" placeholder="비번 입력해라" name="password">
        <input type="text" placeholder="닉네임 입력하셈" name="nickname">


        <select name="rank">
            <option value="ROLE_USER">일반회원</option>
            <option value="ROLE_SELLER">판매자</option>
        </select>

        <button href="/member/register">가입하기</button>
    </form>

</body>
</html>
