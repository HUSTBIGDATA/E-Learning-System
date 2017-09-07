<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/30
  Time: 19:33
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
<c:set var="path" value="<%=basePath%>"></c:set>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入各种CSS样式表 -->

    <link rel="stylesheet" href="<%=basePath%>statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/online.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/font-awesome.css">

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script src="<%=basePath%>statics/js/admin2Course.js"></script>
    <script src="<%=basePath%>statics/js/pdf.js"></script>
    <script src="<%=basePath%>statics/js/pdf.worker.js"></script>
    

    <title>学习视频</title>
</head>

<body onload="timeAndcontent()">
<div id="allbody">
    <br>
    <h4><span>${fileName}</span></h4>
    <hr>
    <div id="onlineHead">
        <div id="leftDiv">
            <button class="btn btn-default btn-sm" id="prev" onclick="onPrevPage()">前一页</button>
            <button class="btn btn-default btn-sm" id="next" onclick="onNextPage()">后一页</button>
        </div>
        <div id="rightDiv">
            您已学习时间为：<span id="mytime">00:00:00</span>
        </div>
        <div id="centerDiv">

            <div class="form-inline row">
                <span>当前页数: <span id="page_num"></span> / <span id="page_count"></span></span>
                &nbsp;&nbsp;
                <input type="text" class="form-control input-sm" id="gotopages">
                <button type="submit" class="btn btn-default btn-sm" onclick="gotoooPage()">转到</button>
            </div>
        </div>

    </div>
    <br>
    <canvas id="the-canvas"></canvas>
</div>
<script type="text/javascript">

    var url = "D:/test/test.pdf";      //这里要不要在｛ctx｝后面加斜杠呢？

    //var url = '${filePath}'    这里是设置文件路径的地方
		//alert('${path}statics/js/admin2Course.js');
    PDFJS.workerSrc = '${path}statics/js/admin2Course.js';

    var pdfDoc = null,
        pageNum = 1, //初始页码
        pageRendering = false,
        pageNumPending = null,
        scale = 2.5,
        canvas = document.getElementById('the-canvas'),
        ctx = canvas.getContext('2d');

    /**
     * Get page info from document, resize canvas accordingly, and render page.
     * @param num Page number.
     */
    function renderPage(num) {
        pageRendering = true;
        // Using promise to fetch the page
        pdfDoc.getPage(num).then(function(page) {
            var viewport = page.getViewport(scale);
            canvas.height = viewport.height;
            canvas.width = viewport.width;

            // Render PDF page into canvas context
            var renderContext = {
                canvasContext: ctx,
                viewport: viewport
            };
            var renderTask = page.render(renderContext);

            // Wait for rendering to finish
            renderTask.promise.then(function() {
                pageRendering = false;
                if (pageNumPending !== null) {
                    // New page rendering is pending
                    renderPage(pageNumPending);
                    pageNumPending = null;
                }
            });
        });

        // Update page counters
        document.getElementById('page_num').textContent = pageNum;
    }

    /**
     * If another page rendering in progress, waits until the rendering is
     * finised. Otherwise, executes rendering immediately.
     */
    function queueRenderPage(num) {
        if (pageRendering) {
            pageNumPending = num;
        } else {
            renderPage(num);
        }
    }

    /**
     * Displays previous page.
     */
    function onPrevPage() {
        if (pageNum <= 1) {
            return;
        }
        pageNum--;
        queueRenderPage(pageNum);
    }

    /**
     * Displays next page.
     */
    function onNextPage() {

        if (pageNum >= pdfDoc.numPages) {
            return;
        }
        pageNum++;
        queueRenderPage(pageNum);

    }

    function gotoooPage() {

        var gotopages = document.getElementById("gotopages").value;
        var yy = gotopages * 1;
        if (gotopages < 0 || gotopages > pdfDoc.numPages) {
            return;
        }

        pageNum = yy;
        queueRenderPage(pageNum);

    }

    /**
     * Asynchronously downloads PDF.
     */
    PDFJS.getDocument(url).then(function(pdfDoc_) {
        pdfDoc = pdfDoc_;
        document.getElementById('page_count').textContent = pdfDoc.numPages;

        // Initial/first page rendering
        renderPage(pageNum);
    });

    function timeAndcontent() {
        var sec = 0;
        setInterval(function() {
            sec++;
            var date = new Date(0, 0);
            date.setSeconds(sec);
            var h = date.getHours(),
                m = date.getMinutes(),
                s = date.getSeconds();
            document.getElementById("mytime").innerText = two_char(h) + ":" + two_char(m) + ":" + two_char(s);
        }, 1000);

        function two_char(n) {
            return n >= 10 ? n : "0" + n;
        }

    }

</script>
</body>
</html>
