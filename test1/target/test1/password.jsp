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
                <li><a href="billList.html">账单管理</a></li>
                <li><a href="providerList.html">供应商管理</a></li>
                <li><a href="userList.html">用户管理</a></li>
                <li id="active"><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>密码修改页面</span>
        </div>
        <div class="providerAdd">
            <form action="getUpdPassword" method="post">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <input type="text" name="userCode" id="code" value="${user.userCode}" style="display: none"/>
                <div class="" id="isRight">
                    <label for="oldPassword">旧密码：</label>
                    <input type="password" name="oldPassword" oninput="input()"  id="oldPassword" required/>
                    <span>*请输入原密码</span>
                </div>
                <div>
                    <label for="newPassword">新密码：</label>
                    <input type="password" name="newUserPassword" id="newPassword" required/>
                    <span>*请输入新密码</span>
                </div>
                <div>
                    <label for="reNewPassword">确认新密码：</label>
                    <input type="password" name="userPassword" id="reNewPassword" required/>
                    <span>*请输入新确认密码，保证和新密码一致</span>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <input type="button" class="button" value="保存" />
                </div>
            </form>
        </div>
    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="${pageContext.request.contextPath}/js/time.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script>
    var ajaxboll = false;
    $(function () {
        $(".button").click(function () {
            var newPassword=$("#newPassword").val();
            var reNewPassword=$("#reNewPassword").val();
            if(newPassword!=reNewPassword){
                    alert("密码不一致");
                    return false;
            }
            if(newPassword==""||reNewPassword==""){
                alert("密码不能为空");
                return false;
            }
            if(ajaxboll){
                $("form").submit();
            }
        })
    })


    function input() {
        var code = $("#code").val();
        var pwd=$("#oldPassword").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/getPwdContrast",
            data: {"userCode":code,"userPassword":pwd},
            type: "post",
            dataType: "text",
            success: function (data) {
                if (data > 0) {
                    $("#isRight").removeClass("error").addClass("ok");
                    ajaxboll = true;
                } else {
                    if (pwd != "") {
                        $("#isRight").removeClass("ok").addClass("error");
                        ajaxboll = false;
                    } else {
                        $("#isRight").removeClass("ok").addClass("error");
                        ajaxboll = false;
                    }
                }
            }
        })
    }
</script>
</body>
</html>