<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/18
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="Author" content="Dreamer-1.">

    <!-- 引入各种CSS样式表 -->

    <link rel="stylesheet" href="<%=basePath%>/statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>/statics/css/admin.css">
    <link rel="stylesheet" href="<%=basePath%>/statics/css/font-awesome.css">

    <!--script type="text/javascript" src="js/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css"-->

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>大数据学习后台管理系统</title>
</head>

<body>

<div class="all">
    <!-- 顶部菜单（来自bootstrap官方Demon）==================================== -->
    <div class="navbar navbar-inverse " id="navHeader">
        <div id="sysName"><h3><span>E-Learning学习系统</span></h3></div>
        <div id="userName">
            <h5>管理员：
                <a class="" href="#">
                    <span id="adminName">
					       <c:if test="${!empty adminName}">
                                  <font color="blue"><c:out value="${adminName}" /></font>
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
                <div style="background-color:red">

                </div>
                <ul class="nav nav-sidebar">
                    <li class="active"><a href="#info" class="nav-header menu-first collapsed" data-toggle="collapse">
                        &nbsp; 个人中心 <span class="sr-only">(current)</span></a>
                    </li>
                    <ul id="info" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('adminInfo.html')"> 个人信息</a></li>
                    </ul>
                    <!-- 一级菜单 -->
                    <li ><a href="#studentMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                        </i>&nbsp; 学生管理 <span class="sr-only">(current)</span></a>
                    </li>
                    <!-- 二级菜单 -->
                    <!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
                    <ul id="studentMeun" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('studentScan.html')"> 查看学生</a></li>
                        <li><a href="###" onclick="showAtRight('${ctx}/manager/studentImport.html')"> 导入名单</a></li>
                    </ul>

                    <li ><a href="#teacherMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                        &nbsp; 教师管理 <span class="sr-only">(current)</span></a>
                    </li>
                    <!-- 二级菜单 -->
                    <!-- 注意一级菜单中<a>标签内的href="#……"里面的内容要与二级菜单中<ul>标签内的id="……"里面的内容一致 -->
                    <ul id="teacherMeun" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('teacherScan.html')"> 查看教师</a></li>
                        <li><a href="###" onclick="showAtRight('teacherImport.html')"> 导入名单</a></li>
                    </ul>

                    <li><a href="#productMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                        <i class="fa fa-globe"></i>&nbsp; 资料管理 <span class="sr-only">(current)</span></a>
                    </li>
                    <ul id="productMeun" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('dataScan.html')"> 查看资料</a></li>
                        <li><a href="###" onclick="showAtRight('dataUpload.html')"> 资料上传</a></li>
                    </ul>

                    <li><a href="#recordMeun" class="nav-header menu-first collapsed" data-toggle="collapse">
                        &nbsp; 视频管理 <span class="sr-only">(current)</span></a>
                    </li>
                    <ul id="recordMeun" class="nav nav-list collapse menu-second">
                        <li><a href="###" onclick="showAtRight('videoScan.html')" > 查看视频</a></li>
                        <li><a href="###" onclick="showAtRight('videoUpload.html')" > 上传视频</a></li>
                    </ul>

                </ul>

            </div>
        </div>
    </div>
       <!--右侧内容展示==================================================   -->
        <div class="main">
            <h1 class="page-header"><small>欢迎使用大数据学习平台管理系统</small></h1>

            <!-- 载入左侧菜单指向的jsp（或html等）页面内容 -->
            <div id="content">

                <h1>
                    <strong>使用指南：</strong></br>
                </h1>

            </div>
        </div>
    </div>
    <script type="text/javascript" language="javascript">
        function logout(){
            window.open('','_top');
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
        function executeScript(html)
        {

            var reg = /<script[^>]*>([^\x00]+)$/i;
            var htmlBlock = html.split("<\/script>");
            for (var i in htmlBlock)
            {
                var blocks;//匹配正则表达式的内容数组，blocks[1]就是真正的一段脚本内容，因为前面reg定义我们用了括号进行了捕获分组
                if (blocks = htmlBlock[i].match(reg))
                {
                    //清除可能存在的注释标记，对于注释结尾-->可以忽略处理，eval一样能正常工作
                    var code = blocks[1].replace(/<!--/, '');
                    try
                    {
                        eval(code) //执行脚本
                    }
                    catch (e)
                    {
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
                xmlHttp=new XMLHttpRequest();	//创建 XMLHttpRequest对象
            }
            else {
                // code for IE6, IE5
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlHttp.onreadystatechange=function() {
                //onreadystatechange — 当readystate变化时调用后面的方法

                if (xmlHttp.readyState == 4) {
                    //xmlHttp.readyState == 4	——	finished downloading response

                    if (xmlHttp.status == 200) {
                        //xmlHttp.status == 200		——	服务器反馈正常

                        document.getElementById("content").innerHTML=xmlHttp.responseText;	//重设页面中id="content"的div里的内容
                        executeScript(xmlHttp.responseText);	//执行从服务器返回的页面内容里包含的JavaScript函数
                    }
                    //错误状态处理
                    else if (xmlHttp.status == 404){
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