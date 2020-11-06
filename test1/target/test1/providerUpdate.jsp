<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>超市账单管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>超市账单管理系统</h1>

    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b"> ${user.userName}</span> , 欢迎你！</p>
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
                <li id="active"><a href="providerList.html">供应商管理</a></li>
                <li><a href="userList.html">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>供应商管理页面 >> 供应商修改页</span>
        </div>
        <div class="providerAdd">
            <form action="${pageContext.request.contextPath}/getUpdProvider" method="post">
                <input type="hidden" name="id" value="${provider.id}">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="" id="isRight">
                    <label for="proCode">供应商编码：</label>
                    <input type="text" name="proCode" id="proCode" value="${provider.proCode}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="proName">供应商名称：</label>
                    <input type="text" name="proName" id="proName" placeholder="${provider.proName}"
                           value="${provider.proName}"/>
                    <span>*</span>
                </div>
                <div>
                    <label for="proContact">联系人：</label>
                    <input type="text" name="proContact" id="proContact" placeholder="${provider.proContact}"
                           value="${provider.proContact}"/>
                    <span>*</span>

                </div>
                <div>
                    <label for="proPhone">联系电话：</label>
                    <input type="text" name="proPhone" id="proPhone" placeholder="${provider.proPhone}"
                           value="${provider.proPhone}"/>
                    <span></span>
                </div>
                <div>
                    <label for="proAddress">联系地址：</label>
                    <input type="text" name="proAddress" id="proAddress" placeholder="${provider.proAddress}"
                           value="${provider.proAddress}"/>
                    <span></span>

                </div>
                <div>
                    <label for="proFax">传真：</label>
                    <input type="text" name="proFax" id="proFax" placeholder="${provider.proFax}"
                           value="${provider.proFax}"/>
                    <span></span>

                </div>
                <div>
                    <label for="proDesc">描述：</label>
                    <input type="text" name="proDesc" id="proDesc" placeholder="${provider.proDesc}"
                           value="${provider.proDesc}"/>
                    <span></span>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="providerList.html">返回</a>-->
                    <input type="submit" class="button" value="保存"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
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
    $(function () {
        $(".button").click(function () {
            var proCode = $("#proCode").val();// 供应商编码：
            var proName = $("#proName").val();//   供应商名称：
            var people = $("#people").val();//   联系人：
            var proContact = $("#proContact").val();// 联系电话：
            var address = $("#address").val();//  联系地址：
            var proFax = $("#proFax").val();//  传真：
            var proDesc = $("#proDesc").val();//描述：
            if (proCode == "" || proName == "" || people == "" || proContact == "") {
                alert("前填写完整");
                return false;
            } else {
                alert(1);
                $("form").submit();
            }
        })
    })
</script>
</body>
</html>