<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- meta http-equiv="Content-Type" content="text/html; charset=utf-8" -->
    <title>查看页面</title>
    <base href="${ctx}">
</head>
<body>
<table>
    <tr>
        <th>student用户名</th>
        <th>student密码</th>
        <th>student姓名</th>
        <th>student头像</th>
        <th>student偏好</th>
    </tr>
    <c:forEach items="${studentList}" var="student">
        <tr>
            <td>${student.ID}</td>
            <td>${student.password}</td>
            <td>${student.name}</td>
            <td>${student.image}</td>
            <td>${student.preferences}</td>
            <td><a href="${ctx}/student/addLoad">添加</a></td>
            <td><a href="${ctx}/student/editLoad?ID=${student.ID}">更改</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>