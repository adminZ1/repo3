<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <li id="active"><a href="billList.html">账单管理</a></li>
                <li><a href="providerList.html">供应商管理</a></li>
                <li><a href="userList.html">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.html">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>账单管理页面</span>
        </div>
        <div class="search">
            <span>商品名称：</span>
            <input type="text" class="productName" placeholder="请输入商品的名称"/>

            <span>供应商：</span>
            <select name="tigong" class="tigong">
                <option value="">--请选择--</option>
                <c:forEach items="${provider}" var="n">
                    <option value="${n.proName}">${n.proName}</option>
                </c:forEach>
            </select>

            <span>是否付款：</span>
            <select name="fukuan" class="fukuan">
                <option value="">--请选择--</option>
                <option value="2">已付款</option>
                <option value="1">未付款</option>
            </select>

            <input type="button" class="but" value="查询"/>
            <a href="billAdd.html">添加订单</a>
        </div>
        <!--账单表格 样式和供应商公用-->
        <table class="providerTable" cellpadding="0" cellspacing="0">
            <tr class="firstTr">
                <th width="10%">账单编码</th>
                <th width="20%">商品名称</th>
                <th width="10%">供应商</th>
                <th width="10%">账单金额</th>
                <th width="10%">是否付款</th>
                <th width="10%">创建时间</th>
                <th width="30%">操作</th>
            </tr>
            <c:forEach items="${info.list}" var="b">
                <tr>
                    <td>${b.billCode}</td>
                    <td>${b.productName}</td>
                    <td>${b.provider.proName}</td>
                    <td>${b.productCount}</td>
                    <td>${b.isPayment==1?"未支付":"已支付"}</td>
                    <td><fmt:formatDate value="${b.creationDate}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <a href="billView?billCode=${b.billCode}"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="billUpdate?billCode=${b.billCode}"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="#" class="removeBill"><img src="img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <a href="${pageContext.request.contextPath}/billList?pageNum=${info.prePage}&pageSize=${info.pageSize}"
                       aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach items="${info.navigatepageNums}" var="n">
                    <li>
                        <a href="${pageContext.request.contextPath}/billList?pageNum=${n}&pageSize=${info.pageSize}">${n}</a>
                    </li>
                </c:forEach>
                <li>
                    <a href="${pageContext.request.contextPath}/billList?pageNum=${info.nextPage}&pageSize=${info.pageSize}"
                       aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
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
    $(function () {
        $(".but").click(function () {
            var productName = $(".productName").val();
            var tigong = $(".tigong").val();
            var fukuan = $(".fukuan").val();
            location.href="billCondiTion?productName="+productName+"&provider.proName="+tigong+"&isPayment="+fukuan;
        })
    })
</script>

</body>
</html>