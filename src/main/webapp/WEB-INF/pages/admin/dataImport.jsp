<%--
  Created by IntelliJ IDEA.
  User: hujunhui
  Date: 2017/8/24
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="zh-CN">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <script src="js/admin2Data.js"></script>
    <link rel="stylesheet" href="css/admin2Data.css">


    <link rel="stylesheet" href="css/font-change.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>上传资料</title>
</head>

<body>
<div class="all">

    <div id="dataImportDiv">
        <div class="form-horizontal" role="form" id="dataformDIv">

            <div class="form-group">
                <label  class="col-sm-2 control-label sr-only">文件</label>
                <div class="col-sm-7">
                    <input type="file" id="inputfile" name="inputfile">
                </div>
            </div>


            <div class="form-group">
                <label  class="col-sm-2 control-label">分类</label>
                <div class="col-sm-7">
                    <input type="text" class="form-control" id="dataclass" placeholder="请输入资料种类">
                </div>
            </div>

            <button type="button" onclick="imoortData('${pageContext.request.contextPath}/data/importData.do')" class="btn btn-default">上传
            </button>

        </div>
        <div class="progress progress-striped active">
            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" id="uploadscoll">
            </div>
        </div>
    </div>
</div>
</body>
</html>
