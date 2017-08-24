<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/24
  Time: 9:24
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
    <link rel="stylesheet" href="<%=basePath%>statics/css/font-awesome.css">

    <script src="<%=basePath%>statics/js/admin2Teacher.js"></script>
    <link rel="stylesheet" href="<%=basePath%>statics/css/admin2Teacher.css">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>教师名单管理</title>

</head>

<body onload="flushStdList()">
<div class="all" id="TeacherScan">
    <h2>教师名单</h2><br>
    <div id="teachTable">
        <div id="teacherHead">
            <div id="teachertableHeadLeft">

                <div class="form-inline" role="form">
                    <div class="form-group">
                        <input type="text" class="form-control" id="teachername" placeholder="请输入教师姓名">
                    </div>
                    <button type="button"
                            onclick="teacherfindByname('${pageContext.request.contextPath}/teacher/findByName.do')"
                            class="btn btn-default">查询
                    </button>
                </div>

            </div>
            <div id="teachertableHeadRight">
                <button type="button" class="btn btn-default"
                        onclick="teacherflushStdList('${pageContext.request.contextPath}/teacher/teacherList.do')">刷新
                </button>
                <button type="button" class="btn btn-default"
                        onclick="deleteTeacherlist('${pageContext.request.contextPath}/teacher/deleteTeacher.do')">删除所选
                </button>
            </div>
        </div>
        <div id="teachertableBody">
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <td style="width:8%">
                        <input type="checkbox" id="teacherControllall" onclick="teacherallselect()">&nbsp;&nbsp;全选
                    </td>
                    <td style="width:5%">序号</td>
                    <td style="width:17%">教师姓名</td>
                    <td style="width:30%">ID</td>
                </tr>
                </thead>
                <tbody id="teachertablecontent">
                <!--  <tr name="Oneofstd">
                      <td><input type="checkbox" class="studentlist"></td>
                      <td>1</td>
                      <td>Tanmay</td>
                      <td class="ID">Bangalore</td>
                      <td>560001</td>
                  </tr>
                  <tr name="Oneofstd">
                      <td><input type="checkbox" class="studentlist"></td>
                      <td>2</td>
                      <td>Sachin</td>
                      <td class="ID">Mumbai</td>
                      <td>400003</td>
                  </tr>-->


                </tbody>
            </table>
        </div>

    </div>
</div>
</body>
</html>
