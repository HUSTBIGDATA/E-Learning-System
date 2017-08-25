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

function flushDataList(basepath) {








}

function dataclearAndadd(stdlist) {

    var str = "";
    var em = document.getElementById("tablecontent");
    while (em.hasChildNodes()) //当em下还存在子节点时 循环继续
    {
        em.removeChild(em.firstChild);
    }

    for (var i = 0; i < stdlist.length; i++) {
        str = str + '<tr name = "Oneofstd"><td><input type ="checkbox" class="datalist"></td><td >'+ (i+1) +'</td><td>'+ stdlist[i].classname +'</td><td>'+ stdlist[i].filenaem +'</td><td><button class="btn btn-primary btn-sm" onclick="">下载 </button> | <button class = "btn btn-danger btn-sm">删除</button></td></tr>';

    }
    em.innerHTML = str;
}
