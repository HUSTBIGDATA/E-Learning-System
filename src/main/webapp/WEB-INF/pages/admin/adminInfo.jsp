<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/23
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入各种CSS样式表 -->

    <link rel="stylesheet" href="<%=basePath%>statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/admin.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/font-awesome.css">

    <script src="<%=basePath%>statics/js/admin.js"></script>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>管理员个人信息管理</title>
</head>

<body>
<div id="adminINFO">
    <div id="adminImg">

        <div id="adminImgCon">
            <img id="photo" src="${adminImg}" alt="这是管理员头像"/>
            <div>
                <button type="button" onclick="updateImg()" style="width:160px">点击更换照片</button>
            </div>
        </div>
        <div id="inputImgDiv"  style="display:none">
            <div class="form-inline" role="form">
                <div class="form-group">
                    <label class="sr-only" for="inputfile">文件输入</label>
                    <input type="file" id="inputfile" accept="image/*">
                </div>
                <button type="button"
                        onclick="submitImg('${adminID}','${pageContext.request.contextPath}/admin/adminInfo.do')"
                        class="btn btn-default btn-sm">提交
                </button>
            </div>
        </div>
    </div>
    <div id="infomation">
        <div id="tabDiv">
            <table class="table table-striped table-bordered">
                <caption>您的个人信息</caption>
                <tr>
                    <td>姓名</td>
                    <td><span id="name">${adminName}</span></td>
                </tr>
                <tr>
                    <td>ID</td>
                    <td><span id="ID">${adminID}</span></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td>
                        <button onclick="changePwd()" type="button" class="btn btn-default btn-sm">点击修改密码</button>
                    </td>
                </tr>
            </table>
            <div id="changePwdDiv" style="display:none">

                <div role="form" id="changePwdForm" name="changePwdForm" class="form-horizontal" action="changePwd"
                     method="post">
                    <div class="input-group">
                        <span class="input-group-addon">原始密码</span>
                        <input id="oldPwd" name="oldPwd" type="text" class="form-control" placeholder="原始密码">
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon">修改密码</span>
                        <input id="newPwd" name="newPwd" type="password" class="form-control" placeholder="修改后的密码">

                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon">确认密码</span>
                        <input id="newPwdSure" name="newPwdSure" type="password" class="form-control"
                               placeholder="再一次输入修改后的密码">
                    </div>

                    <div class="input-group col-sm-offset-2 col-sm-8" id="btnGroup">
                        <button onclick="SubmitchangePwd('${adminID}','${pageContext.request.contextPath}/manager/modifyPassword.do')"
                                class="btn btn-default">修改
                        </button>
                        <button type="reset" class="btn btn-default" id="retBtn">重置</button>

                    </div>


                </div>

            </div>
        </div>
    </div>
</div>
</body>
</html>