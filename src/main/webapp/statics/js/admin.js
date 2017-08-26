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

                var res = JSON.parse(data); //res是json对象
                clearAndadd(res);
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

/*function see() {
    document.getElementById("inputImgDiv").style.display = "none";
    document.getElementById("changePwdDiv").style.display = "none";
}*/

function updateImg() {
	if(document.getElementById("inputImgDiv").style.display == "none")
		document.getElementById("inputImgDiv").style.display = "";
	else
		document.getElementById("inputImgDiv").style.display = "none";
}

function changePwd() {
	if(document.getElementById("changePwdDiv").style.display == "none")
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
                            "oldPassword":oldPwd,
                            "newPassword":newPwd,
                            "ID":ID
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

function importStudentList(basepath) {

    var formData =newFormData();
    formData.append("file", $("#inputfile")[0].files);
    $.ajax({
        url:basepath,
        type:"POST",
        data: formData,
        processData:false,
        contentType:false,
        success:function(response){
            //根据返回结果提示，，response为字符串 ‘上传成功’
            alert(response);
        },
        error:function(){
            alert("上传学生名单失败!");
        }
    });

}
/*
function onprogress(evt) {
    var loaded = evt.loaded;                  //已经上传大小情况
    var tot = evt.total;                      //附件总大小
    var per = Math.floor(100 * loaded / tot);      //已经上传的百分比
    $("#uploadscoll").html(per + "%");
    $("#uploadscoll").css("width", per + "%");
}
*/


