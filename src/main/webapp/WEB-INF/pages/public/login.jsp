<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link href="<%=basePath%>statics/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body background="<%=basePath%>statics/img/login_background.jpg" align="center" onload="scan()">

<!-- Login -->
<div class="clearfix" id="adminlogDiv">
    <h1 align="center"><span>管理员/用户登录</span></h1>
    <hr>
    <div>
        <h4><span color="#EBEBEB"><p align="center">欢迎来到E-learning大数据学习平台</p></span></h4>
    </div>

    <div class="box-login">
        <!-- adminLogin -->
        <form id="adminlog" role="form" class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-3 control-label"><span class="glyphicon glyphicon-user"></span>&nbsp帐号:</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="ID" name="ID" placeholder="请输入帐号">
                </div>
            </div>
            <div class="form-group">
                <label for="password" class="col-sm-3 control-label"><span class="glyphicon glyphicon-lock"></span>&nbsp密码:</label>
                <div class="col-sm-7">
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码">
                </div>
            </div>


            <div class="alert alert-warning alert-dismissable" id="alertinfo">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <font color="red"><span id="reconnmendInfo"></span></font>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <button type="submit" id="btn1" class="btn btn-default" onclick="admincheck('login/loginCheck.html');">
                        登录
                    </button>
                    <button type="reset" class="btn btn-default">重置</button>
                </div>
            </div>
            <div class="ahff">
                <a class="box-switcher" href="#" onclick="userr()">我是用户 </a>
            </div>
        </form>
    </div>
	<div id="res"></div>
</div>

<script language="javascript" type="text/javascript">

    function scan() {
        //  document.getElementById("userloginDiv").style.display = "";
        document.getElementById("adminlogDiv").style.display = "";
    }
    function admin() {
        document.getElementById("userloginDiv").style.display = "none";
        document.getElementById("adminlogDiv").style.display = "";
    }
    function user() {
        document.getElementById("userloginDiv").style.display = "";
        document.getElementById("adminlogDiv").style.display = "none";
    }
    function admincheck(url) {

        var ID = document.getElementById("ID").value;
        var password = document.getElementById("password").value;

        if (ID == "" || password == "") {
            alert("账户或者密码不能为空!");
            return;
        } else {

            reUrl = "${pageContext.request.contextPath}/" + url;
            var xmlhttp;
            if (window.XMLHttpRequest) {
                //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp = new XMLHttpRequest();
            }
            else {
                // IE6, IE5 浏览器执行代码
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    var res = xmlhttp.responseText.toString();
                    switch (res) {
                        case "error": {
                            document.getElementById("alertinfo").style.display = "";
                            var info = document.getElementById("reconnmendInfo");
                            info.innerText = "密码错误";
                            break;
                        }
                        case "noexist": {
                            document.getElementById("alertinfo").style.display = "";
                            var info = document.getElementById("reconnmendInfo");
                            info.innerText = "帐号不存在";
                            break;
                        }
                        case "admin": {
                            window.location.href = '${ctx}/login/adminIndex.html';
                            break;
                        }
                        case "student": {
                            window.location.href = '/student/studentindex.html';
                            break;
                        }
                        case "teacher": {
                            window.location.href = '/teacher/teachetindex.html';
                            break;
                        }
                        default: {
                            alert("返回数据出错!");
                        }
                    }
                }
            }
            xmlhttp.open("POST", reUrl, true);
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlhttp.send("ID=" + ID + "&" + "password=" + password);
        }
    }
</script>
</body>
</html>
