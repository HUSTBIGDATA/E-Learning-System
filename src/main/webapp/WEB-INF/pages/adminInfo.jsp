<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/18
  Time: 22:17
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="Author" content="Dreamer-1.">

    <!-- 引入各种CSS样式表 -->

    <link rel="stylesheet" href="<%=basePath%>statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/admin.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/font-awesome.css">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>个人信息</title>
</head>

<body onload="see()">
<div id="adminINFO">
    <div id="adminImg">

        <div id="adminImgCon">
            <img id="photo" src="/img/login_background.jpg" />
            <div>
                <button type="button" onclick="updateImg()" style="width:160px">点击更换照片</button>
            </div>
        </div>
        <div id="inputImgDiv">
            <form id="changeImg" class="form-inline" role="form" action="#" method="post">
                <div class="form-group">
                    <label class="sr-only" for="inputfile">文件输入</label>
                    <input type="file" id="inputfile" accept="image/*">
                </div>
                <button onclick="submitImg()" class="btn btn-default btn-sm">提交</button>
            </form>
        </div>
    </div>
    <div id="infomation">
        <div id="tabDiv">
            <table class="table table-striped table-bordered">
                <caption>您的个人信息</caption>

                <tr>
                    <td>姓名</td>
                    <td><span>胡俊辉</span></td>
                </tr>
                <tr>
                    <td>邮箱</td>
                    <td>134234@fausdfhu.com</td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td>
                        <button type="button" class="btn btn-default btn-sm">点击修改密码</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script language="javascript" type="text/javascript">
    function updateImg() {
        document.getElementById("inputImgDiv").style.display = "";
    }

    function see() {
        document.getElementById("inputImgDiv").style.display = "none";
    }

    function submitImg() {
        //这里更换页面照片  并且该照片提交给服务器
        document.getElementById("changeImg").submit();
        document.getElementById("inputImgDiv").style.display = "none";

    }
</script>
</body>
</html>

