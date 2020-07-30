<%--
  Created by IntelliJ IDEA.
  User: 25451
  Date: 2020/7/15
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>
        function onInsert() {
            $.ajax({
                url:"${pageContext.request.contextPath}/user",
                data:$("#myForm").serialize(),
                type:"post",
                contentType:"application/x-www-form-urlencoded;charset=utf8",
                success:function (data) {
                    if (data.msg == "添加成功") {
                        location.href="${pageContext.request.contextPath}/users/1"
                    }
                }
            });
        }
    </script>
</head>
<body>
<form class="container" id="myForm">
    <div class="form-group">
        <label for="usernameInputEmail1">Username</label>
        <input type="text" name="username" class="form-control" id="usernameInputEmail1" placeholder="请输入用户名">
    </div>
    <div class="form-group">
        <label >Gender</label><br>
        male:<input type="radio" name="gender" value="true">
        female:<input type="radio" name="gender" value="false" >
    </div>
    <div class="form-group">
        <label for="registerTimeInputPassword1">RegisterTime</label>
        <input type="date" name="registerTime" class="form-control" id="registerTimeInputPassword1" placeholder="生日">
    </div>
    <button type="button" class="btn btn-default" onclick="onInsert()">Submit</button>
</form>
</body>
</html>
