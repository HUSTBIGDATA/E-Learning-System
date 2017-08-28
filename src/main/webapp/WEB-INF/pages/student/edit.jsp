<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- meta http-equiv="Content-Type" content="text/html; charset=utf-8" -->
<title>查看页面</title>
<base href="${ctx}">
</head>
<body>

<sf:form method="post" modelAttribute="student" action="${ctx}/student/edit">
	<table>
		<tr>
			<td>ID:</td><td><sf:input path="ID"/></td>
		</tr>
		<tr>
			<td>Password:</td><td><sf:input path="password"/></td>
		</tr>
		<tr>
			<td>Name:</td><td><sf:input path="name"/></td>
		</tr>
		<tr>
			<td>Image:</td><td><sf:input path="image"/></td>
		</tr>
		<tr>
			<td>Preferences:</td><td><sf:input path="preferences"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="更改学生信息"/></td>
		</tr>
	</table>  
</sf:form>
</body>
</html>