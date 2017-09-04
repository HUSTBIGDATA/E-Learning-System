
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

    <link rel="stylesheet" href="<%=basePath%>statics/css/teacher.css">
    <script type="text/javascript" src="<%=basePath%>statics/js/teacher.js"></script>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>查看课程</title>
</head>

<body>

<h2><span id="htmTitle">我的授课课程</span></h2><br>

<div class="container">
    <div class="waterfall">

        <!--<div class="item">
            <h4>课程编号1101&nbsp;&nbsp;这是课程名</h4>
            <hr>
            <div>
                <span>教师:胡俊辉<br></span>
                <span style="float:left;">课程信息：</span><br>
                <div class="courceinfo">

                </div>
               <span style="float:left;">教学计划：</span><br>
                <div class="courseplan">

                </div>

            </div>
        </div>

        <div class="item">

            <p>第二门课</p>
        </div>
        <div class="item">

            <p>第二门课</p>
        </div>-->

    </div>
</div>


<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}">
<iframe style="display:none" onload="javascript:onloadTeacherCourse('${pageContext.request.contextPath}/teacher/teacherCourse.do')" />
</body>

</html>
