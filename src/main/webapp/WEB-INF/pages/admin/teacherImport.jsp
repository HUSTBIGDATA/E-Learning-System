<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/24
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/18
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入各种CSS样式表 -->
    <script src="<%=basePath%>statics/js/admin2Teacher.js"></script>
    <link rel="stylesheet" href="<%=basePath%>statics/css/admin2Teacher.css">

    <link rel="stylesheet" href="<%=basePath%>/statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>/statics/css/font-awesome.css">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>导入教师名单</title>
</head>

<body>
<div class="all">

    <div id="teacherImportDiv">
        <div class="form-inline" role="form" id="teacherformDIv" method="post" enctype="multipart/form-data"
             action="${ctx}/upload/uploadteacherFile.do">

            <div class="form-group">
                <label class="sr-only" for="inputfile">教师名单文件</label>
                <input type="file" id="inputfile" name="inputfile" accept=".xls,.xlsx">
            </div>
            <button type="button"
                    onclick="imoortTeacherList('${pageContext.request.contextPath}/teacher/teacherImportList.do')"
                    class="btn btn-default">提交
            </button>
        </div>
        <div class="progress progress-striped active">
            <div class="progress-bar progress-bar-success" role="progressbar"
                 aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
                 id="uploadscoll">
            </div>
        </div>
    </div>
</div>
</body>
</html>