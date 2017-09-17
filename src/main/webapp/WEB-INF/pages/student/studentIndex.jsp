<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/27
  Time: 19:31
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
<c:set var="ID" value="${studentID}"></c:set>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入各种CSS样式表 -->
	
	<script src="<%=basePath%>statics/js/student.js"></script>
	
    <link rel="stylesheet" href="<%=basePath%>statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/student.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/font-awesome.css">

    <!--script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"-->


    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <title>大数据学习平台</title>
</head>
<body>

<div class="all">
    <!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
    <div class="navbar navbar-inverse " id="navHeader">
        <div id="sysName"><h3><span>E-Learning学习系统</span></h3></div>
        <div id="userName">
            <h5>学员：
                <a class="" href="#">
                    <span id="studentName">
					       <c:if test="${!empty studentName}">
                               <font color="blue"><c:out value="${studentName}"/></font>
                           </c:if>
                    </span>
                </a>
                &nbsp;&nbsp;&nbsp;&nbsp;欢迎进入大数据学习系统&nbsp;&nbsp;
                <a href="###" onclick="logout()">退出系统</a>
            </h5>
        </div>
    </div>

    <div class="contt">
        <!-- 左侧菜单选项========================================= -->
        <div id="navi" class="row-fluid">
            <div class="sidebar">

                <ul class="nav nav-sidebar">
                    <li class="active"><a href="#info" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <span class="glyphicon glyphicon-user" style="font-size:18px;"></span>
                        &nbsp;&nbsp;个人中心 </a>
                    </li>
                    <ul id="info" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('${ctx}/student/studentInfo/${ID}.do')">
                            <span class="glyphicon glyphicon-cog" style="font-size: 14px;"></span>
                            &nbsp;个人信息</a></li>
                    </ul>
                    <!-- 一级菜单 -->

                    <li><a href="#courseMenu" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <span class="glyphicon glyphicon-th-list" style=" font-size:18px;"> </span>
                         &nbsp;&nbsp;课程管理</a>
                    </li>
                    <!-- 二级菜单 -->
                    <!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
                    <ul id="courseMenu" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('${ctx}/student/myCourse.do')">
                            <span class="glyphicon glyphicon-align-left" style="font-size: 14px;"></span>
                            &nbsp;我的课程</a></li>
                        <li><a href="###" onclick="showAtRight('${ctx}/student/addCourse.do')">
                            <span class="glyphicon glyphicon-plus" style="font-size: 14px;"></span>
                            &nbsp;新增课程</a></li>
                    </ul>

                    <li><a href="#dataMenu" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <span class="glyphicon glyphicon-folder-open" style="font-size: 18px;"></span>
                        &nbsp;&nbsp;资料管理</a>
                    </li>
                    <ul id="dataMenu" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('${ctx}/student/dataScan.do')">
                            <span class="glyphicon glyphicon-align-left" style="font-size: 14px;"></span>
                            &nbsp;查看资料</a>
                        </li>
                    </ul>

                    <li><a href="#videoMenv" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <span class="glyphicon glyphicon-film" style="font-size: 18px;"></span>
                        &nbsp;&nbsp;观看视频</a>
                    </li>
                    <ul id="videoMenv" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('/student/videoScan.html')">
                            <span class="glyphicon glyphicon-align-left" style="font-size: 14px;"> </span>
                            &nbsp;视频列表</a>
                        </li>
                    </ul>

                </ul>

            </div>
        </div>
    </div>
    <!--右侧内容展示==================================================   -->
    <div class="main">
        <h1 class="page-header">
            <small>欢迎使用E-Learning学习系统</small>
        </h1>

        <!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
        <div id="content">

            <h1>
                使用指南：123456789
            </h1>

        </div>
    </div>
</div>
<script type="text/javascript" language="javascript">
    function logout() {
        window.open('', '_top');
        window.top.close();
    }
    /*
     * 对选中的标签激活active状态，对先前处于active状态但之后未被选中的标签取消active
     * （实现左侧菜单中的标签点击后变色的效果）
     */
    $(document).ready(function () {
        $('ul.nav > li').click(function (e) {
            $('ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });
    });

    /*
     * 解决ajax返回的页面中含有javascript的办法：
     * 把xmlHttp.responseText中的脚本都抽取出来，不管AJAX加载的HTML包含多少个脚本块，我们对找出来的脚本块都调用eval方法执行它即可
     */
    function executeScript(html) {

        var reg = /<script[^>]*>([^\x00]+)$/i;
        var htmlBlock = html.split("<\/script>");
        for (var i in htmlBlock) {
            var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
            if (blocks = htmlBlock[i].match(reg)) {
                //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
                var code = blocks[1].replace(/<!--/, '');
                try {
                    eval(code) //执行脚本
                }
                catch (e) {
                }
            }
        }
    }

    /*
     * 利用div实现左边点击右边显示的效果（以id="content"的div进行内容展示）
     * 注意：
     *   ①：js获取网页的地址，是根据当前网页来相对获取的，不会识别根目录；
     *   ②：如果右边加载的内容显示页里面有css，必须放在主页（即例中的index.jsp）才起作用
     *   （如果单纯的两个页面之间include，子页面的css和js在子页面是可以执行的。 主页面也可以调用子页面的js。但这时要考虑页面中js和渲染的先后顺序 ）
     */
    function showAtRight(url) {
        var xmlHttp;

        if (window.XMLHttpRequest) {
            // code for IE7+, Firefox, Chrome, Opera, Safari
            xmlHttp = new XMLHttpRequest();	//创建 XMLHttpRequest对象
        }
        else {
            // code for IE6, IE5
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        xmlHttp.onreadystatechange = function () {
            //onreadystatechange — 当readystate变化时调用后面的方法

            if (xmlHttp.readyState == 4) {
                //xmlHttp.readyState == 4	——	finished downloading response

                if (xmlHttp.status == 200) {
                    //xmlHttp.status == 200		——	服务器反馈正常

                    document.getElementById("content").innerHTML = xmlHttp.responseText;	//重设页面中id="content"的div里的内容
                    // executeScript(xmlHttp.responseText);	//执行从服务器返回的页面内容里包含的JavaScript函数
                }
                //错误状态处理
                else if (xmlHttp.status == 404) {
                    alert("出错了☹   （错误代码：404 Not Found），……！");
                    /* 对404的处理 */
                    return;
                }
                else if (xmlHttp.status == 403) {
                    alert("出错了☹   （错误代码：403 Forbidden），……");
                    /* 对403的处理  */
                    return;
                }
                else {
                    alert("出错了☹   （错误代码：" + request.status + "），……");
                    /* 对出现了其他错误代码所示错误的处理   */
                    return;
                }
            }

        }

        //把请求发送到服务器上的指定文件（url指向的文件）进行处理
        xmlHttp.open("GET", url, true);		//true表示异步处理
        xmlHttp.send();
    }

</script>

</body>
</html>