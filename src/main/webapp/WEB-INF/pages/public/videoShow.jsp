<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/28
  Time: 13:01
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
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"/>

    <!-- 引入各种CSS样式表 -->

    <link rel="stylesheet" href="<%=basePath%>statics/css/video.css">
    <link rel="stylesheet" href="<%=basePath%>statics/js/video.js">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>视频播放列表</title>

</head>
<body>
<div class="videoAll">
    <div id="videoHeader">
        <div id="myCarousel" class="carousel slide" style="interval:1000">

            <!-- 轮播（Carousel）项目 -->
            <div class="carousel-inner" id="carousel-inner">
                <div class="item active">
                    <img src="<%=basePath%>statics/img/4.jpg" alt="First slide" class="scollimg">
                    <div class="carousel-caption">最热视频1</div>
                </div>
                <div class="item">
                    <img src="<%=basePath%>statics/img/4.jpg" alt="Second slide" class="scollimg">
                    <div class="carousel-caption">最热视频2</div>
                </div>
                <div class="item">
                    <img src="<%=basePath%>statics/img/4.jpg" alt="Third slide" class="scollimg">
                    <div class="carousel-caption">最热视频3</div>
                </div>
                <div class="item">
                    <img src="<%=basePath%>statics/img/4.jpg" alt="Third slide" class="scollimg">
                    <div class="carousel-caption">最热视频4</div>
                </div>
            </div>
            <!-- 轮播（Carousel）导航 -->
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
            <!-- 轮播（Carousel）指标 -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
        </div>
    </div>
    <div id="videlList">

        <table id="vido">
            <tr>
                <td>
                    <div class="videoClass">
                        <div class="videpClassTitle">
                            <h3><span class="titleLeft">机器学习</span></h3>
                            <a href="#"><span class="titleRight">查看更多>></span></a>
                        </div>
                        <div class="vdoTab">
                            <table>
                                <tr>
                                    <td>
                                        <textarea class="realName" disabled>第一个视频</textarea>
                                        <a href="vdo/index.html" target="_blank"> <img src="img/1.jpg" alt="视频截图" class="vdoName"></a>
                                    </td>
                                    <td>
                                        <textarea class="realName" disabled>第二个视频</textarea>
                                        <img src="img/1.jpg" alt="视频截图" class="vdoName">
                                    </td>
                                    <td>
                                        <textarea class="realName" disabled>第三个视频</textarea>
                                        <img src="img/1.jpg" alt="视频截图" class="vdoName">
                                    </td>
                                    <td>
                                        <textarea class="realName" disabled>第四个视频</textarea>
                                        <img src="img/1.jpg" alt="视频截图" class="vdoName">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
<footer>
    <input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/>
</footer>
<iframe style="display:none" onload="javascript:flushVideoList('${pageContext.request.contextPath}/video/videoList.do')"/>
<script type="text/javascript">
    $(document).ready(function () {
        $('#myCarousel').carousel({
            interval: 5000
        }); //每隔5秒自动轮播
    });
</script>

</body>

</html>
