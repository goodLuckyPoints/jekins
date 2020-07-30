<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改用户</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js" ></script>
    <style>
        .i1{
            width: 200px;
        }
    </style>
    <script>
        $(function () {
            var userId = localStorage.getItem("userId");
            $.ajax({
                url:"${pageContext.request.contextPath}/selectId/"+userId,
                type:"get",
                success:function (data) {
                    var user = data;
                    $("#userId").val(user.id)
                    $("#username").val(user.username);
                    if (user.gender == true) {
                        $(".gender").attr("checked","checked")
                    }
                    $(".gender").attr("checked","checked")
                    $("#registerTime").val(user.registerTime);
                }
            });
        })
        //修改用户信息
        function OnUpdate() {
            $.ajax({
                url:"${pageContext.request.contextPath}/update",
                type:"post",
                data:$("#myForm").serialize(),
                //默认请求格式
                contentType:"application/x-www-form-urlencoded;charset=utf8",
                success:function (data) {
                    console.log(data);
                    if (data.msg == "修改成功") {
                        location.href="${pageContext.request.contextPath}/users/1"
                    }
                }
            });
        }
    </script>
</head>
<body>
<form class="container-fluid" id="myForm" enctype="application/x-www-form-urlencoded">
    <div class="form-group">
        <input type="hidden" id="userId" name="id" >
    </div>
    <div class="form-group">

        Username<label for="username"></label>
        <input type="text" name="username" class="i1 form-control" id="username" >
    </div>
    <div class="form-group">
        Gender<br>
        male<label>
                <input type="radio" name="gender" class="gender" value="true" >
            </label>
        female<label>
                <input type="radio" name="gender" class="gender"  value="false">
            </label>
    </div>
    <div class="form-group">
        RegisterTime
        <label for="registerTime"></label>
        <input type="date" name="registerTime" class="i1 form-control" id="registerTime" >
    </div>
    <button type="button" class="btn btn-default" onclick="OnUpdate()">Submit</button>
</form>
</body>
</html>
