/**
 * Created by hujunhui on 2017/8/24.
 */
// 用于 dataImport

/*function importData(rel) {


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
}*/



function importData(basepath) {

    var formData = new FormData($("#dataformDIv")[0]);
    var dataType = document.getElementById("datatype").value;

    $.ajax({
        url:basepath + dataType + '.do',
        type:"POST",
        data:formData,
        async:true,
        cache:false,
        processData:false,
        contentType:false,
        success:function(response){
            //根据返回结果提示，，response为字符串 ‘上传成功’
            alert(response);
        },
        xhr: function(){
      　　　　　　var xhr = $.ajaxSettings.xhr();
      　　　　　　if(onprogress && xhr.upload) {
      　　　　　　　　xhr.upload.addEventListener("progress" , onprogress, false);
      　　　　　　　　return xhr;
      　　　　　　}
      　　  },
        error:function(){
            alert("上传失败!");
        }
    });

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

function dataImport() {
	if(document.getElementById("dataImportDiv").style.display=="none")
		document.getElementById("dataImportDiv").style.display="";
	else
		document.getElementById("dataImportDiv").style.display="none";
}
function flushDataList(basepath) {

    document.getElementById("dataImportDiv").style.display="none";
    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        success: function (data) {

            var res = JSON.parse(data); //res是json对象
            dataclearAndadd(res);

        },
        error: function (err) {
            alert("查询失败!");
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
    //"/readOnline.do",' + stdlist[i].dataPath +'
    for (var i = 0; i < stdlist.length; i++) {
        str = str + '<tr name = "Oneofstd"><td><input type ="checkbox" class="datalist"></td><td >' + (i + 1) + '</td><td>' + stdlist[i].dataType + '</td><td class="fileName">' 
        + stdlist[i].dataName + '</td><td><button type="button" class="btn btn-default" onclick="readOnline()">预览</button></td>' 
        + '<td><button type="button" class="btn btn-default" onclick="download(' + stdlist[i].dataID + ')">下载</button></td>'
        + '<td class="dataID" style="display:none">' + stdlist[i].dataID + '</td></tr>';
    }
    em.innerHTML = str;
}

function download(ID) {
	
	//var ID = document.getElementsByClassName("dataID").value;
	var ori = document.getElementById("PageContext").value;
	
	 var form = $("<form>");   //定义一个form表单
	    form.attr('style', 'display:none');   //在form表单中添加查询参数
	    form.attr('target', '');
	    form.attr('method', 'post');
	    form.attr('action', ori + '/data/downloadData.do');

	    var input1 = $('<input>');
	    input1.attr('type', 'hidden');
	    input1.attr('name', 'ID');
	    input1.attr('value', ID);
	    $('body').append(form);  //将表单放置在web中
	    form.append(input1);   //将查询参数控件提交到表单上
	    form.submit();
	/*alert(ID);
        $.ajax({
            url: ori + '/manager/downloadData.do',
            type: "POST",
            dataType: "json",
            data: {
                "ID": ID
            },
            success: function (res) {
            	alert(res);
            },
            error: function (err) {
                alert("下载失败");
            }
        });*/
}

function dataFindByType(basepath) {

    var dataType = document.getElementById("name").value;

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data: {
            "type": dataType
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
function readOnline(basepath,filepath) {         // 在线阅读跳转方法


    var ori = document.getElementById("PageContext").value;


    //这里进行预览跳转   不用ajax请求，使用form请求，并且打开新的标签页
    var form = $("<form>");   //定义一个form表单
    form.attr('style', 'display:none');   //在form表单中添加查询参数
    form.attr('target', '_blank');
    form.attr('method', 'get');
    form.attr('action', ori + basepath);

    var input1 = $('<input>');
    input1.attr('type', 'hidden');
    input1.attr('name', 'filepath');
    input1.attr('value', filepath);
    $('body').append(form);  //将表单放置在web中
    form.append(input1);   //将查询参数控件提交到表单上
    form.submit();

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
    var IDList = document.getElementsByClassName("dataID");
    
    var delNameList = new Array();
    var delstdList = new Array();

    var j=0;
    for (var i = 0; i < checklist.length; ++i) {

        if (checklist[i].checked) {
            delstdList[j] = IDList[i].innerHTML.toString();  	
            delNameList[j] = fileNamelist[i].innerHTML.toString();
            j++;
        }
    } 

        $.ajax({
            url: basepath,
            type: "POST",
            dataType: "json",
            data: {
                "dataList": delstdList.join(",")
            },
            success: function (res) {
            	alert(res);
            },
            error: function (err) {
                alert("下载失败");
            }
        });

   /* var checklist = document.getElementsByClassName("datalist");
    var fileNamelist = document.getElementsByClassName("fileName");

    var delDataList = new Array();

    var j=0;
    for (var i = 0; i < checklist.length; ++i) {

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

    }*/


}

function setDeleteList(basepath) {

    var checklist = document.getElementsByClassName("datalist");
    var fileNamelist = document.getElementsByClassName("fileName");
    var IDList = document.getElementsByClassName("dataID");
    
    var delNameList = new Array();
    var delstdList = new Array();

    var j=0;
    for (var i = 0; i < checklist.length; ++i) {

        if (checklist[i].checked) {
            delstdList[j] = IDList[i].innerHTML.toString();  	
            delNameList[j] = fileNamelist[i].innerHTML.toString();
            j++;
        }
    } 

    var str = "确认删除名字为：" + delNameList.join(",") + "这些资料吗？";

    if (confirm(str)) {

        $.ajax({
            url: basepath + '/data/deleteData.do',
            type: "POST",
            dataType: "json",
            data: {
                "dataList": delstdList.join(",")
            },
            success: function (res) {
            	alert("删除成功!");
            	flushDataList(basepath + '/data/dataList.do');
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
