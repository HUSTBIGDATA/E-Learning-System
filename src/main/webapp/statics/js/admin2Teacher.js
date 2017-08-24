/**
 * Created by hujunhui on 2017/8/24.
 */
/*****************用于 teacherScan 的 js  ******************/
function teacherallselect() {

    var checklist = document.getElementsByClassName("teacherlist");

    if (document.getElementById("teacherControllall").checked) {
        for (var i = 0; i < checklist.length; i++) {
            checklist[i].checked = 1;
        }
    } else {
        for (var j = 0; j < checklist.length; j++) {
            checklist[j].checked = 0;
        }
    }
}

function teacherclearAndadd(stdlist) {

    var str = "";
    var em = document.getElementById("teachertablecontent");
    while (em.hasChildNodes()) //当em下还存在子节点时 循环继续
    {
        em.removeChild(em.firstChild);
    }

    for (var i = 0; i < stdlist.length; i++) {
        str = str + '<tr name="Oneofstd"><td><input type="checkbox" class="teacherlist">' +
            '</td><td>' + (i + 1) + '</td><td>' + stdlist[i].name + '</td><td class="ID">' + stdlist[i].studentID + '</td></tr>';

    }
    em.innerHTML = str;
}

function teacherflushStdList(adminID, basepath) {
    //用于刷新整个页面教师名单
    $.ajax({
        url: basepath,
        type: "POST",
        data: {
            "adminID": adminID
        },
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

function deleteTeacherlist(basepath) { //删除所选的学生

    var checklist = document.getElementsByClassName("teacherlist");
    var IDlist = document.getElementsByClassName("ID");
    var delstdList = new Array();

    var stdJson = [];
    var j = 0;
    for (var i = 0; i < IDlist.length; ++i) {

        if (checklist[i].checked) {

            delstdList[j++] = IDlist[i].innerHTML.toString();
        }
    }

    var str = "确认删除ID为：" + delstdList.join(",") + "这些教师吗？";
    if (confirm(str)) {

        $.ajax({
            url: basepath,
            type: "POST",
            dataType: "json",
            data: {
                "studentList": delstdList.join(",")
            },
            success: function (data) {
                // 成功后会返回 目前还存在的教师名单 用于刷新页面
                var res = JSON.parse(data); //res是json对象
                clearAndadd(res);



            },
            error: function (err) {
                alert("删除失败");
            }
        });

    }
}


function teacherfindByname(basepath) {


    var teachername = document.getElementById("teachername").value;

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data: {
            "name": teachername
        },
        success: function (data) {

            var res = JSON.parse(data);
            //res是json对象
            clearAndadd(res);

        },
        error: function (err) {
            alert(err);
        }
    });

}



/**********************************************/


function imoortTeacherList(basepath) {

    //alert(basepath);
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
    var loaded = evt.loaded; //已经上传大小情况
    var tot = evt.total; //附件总大小
    var per = Math.floor(100 * loaded / tot); //已经上传的百分比
    $("#uploadscoll").html(per + "%");
    $("#uploadscoll").css("width", per + "%");
}
