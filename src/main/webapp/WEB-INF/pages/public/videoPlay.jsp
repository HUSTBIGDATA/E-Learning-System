<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/28
  Time: 13:02
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

    <link rel="stylesheet" href="<%=basePath%>statics/css/reset.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/willesPlay.css">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script src="<%=basePath%>statics/js/willesPlay.js" type="text/javascript" charset="utf-8"></script>

    <title>视频播放页面</title>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="willesPlay">
                <div class="playHeader" background="<%=basePath%>statics/img/playheader.jpg repeat-x">
                    <div class="videoName">视频名字</div>
                </div>
                <div class="playContent">
                    <div class="turnoff">
                        <ul>
                            <li><a href="#" title="喜欢" class="glyphicon glyphicon-heart-empty"></a></li>
                            <li><a href="#" title="关灯" class="btnLight on glyphicon glyphicon-sunglasses"></a></li>
                            <li><a href="#" title="分享" class="glyphicon glyphicon-share"></a></li>
                        </ul>
                    </div>

                    <video width="100%" height="100%" id="playVideo">
                        <source src="<%=basePath%>statics/video/movie.mp4" type="video/mp4">
                    </video>

                    <div class="playTip glyphicon glyphicon-play"></div>
                </div>
                <div class="playControll">
                    <div class="playPause playIcon"></div>
                    <div class="timebar">
                        <span class="currentTime">0:00:00</span>
                        <div class="progress">
                            <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar"
                                 aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                        </div>
                        <span class="duration">0:00:00</span>
                    </div>
                    <div class="otherControl">
                        <span class="volume glyphicon glyphicon-volume-down"></span>
                        <span class="fullScreen glyphicon glyphicon-fullscreen"></span>
                        <div class="volumeBar">
                            <div class="volumewrap">
                                <div class="progress">
                                    <div class="progress-bar progress-bar" role="progressbar" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 8px;height: 40%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
