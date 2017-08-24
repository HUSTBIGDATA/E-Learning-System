/**
 * Created by hujunhui on 2017/8/22.
 */
// 以下为 studentScan的 Javascript*****************************************************   studentScan的
function allselect() {

    var checklist = document.getElementsByClassName("studentlist");

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

function clearAndadd(stdlist) {

    var str = "";
    var em = document.getElementById("tablecontent");
    while (em.hasChildNodes()) //当em下还存在子节点时 循环继续
    {
        em.removeChild(em.firstChild);
    }

    for (var i = 0; i < stdlist.length; i++) {
        str = str + '<tr name="Oneofstd"><td><input type="checkbox" class="studentlist">' +
            '</td><td>' + (i + 1) + '</td><td>' + stdlist[i].name + '</td><td class="ID">' + stdlist[i].studentID + '</td><td>' + stdlist[i].preferences + '</td></tr>';

    }
    em.innerHTML = str;
}

function flushStdList(basepath) {

    var stdName = document.getElementById("name").value;
    reUrl = basepath;
    $.ajax({
        url: reUrl,
        type: "POST",
        dataType: "json",
        success: function (data) {

            var res = JSON.parse(data); //res是json对象
            clearAndadd(res);

        },
        error: function (err) {
            // alert(err);
        }
    });

}

function nengbunengxing(basepath) { //删除所选的学生

    var checklist = document.getElementsByClassName("studentlist");
    var IDlist = document.getElementsByClassName("ID");
    var delstdList = new Array();

    var stdJson = [];
    var j = 0;
    for (var i = 0; i < IDlist.length; ++i) {

        if (checklist[i].checked) {

            delstdList[j++] = IDlist[i].innerHTML.toString();
        }
    }

    var str = "确认删除ID为：" + delstdList.join(",") + "这些学生吗？";
    if (confirm(str)) {
        var stdName = document.getElementById("name").value;
        reUrl = basepath;
        $.ajax({
            url: reUrl,
            type: "POST",
            dataType: "json",
            data: {
                "studentList": delstdList.join(",")
            },
            success: function (data) {

                alert("删除成功");

            },
            error: function (err) {
                alert("删除失败");
            }
        });

    }
}


function findByname(basepath) {


    var stdName = document.getElementById("name").value;
    reUrl = basepath;
    var Namejson = {
        "name": stdName
    };

    $.ajax({
        url: reUrl,
        type: "POST",
        dataType: "json",
        data: Namejson,
        success: function (data) {

            var res = JSON.parse(data); //res是json对象
            clearAndadd(res);

        },
        error: function (err) {
            alert(err);
        }
    });

}


// 以下为 adminInfo Javascript*****************************************************   adminInfo

function see() {
    alert("执行初始化666666666666666666666666");
    document.getElementById("inputImgDiv").style.display = "none";
    document.getElementById("changePwdDiv").style.display = "none";
}

function updateImg() {
    document.getElementById("inputImgDiv").style.display = "";
}

function changePwd() {
    document.getElementById("changePwdDiv").style.display = "";
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
    var newPwd = document.getElementById("newPwd").value
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
                    reUrl = basepath + "changePassword.html";
                    //这里修改密码
                    $.ajax({
                        url: reUrl,
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

// 以下为 studentImport的 Javascript*****************************************************   studentImport

function imoortTeacherList(basepath) {

    var pic = $("#inputfile").get(0).files[0];
    var formData = new FormData();
    formData.append("file", pic);

    /**
     * 必须false才会避开jQuery对 formdata 的默认处理
     * XMLHttpRequest会对 formdata 进行正确的处理
     */
    $.ajax({
        type: "POST",
        url: basepath,
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
function onprogress(evt) {
    var loaded = evt.loaded;                  //已经上传大小情况
    var tot = evt.total;                      //附件总大小
    var per = Math.floor(100 * loaded / tot);      //已经上传的百分比
    $("#uploadscoll").html(per + "%");
    $("#uploadscoll").css("width", per + "%");
}


