<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b">${user.userName}</span> , 欢迎你！</p>
        <a href="login.html">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11  星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian ">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="billUpdate.jsp">账单管理</a></li>
                <li><a href="${pageContext.request.contextPath}/getProviderByPage">供应商管理</a></li>
                <li><a href="${pageContext.request.contextPath}/getUserByPage">用户管理</a></li>
                <li><a href="password.jsp">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面</span>
        </div>
        <div class="search">
            <span>用户名：</span>
                <input type="text" name="userName" class="userName" placeholder="请输入用户名"/>
                <input type="button" class="button" value="查询"/>
            <a href="userAdd.jsp">添加用户</a>
        </div>
        <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户编码</th>
                    <th width="20%">用户名称</th>
                    <th width="10%">性别</th>
                    <th width="10%">年龄</th>
                    <th width="10%">电话</th>
                    <th width="10%">用户类型</th>
                    <th width="30%">操作</th>
                </tr>
                <c:forEach items="${info.list}" var="u">
                <tr>
                    <td>${u.userCode}</td>
                    <td>${u.userName}</td>
                    <td>${u.gender==2?"女":"男"}</td>
                    <td>${u.age}</td>
                    <td>${u.phone}</td>
                    <td>${u.roleName}</td>
                    <td>
                        <a href="AssiAssignName?userName=${u.userName}"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="userUpdate?userName=${u.userCode}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="${pageContext.request.contextPath}/getDelUser/${u.userCode}" class="removeUser"><img src="img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
                </c:forEach>
            </table>

        <%--分页的控件--%>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="${pageContext.request.contextPath}/getUserByPage?pageNum=${info.prePage}&pageSize=${info.pageSize}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach items="${info.navigatepageNums}" var="n">
                    <li><a href="${pageContext.request.contextPath}/getUserByPage?pageNum=${n}&pageSize=${info.pageSize}">${n}</a></li>
                </c:forEach>
                <li>
                    <a href="${pageContext.request.contextPath}/getUserByPage?pageNum=${info.nextPage}&pageSize=${info.pageSize}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>

    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

<footer class="footer">
    版权归北大青鸟
</footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>
<script>
    $(function(){
        $(".button").click(function(){
            var username=$(".userName").val();
            location.href="userName?userName="+username;
        })

        $(".removeUser").click(function () {
            $("#yes").attr("href",$(this).attr("href"));
            return false;
        })
    })
</script>
</body>
</html>