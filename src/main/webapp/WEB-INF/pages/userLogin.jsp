<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户登录</title>
    <link href="css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body id="" background="img/login_background.jpg" align="center" onload="begin()">

<!-- Login -->
<div id="userloginDiv" class="clearfix">
    <h1 align="center"><span>用户登录</span></h1>
    <hr>
    <div>
        <h4><span color="#EBEBEB"><p align="center">欢迎来到E-learning大数据学习平台</p></span><h4>
    </div>
    <div class="box-login">
        <form id="adminlog" role="form" class="form-horizontal">
            <div class="form-group">
                <label  class="col-sm-2 control-label">帐号:</label>
                <div class="col-sm-8">
                    <input type="text" class="form-control" id="username" name="username" placeholder="请输入帐号">
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">密码:</label>
                <div class="col-sm-8">
                    <input type="password" class="form-control" id="userpassword" name="userpassword" placeholder="请输入密码">
                </div>
            </div>

            <c:if test="${!empty error}">
                <div class="alert alert-warning alert-dismissable" id="alertinfo">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <font color="red"><c:out value="${error}" /></font>
                </div>
            </c:if>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-8">
                    <button type="submit" id="btn" class="btn btn-default" onclick="check();">登录</button>
                    <button type="reset"  class="btn btn-default">重置</button>
                </div>
            </div>

        </form>
    </div>
</div>
<script language="javascript" type="text/javascript">
    function check(){

        var psdo=document.getElementById("passwordone").value;
        var psdt=document.getElementById("passwordtwo").value;

        if(psdo == psdt){
            alert("注册成功!");
            box-register.submit();

        }else{
            alert("密码不一致!");
            box-register.reset();
        }
    }
</script>
</body>
</html>
