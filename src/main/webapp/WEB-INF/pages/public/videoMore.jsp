<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入各种CSS样式表 -->
<!--    <link rel="stylesheet" href="css/video.css">-->
     <link rel="stylesheet" href="<%=basePath%>statics/css/videomore.css">
    
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>all视频</title>
   
</head>

<body>

    <h3 style="margin-left: 30px;"><span id="videoClassName">机器学习
					       <c:if test="${!empty videoClassName}">
                               <font color="blue"><c:out value="${videoClassName}"/></font>
                           </c:if>
                    </span></h3>
    <div class="parent" id="parent">
        <div class="child">
            <textarea class="realName" disabled>第一个视频</textarea>
            <a href="vdo/index.html" target="_blank"> <img src="img/1.jpg" alt="视频截图" class="vdoName"></a>   
        </div>
         <div class="child">
            <textarea class="realName" disabled>第一个视频</textarea>
            <a href="vdo/index.html" target="_blank"> <img src="img/1.jpg" alt="视频截图" class="vdoName"></a>   
        </div>
          <div class="child">
            <textarea class="realName" disabled>第一个视频</textarea>
            <a href="vdo/index.html" target="_blank"> <img src="img/1.jpg" alt="视频截图" class="vdoName"></a>   
        </div>
          <div class="child">
            <textarea class="realName" disabled>第一个视频</textarea>
            <a href="vdo/index.html" target="_blank"> <img src="img/1.jpg" alt="视频截图" class="vdoName"></a>   
        </div>
      
    </div>
    <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/>
    <iframe style="display:none" onload="javascript:flushListByClassName('${pageContext.request.contextPath}/video/flushListByClassName.do')"/>
</body>
</html>
