/**
 * Created by hujunhui on 2017/8/24.
 */
// 用于 dataImport js

function importData(rel) {


    var fileclass = document.getElementById("dataclass").value;

    var pic = $("#inputfile").get(0).files[0];
    var formData = new FormData();
    formData.append("file", pic);
    formData.append("fileclass", fileclass);

    if (filename = "") {
        alert("请选择文件");
    } else {
        if (fineclass == "") {
            alert("请输入资料分类");
        } else {

            $.ajax({
                type: "POST",
                url: rel,
                data: formData,
                processData: false,
                //必须false才会自动加上正确的Content-Type
                contentType: false,
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    if (onprogress && xhr.upload) {
                        xhr.upload.addEventListener("progress", onprogress, false);
                        return xhr;
                    }
                }
            });
        }
    }
}


function onprogress(evt) {
    var loaded = evt.loaded; //已经上传大小情况
    var tot = evt.total; //附件总大小
    var per = Math.floor(100 * loaded / tot); //已经上传的百分比
    $("#uploadscoll").html(per + "%");
    $("#uploadscoll").css("width", per + "%");
}


/**************  用于 dataScan   ******************/

function dataallselect() {

    var checklist = document.getElementsByClassName("datalist");

    if (document.getElementById("controllall").checked) {
        for (var i = 0; i < checklist.length; i++) {
            checklist[i].checked = 1;
        }
    } else {
        for (var j = 0; j < checklist.length; j++) {
            checklist[j].checked = 0;
        }
    }
}


function flushDatadList(basepath) {

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        success: function (data) {

            var res = JSON.parse(data); //res是json对象
            dataclearAndadd(res);

        },
        error: function (err) {
            // alert(err);
        }
    });

}



function dataclearAndadd(stdlist) {

    var str = "";
    var em = document.getElementById("tablecontent");
    while (em.hasChildNodes()) //当em下还存在子节点时 循环继续
    {
        em.removeChild(em.firstChild);
    }

    for (var i = 0; i < stdlist.length; i++) {
        str = str + '<tr name = "Oneofstd"><td><input type ="checkbox" class="datalist"></td><td >' + (i + 1) + '</td><td>' + stdlist[i].dataType + '</td><td class="fileName">' + stdlist[i].dataPath + '</td><td><button class="btn btn-primary btn-sm" onclick="downloadAfile("${pageContext.request.contextPath/data/downloadAfile.do",'+stdlist[i].dataPath+'})">下载 </button> | <button class = "btn btn-danger btn-sm" onclick="deleteAfile("${pageContext.request.contextPath/data/deleteAfile.do",'+stdlist[i].dataPath+'})">删除</button></td></tr>';
    }
    em.innerHTML = str;
}


function dataFindByClass(basepath) {

    var dataType = document.getElementById(name).value;


    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data: {
            "dataclass": dataType
        },
        success: function (data) {
            //返回的是json字符串

            var res = JSON.parse(data); //res是json对象
            dataclearAndadd(res);

        },
        error: function (err) {
            // alert(err);
        }
    });

}
function downloadAfile(basepath,fileUrl){

    //模拟ajax 下载文件
    var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '');
    form.attr('method', 'post');
    form.attr('action', basepath);

    var input1 = $('<input>');
    input1.attr('type', 'hidden');
    input1.attr('name', 'strUrl');
    input1.attr('value', fileUrl);
    $('body').append(form);  //将表单放置在web中
    form.append(input1);   //将查询参数控件提交到表单上
    form.submit();

}
function deleteAfile(basepath,fileUrl){


    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data: {
            "fileName": fileUrl
        },
        success: function () {
            flushDatadList();
        },
        error: function (err) {
            // alert(err);
        }
    });

}

function setDownloadList(basepath) {

    var checklist = document.getElementsByClassName("datalist");
    var fileNamelist = document.getElementsByClassName("fileName");

    var delDataList = new Array();

    var j=0;
    for (var i = 0; i < IDlist.length; ++i) {

        if (checklist[i].checked) {

            delDataList[j++] = fileNamelist[i].innerHTML.toString();
        }
    }

    for(j=0;j<delDataList.length;j++){                // 循环下载文件

        var form = $("<form>");   //定义一个form表单
        form.attr('style', 'display:none');   //在form表单中添加查询参数
        form.attr('target', '');
        form.attr('method', 'post');
        form.attr('action', basepath);

        var input1 = $('<input>');
        input1.attr('type', 'hidden');
        input1.attr('name', 'strUrl');
        input1.attr('value', delDataList[j]);
        $('body').append(form);  //将表单放置在web中
        form.append(input1);   //将查询参数控件提交到表单上
        form.submit();

    }


}

function setDeleteList(basepath) {

    var checklist = document.getElementsByClassName("datalist");
    var fileNamelist = document.getElementsByClassName("fileName");

    var delstdList = new Array();

    var j=0;
    for (var i = 0; i < IDlist.length; ++i) {

        if (checklist[i].checked) {

            delstdList[j++] = fileNamelist[i].innerHTML.toString();
        }
    }

    var str = "确认删除ID为：" + delstdList.join(",") + "这些资料吗？";
    if (confirm(str)) {

        $.ajax({
            url: basepath,
            type: "POST",
            dataType: "json",
            data: {
                "studentList": delstdList.join(",")
            },
            success: function () {
                flushDatadList();
            },
            error: function (err) {
                alert("删除失败");
            }
        });

    }


}

/*
 function downloadFileByForm() {
 console.log("ajaxDownloadSynchronized");
 var url = "http://localhost:8080/ajaxDownloadServlet.do";
 var fileName = "testAjaxDownload.txt";
 var form = $("<form></form>").attr("action", url).attr("method", "post");
 form.append($("<input></input>").attr("type", "hidden").attr("name", "fileName").attr("value", fileName));
 form.appendTo('body').submit().remove();
 }*/

/*
 function DownLoad(strUrl) {
 var form = $("<form>");   //定义一个form表单
 form.attr('style', 'display:none');   //在form表单中添加查询参数
 form.attr('target', '');
 form.attr('method', 'post');
 form.attr('action', "/QuestionInfo/DowmLoad");

 var input1 = $('<input>');
 input1.attr('type', 'hidden');
 input1.attr('name', 'strUrl');
 input1.attr('value', strUrl);
 $('body').append(form);  //将表单放置在web中
 form.append(input1);   //将查询参数控件提交到表单上
 form.submit();

 }
 */
