<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이미지 테스트</title>
</head>
<body>
<h1>hello world</h1>

<form action="/saveImage" enctype="multipart/form-data" method="post">
    <input type="file" name="imgFile"/>
    <input type="submit" value="이미지저장"/>
</form>
===============================================================================================

<table id="testTable">
    <colgroup>
        <col style="width: 10%">
        <col style="width:
        <col style="width: 20%">
    </colgroup>
    <thead>
    <tr>
        <th>No.</th>
        <th>Contents</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>1</td>
        <td>내용1</td>
        <td>
            <button type="button" class="btn_delete">Delete</button>
        </td>
    </tr>
    <tr>
        <td>2</td>
        <td>내용1</td>
        <td>
            <button type="button" class="btn_delete">Delete</button>
        </td>
    </tr>
    <tr>
        <td>3</td>
        <td>내용1</td>
        <td>
            <button type="button" class="btn_delete">Delete</button>
        </td>
    </tr>
    <tr>
        <td>4</td>
        <td>내용1</td>
        <td>
            <button type="button" class="btn_delete">Delete</button>
        </td>
    </tr>
    <tr>
        <td>5</td>
        <td>내용1</td>
        <td>
            <button type="button" class="btn_delete">Delete</button>
        </td>
    </tr>
    </tbody>
</table>

<script>
    var eventTarget = document.getElementsByClassName('btn_delete')

    // for (var i=0; i<eventTarget.length; i++) {
    //     eventTarget[i].addEventListener('click', function() {
    //         console.log('event동작')
    //     })
    // }

    for (var i=0; i<eventTarget.length; i++) {
        eventTarget[i].addEventListener('click', function() {
            var parent = document.querySelector('#testTable tbody')
            parent.removeChild(this.parentElement.parentElement)
            i --
        })
    }
</script>
</body>
</html>
