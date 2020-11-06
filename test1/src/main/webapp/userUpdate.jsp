<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <li><a href="billList.html">账单管理</a></li>
                <li><a href="providerList.html">供应商管理</a></li>
                <li id="active"><a href="userList.html">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="#">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="userName">用户名称：</label>
                    <input type="text" name="userName" id="userName" value="${user.userName}"
                           placeholder="${user.userName}"/>
                    <span>*</span>
                </div>

                <div>
                    <label>用户性别：</label>
                    <select name="gender" id="gender">
                         <option value="1">男</option>
                         <option value="2" selected>女</option>
                    </select>
                </div>
                <div>
                    <label for="birthday">出生日期：</label>
                    <input type="text" name="birthday" id="birthday"
                           value="<fmt:formatDate pattern="yyyy-MM-dd" value="${user.birthday}"/>"
                    />
                    <span>*</span>
                </div>
                <div>
                    <label for="phone">用户电话：</label>
                    <input type="text" name="phone" id="phone" value="${user.phone}" placeholder="${user.phone}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="Address">用户地址：</label>
                    <input type="text" name="Address" id="Address" value="${user.address}"
                           placeholder="${user.address}"/>
                </div>
                <div>
                    <label>用户类别：</label>
                    <input type="radio" name="userlei" value="1"/>管理员
                    <input type="radio" name="userlei" checked value="2"/>经理
                    <input type="radio" name="userlei" value="3"/>普通用户
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="userList.html">返回</a>-->
                    <input type="button" class="button" value="保存" <%--onclick="history.back(-1)"--%>/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>

    </div>
    <input  name="userCode" type="text" id="userCode" value="${user.userCode}">

</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>
<script src="js/jquery.js"></script>
<script>
    $(function () {
        $(".button").click(function () {
            var userName = $("#userName").val();
            var gender = $("#gender").val();
            var birthday = $("#birthday").val();
            var phone = $("#phone").val();
            var address = $("#Address").val();
            var userlei = $("input[name='userlei']").val();
            var userCode = $("#userCode").val();
          /*  alert(userName+"---"+gender+"---"+birthday+"----"+phone+"---"+address+"---"+userlei+"--"+userCode);*/
            location.href = "getUpdUser?userName=" + userName + "&gender=" + gender + "&birthday=" + birthday + "&phone=" + phone + "&address=" + address
                + "&userRole=" + userlei + "&userCode=" + userCode
        })
    })
</script>
</body>
</html>