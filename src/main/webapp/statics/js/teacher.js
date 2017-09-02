/**
 * Created by hujunhui on 2017/8/27.
 */
// 以下为 studentInfo 页面的js
function updateImg() {
    if (document.getElementById("inputImgDiv").style.display == "none")
        document.getElementById("inputImgDiv").style.display = "";
    else
        document.getElementById("inputImgDiv").style.display = "none";
}

function changePwd() {
    if (document.getElementById("changePwdDiv").style.display == "none")
        document.getElementById("changePwdDiv").style.display = "";
    else
        document.getElementById("changePwdDiv").style.display = "none";
}


function submitImg(ID, basepath) {
    //这里更换页面照片  并且该照片提交给服务器

    $.ajax({
        url: basepath,
        type: "POST",
        async: true,
        dataType: "json",
        secureuri: false,
        data: {
            "ID": ID
        },
        fileElementId: "inputfile",
        success: function (data) {
            // data为照片的存储路径
            //alert(data);
            document.getElementById("inputImgDiv").style.display = "none";
            $("#photo").attr("src", basepath + "/profile/readImage?imagePath=" + data.imagePath); //更改页面头像
        },
        error: function (err) {
            alert(err);
        }
    });
}


function SubmitchangePwd(ID, basepath) {
    //这里提交密码数据
    var oldPwd = document.getElementById("oldPwd").value;
    var newPwd = document.getElementById("newPwd").value;
    var newPwdSure = document.getElementById("newPwdSure").value;

    if (oldPwd == "") {
        alert("请输入原密码!");
    } else {
        if (newPwd == "") {
            alert("请输入新密码!");
        } else {
            if (newPwdSure == "") {
                alert("请再次输入新密码!");
            } else {
                if (newPwdSure == newPwd) {

                    //这里修改密码
                    $.ajax({
                        url: basepath,
                        type: "POST",
                        dataType: "json",
                        data: {
                            "oldPassword": oldPwd,
                            "newPassword": newPwd,
                            "ID": ID
                        },
                        success: function (data) {
                            // data为返回的字符串：密码修改成功或者密码修改失败
                            alert(data);
                            document.getElementById("changePwdDiv").style.display = "none";
                        },
                        error: function (err) {
                            alert(err);
                        }
                    });

                } else {
                    alert("两次新密码不一致!");
                }
            }
        }
    }
}

// 以下为 teacherData页面的js

function importData(basepath) {

    var formData =new FormData($("#dataformDIv")[0]);

    $.ajax({
        url:basepath,
        type:"POST",
        data: formData,
        async:true,
        cache:false,
        processData:false,
        contentType:false,
        success:function(response){
            //根据返回结果提示，，response为字符串 ‘上传成功’
        document.getElementById("dataImportDiv").display="none";
            alert(response);
            
        },
        error:function(){
            
            alert("上传学生名单失败!");
        }
    });

}

/*
function onprogress(evt) {
    var loaded = evt.loaded; //已经上传大小情况
    var tot = evt.total; //附件总大小
    var per = Math.floor(100 * loaded / tot); //已经上传的百分比
    $("#uploadscoll").html(per + "%");
    $("#uploadscoll").css("width", per + "%");
}
*/


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

function  dataImport() {
   if (document.getElementById("dataImportDiv").style.display == "none")
        document.getElementById("dataImportDiv").style.display = "";
    else
        document.getElementById("dataImportDiv").style.display = "none";
      
}
function flushDataList(basepath) {

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        success: function (data) {

            var res = JSON.parse(data); //res是json对象
            dataclearAndadd(res);

        },
        error: function (err) {
            //alert("查询失败!");
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
        str = str + '<tr name = "Oneofstd"><td><input type ="checkbox" class="datalist"></td><td >' + (i + 1) + '</td><td>' + stdlist[i].dataType + '</td><td class="fileName">' + stdlist[i].dataName + '</td><td><a onclick="readOnline("/readOnline.do",' + stdlist[i].dataPath +')">预览</a></td></tr>';
    }
    em.innerHTML = str;
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

/*function setDeleteList(basepath) {
   教师不可以删除文件，，只能上传文件
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

}*/
