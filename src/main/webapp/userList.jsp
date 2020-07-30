<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
    <title>查询所有用户</title>
    <script>
        function onUpdate(userId) {

            //存储在本地存储中进行跳转
            localStorage.setItem("userId", userId);
            location.href = "${pageContext.request.contextPath}/updateUser.jsp";
        }

        function onDelete(id) {
            $.ajax({
                url: "${pageContext.request.contextPath}/delete/" + id,
                type: "delete",
                success: function (data) {
                    if (confirm("确认删除") && data.msg === "删除成功") {
                        location.href = "${pageContext.request.contextPath}/users/1";
                    }
                }
            });
        }
    </script>
</head>
<body>
<%--定义表格标识--%>
<div class="layui-container" style="width: 700px;height: 500px">
    <table id="tab" lay-filter="data"></table>
</div>
<script>
    //定义在当前标识
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: "#tab",
            url: "${pageContext.request.contextPath}/users",//用户数据接口
            //定义数据类型
            cols: [[
                {field: 'id', title: 'ID', sort: true, fixed: 'left'}
                , {field: 'username', title: '用户名',}
                , {field: 'gender', title: '性别', sort: true}
                , {field: 'registerTime', title: '生日',}
                , {field: "right", title: "操作", toolbar: '#barDemo'}
            ]],
            //显示工具栏
            toolbar:true,
            page: {
                limit: 2//每页显示1条
                , limits: [2, 2, 2] //可选每页条数
                , first: '首页' //首页显示文字，默认显示页号
                , last: '尾页'
                , prev: '<em>←</em>' //上一页显示内容，默认显示 > <
                , next: '<i class="layui-icon layui-icon-next"></i>'
                , layout: ['prev', 'page', 'next', 'count', 'limit', 'skip', 'refresh']
            },
        });

        //操作按钮回调
        table.on('tool(data)',function (obj) {
                //判断勾选框为up
                var data = obj.data;//获取当前一行数据
                var event = obj.event;//获取lay-event的值
                if (event === "up") {
                    layer.open({
                        type:1,
                        title:"修改页面",
                        content:layui.$("#update"),//dom类型展示
                        shade:0.6,
                    });
                }
            }
        );
    })
</script>
<!-- 隐藏方法标签 -->
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="up">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<!-- 隐藏修改表单,进行弹窗展示修改表单 -->
<div id="update" style="display:none;padding:10px; height: 300px; width: 600px;">
    <form class="layui-form" id="myfrom" enctype="application/x-www-form-urlencoded">
        <div class="layui-form-item">
            <label class="layui-form-label">用户</label>
            <div class="layui-input-block">
                <input type="text" style="width: 150px" name="title" required  lay-verify="required" placeholder="请输入用户" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="true" title="男">
                <input type="radio" name="sex" value="false" title="女">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">生日</label>
                <div class="layui-input-inline">
                    <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd">
                </div>
            </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
        </div>
    </form>
</div>
<%--<table class="table">
    <tr>
        <td><a href="${pageContext.request.contextPath}/insertUser.jsp">添加</a></td>
    </tr>
    <tr>
        <td>id</td>
        <td>username</td>
        <td>gender</td>
        <td>registerTime</td>
        <td colspan="2">操作</td>
    </tr>
    <c:forEach items="${requestScope.pageInfo.list}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.gender}</td>
            <td><fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-dd hh:ss:mm" /></td>
            <td><a href="javascript:void(0)" onclick="onUpdate('${user.id}')">修改</a></td>
            <td><a href="javascript:void(0)" onclick="onDelete('${user.id}')">删除</a></td>
        </tr>
    </c:forEach>
</table>
<!-- 分页工具栏 -->
<nav aria-label="Page navigation">
    <ul class="pagination">
        <c:if test="${pageInfo.hasPreviousPage}">
            <li>
                <a href="${pageContext.request.contextPath}/users/${pageInfo.prePage}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>
        <c:forEach begin="1" end="${pageInfo.pages}" var="i">
            <c:if test="${pageInfo.pageNum==i}">
                <li class="active"><a href="${pageContext.request.contextPath}/users/${i}">${i}</a></li>
            </c:if>
            <c:if test="${pageInfo.pageNum!=i}">
                <li><a href="${pageContext.request.contextPath}/users/${i}">${i}</a></li>
            </c:if>
        </c:forEach>
        <li>
            <a href="${pageContext.request.contextPath}/users/${pageInfo.nextPage}" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
--%>
</body>
</html>
