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
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="<%=basePath%>/statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>/statics/css/admin.css">
    <link rel="stylesheet" href="<%=basePath%>/statics/css/font-awesome.css">
    <script src="<%=basePath%>statics/js/admin.js"></script>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>个人信息</title>
</head>

<body>
<div class="all">

    <div id="dataimportDiv">
        <form class="form-inline" role="form" id="uploadForm" method="post" enctype="multipart/form-data">
                <label class="sr-only" for="inputfile">文件输入</label>
                <input type="file" id="inputfile" name="inputfile" accept=".xls,.xlsx">
            <button type="button" class="btn btn-default" onclick="importStudentList('${ctx}/manager/uploadStudentList.do')">提交</button>
        </form>
    </div>
</div>
</body>
</html>