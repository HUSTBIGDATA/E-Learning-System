<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/7/21
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看页面</title>
    <link rel="stylesheet" href="statics/css/style1.css" type="text/css"/>
</head>
<body>
<table>
    <tr>
        <th>admin用户名</th>
        <th>admin密码</th>
    </tr>
    <%--<c:forEach items="${adminList}" var= "admin"/>--%>
    <tr>
        <td>${adminList.adminName}</td>
        <td>${adminList.adminPassword}</td>
    </tr>
</table>
 终于顺利运行了
<img src="statics/images/ttt.jpg" width="400" height="400"/>

</body>
</html>