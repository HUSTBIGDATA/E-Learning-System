<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/29
  Time: 13:15
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
<c:set var="ID" value="${adminID}"></c:set>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入各种CSS样式表 -->

    <link rel="stylesheet" href="<%=basePath%>statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css//admin2Course.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/font-awesome.css">

    <script src="<%=basePath%>statics/js/amdin2Course.js"></script>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>查看课程</title>
</head>

<body >
<div class="all" id="dataScan">
    <h2>学习资料</h2><br><br>
    <div id="dataTable">
        <div id="tabHead">
            <div id="tableHeadLeft">

                <div class="form-inline" role="form">
                    <div class="form-group">
                        <input type="text" class="form-control" id="CourseNameFind" placeholder="请输入课程名">
                    </div>
                    <button type="button" onclick="dataFindByName('${pageContext.request.contextPath}/course/findByName.do')" class="btn btn-default">按课程名查询
                    </button>
                </div>

            </div>
            <div id="tableHeadRight">
                <button type="button" class="btn btn-default" onclick="deleteCourseSeleted('${pageContext.request.contextPath}')">删除所选
                </button>
                <button type="button" class="btn btn-default" onclick="flushCourseList('${pageContext.request.contextPath}')">刷新
                </button>

                <button type="button" class="btn btn-default" onclick="addNewCourse()">添加新课程
                </button>

            </div>
        </div>
        <div id="newCourse">
            <div class="form-inline" role="form">
                <!--div class="form-group">
                    <label>课程ID:</label>
                    <input type="text" class="form-control" id="courseID" placeholder="请输入课程ID">
                </div-->
                <div class="form-group">
                    <label>课程名称:</label>
                    <input type="text" class="form-control" id="courseName" placeholder="请输入课程名称">
                </div>
                <div class="form-group">
                    <label >教师ID:</label>
                    <input type="text" class="form-control" id="teacherID" placeholder="请输入教师ID">
                </div></div>

            <div>
                <div id="courseinfo">
                    <label>课程信息:</label>
                    <textarea id="cosinfo">

                       </textarea>
                </div>
                <div id="courseplan">
                    <label>教学计划:</label>
                    <textarea id="cosplan">

                       </textarea>
                </div>
            </div>

                <button type="button" class="btn btn-default" onclick="add('${pageContext.request.contextPath}/course/add.do')">增加课程</button>


        </div>
        <div id="tableBody">
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <td style="width:8%">
                    <td style="width:5%">序号</td>
                    <td style="width:17%">课程ID</td>
                    <td style="width:30%">课程名</td>
                    <td style="width:40%">课程教师</td>
                </tr>
                </thead>
                <tbody id="tablecontent">
                <tr name="Oneofstd">
                   
                </tr>

                </tbody>
            </table>
        </div>

    </div>
</div>
<iframe style="display:none" onload="javascript:flushCourseList('${pageContext.request.contextPath}')"/>
</body>
</html>
