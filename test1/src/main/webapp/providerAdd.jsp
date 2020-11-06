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
            <span>供应商管理页面 >> 供应商添加页面</span>
        </div>
        <div class="providerAdd">
            <form action="getAddProvider" method="post">
                <input type="hidden" name="createdBy" value="${user.id}">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div class="" id="isRight">
                    <label for="providerId">供应商编码：</label>
                    <input type="text" name="proCode" oninput="input()" id="providerId"/>
                    <span>*请输入供应商编码</span>
                </div>
                <div>
                    <label for="providerName">供应商名称：</label>
                    <input type="text" name="proName" id="providerName"/>
                    <span>*请输入供应商名称</span>
                </div>
                <div>
                    <label for="people">联系人：</label>
                    <input type="text" name="proContact" id="people"/>
                    <span>*请输入联系人</span>

                </div>
                <div>
                    <label for="phone">联系电话：</label>
                    <input type="text" name="proPhone" id="phone"/>
                    <span>*请输入联系电话</span>
                </div>
                <div>
                    <label for="address">联系地址：</label>
                    <input type="text" name="proAddress" id="address"/>
                    <span></span>
                </div>
                <div>
                    <label for="fax">传真：</label>
                    <input type="text" name="proFax" id="fax"/>
                    <span></span>
                </div>
                <div>
                    <label for="describe">描述：</label>
                    <input type="text" name="proDesc" id="describe"/>
                </div>
                <div class="providerAddBtn">
                    <!--<a href="#">保存</a>-->
                    <!--<a href="providerList.html">返回</a>-->
                    <input type="button" class="but" value="保存"/>
                    <input type="button" value="返回" onclick="history.back(-1)"/>
                </div>
            </form>
        </div>
    </div>
</section>
<footer class="footer">
    版权归北大青鸟
</footer>
<script src="js/time.js"></script>
<script src="js/jquery.js"></script>
<script>
    var ajaxboll = false;
    var butBool = false;
    $(function () {
        $(".but").click(function () {
            var providerId = $("#providerId").val();// 供应商编码：
            var providerName = $("#providerName").val();//   供应商名称：
            var people = $("#people").val();//   联系人：
            var phone = $("#phone").val();// 联系电话：
            var address = $("#address").val();//  联系地址：
            var fax = $("#fax").val();//  传真：
            var describe = $("#describe").val();//描述：
            if (providerName == "" || people == "" || phone == "") {
                alert("请检查是否将带”*“符号填写完");
                butBool == false;
                return false;
            }
            if (ajaxboll == false) {
                alert("请确认供应商编码");
                return false;
            }
            $("form").submit();
        })
    })

    function input() {
        var proCode = $("#providerId").val();
        $.ajax({
            url: "getAddPro",
            data: "proCode=" + proCode,
            type: "get",
            dataType: "text",
            success: function (data) {
                if (data > 0) {
                    $("#isRight").removeClass("ok").addClass("error");
                    ajaxboll = false;
                    return false;
                } else {
                    if (proCode != "") {
                        $("#isRight").removeClass("error").addClass("ok");
                        ajaxboll = true;
                        return true;
                    } else {
                        $("#isRight").removeClass("ok").addClass("error");
                        ajaxboll = false;
                        return false;
                    }
                }
            }
        })
    }
</script>
</body>
</html>