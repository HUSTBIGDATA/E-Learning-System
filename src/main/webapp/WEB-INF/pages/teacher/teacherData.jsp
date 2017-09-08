<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/24
  Time: 9:25
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
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- 引入各种CSS样式表 -->

    <link rel="stylesheet" href="<%=basePath%>statics/css/font-change.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/admin2Data.css">
    <link rel="stylesheet" href="<%=basePath%>statics/css/font-awesome.css">

    <script src="<%=basePath%>statics/js/admin2Data.js"></script>

    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>查看资料</title>
</head>

<body>
<div class="all" id="dataScan">
    <h2>学习资料</h2><br><br>
    <div id="dataTable">
        <div id="tabHead">
            <div id="tableHeadLeft">

                <div class="form-inline" role="form">
                    <div class="form-group">
                        <input type="text" class="form-control" id="name" placeholder="请输入资料类型">
                    </div>
                    <button type="button" onclick="dataFindByType('${pageContext.request.contextPath}/data/findByType.do')" class="btn btn-default">按类型查询
                    </button>
                </div>

            </div>
            <div id="tableHeadRight">
                <button type="button" class="btn btn-default" onclick="flushDataList('${pageContext.request.contextPath}/data/dataList.do')">刷新
                </button>
                <!--button type="button" class="btn btn-default" onclick="setDownloadList('${pageContext.request.contextPath}/manager/downloadData.do')">批量下载
                </button-->
                <button type="button" class="btn btn-default" onclick="setDeleteList('${pageContext.request.contextPath}')">批量删除
                </button>
                </button>
                <button type="button" class="btn btn-default" onclick="dataImport()">上传资料
                </button>

            </div>
        </div>


        <div id="dataImportDiv" style="display:none">
            <form class="form-horizontal" role="form" id="dataformDIv" enctype="multipart/form-data">

                <div class="form-group">
                    <label class="col-sm-1 control-label ">文件</label>
                    <div class="col-sm-5">
                        <input type="file" id="inputfile" name="inputfile">
                    </div>
                </div>  
            </form>
			
			<div class="form-group">
                 <label class="col-sm-1 control-label">分类</label>
                    <div class="col-sm-5">
                        <input name="datatype" type="text" class="form-control" id="datatype" placeholder="请输入资料种类">
                    </div>
            </div>
                
                

            <button name="upload" type="button " onclick="importData('${pageContext.request.contextPath}/data/uploadData/')" class="btn btn-default">上传
            </button>
				
				<!--input id="qq" name="qq" value="1" type="hidden"-->
            <!---以下为进度条-->
            <div class="progress progress-striped active">
                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="uploadscoll">
                </div>
            </div>
        </div>

		


        <div id="tableBody">
            <table class="table table-striped table-bordered table-condensed">
                <thead>
                <tr>
                    <td style="width:8%">
                        <input type="checkbox" id="controllall" onclick="dataallselect()">&nbsp;&nbsp;全选
                    </td>
                    <td style="width:5%">序号</td>
                    <td style="width:17%">资料类型</td>
                    <!-- 机器学习 人工智能什么的-->
                    <td style="width:30%">资料名</td>
                    <td style="width:20%">
                    <td style="width:20%">
                    </td>
                </tr>
                </thead>
                <tbody id="tablecontent">
                <tr name="Oneofstd">
                    <td><input type="checkbox" class="datalist"></td>
                    
                </tr>

                </tbody>
                </table>
        </div>

        </div>
        </div>

		<input id="PageContext" type="hidden" value="${pageContext.request.contextPath}"/>
         <iframe style="display:none" onload="javascript:flushDataList('${pageContext.request.contextPath}/data/dataList.do')"/>
        </body>
        </html>



