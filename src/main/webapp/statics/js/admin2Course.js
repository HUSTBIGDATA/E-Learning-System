/**
 * Created by hujunhui on 2017/8/24.
 */


/**************  用于 dataScan   ******************/

function CourseAllselect() {

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

function addNewCourse() {

    document.getElementById("newCourse").style.display = "";
}


function flushCoursedList(basepath) {

    document.getElementById("newCourse").style.display = "none";

    $.ajax({
        url: basepath + '/course/courselist.do',
        type: "POST",
        dataType: "json",
        success: function (data) {

            var res = JSON.parse(data); //res是json对象
            courseclearAndadd(res);

        },
        error: function (err) {
            // alert(err);
        }
    });

}

function addNewCourse(basepath) {

    var courseID = document.getElementById("courseID").value;
    var courseName = document.getElementById("courseName").value;
    var teacherID = document.getElementById("teacherID").value;

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data: {
            "courseID": courseID,
            "courseName": courseName,
            "teacherID": teacherID
        },
        success: function (data) {
            document.getElementById("newCourse").style.display = "none";

        },
        error: function (err) {
            // alert(err);
        }
    });


}

function courseclearAndadd(stdlist) {

    var str = "";
    var em = document.getElementById("tablecontent");
    while (em.hasChildNodes()) //当em下还存在子节点时 循环继续
    {
        em.removeChild(em.firstChild);
    }

    for (var i = 0; i < stdlist.length; i++) {
        str = str + '<tr name="Oneofstd"><td><input type="checkbox" class="datalist"></td><td>' + (i + 1) + '</td><td class="courseid">' + stdlist[i].courseID + '</td><td>' + stdlist[i].teacherName + '</td><td>' + stdlist[i].teacherID + '</td></tr>';
    }
    em.innerHTML = str;
}


function dataFindByName(basepath) {

    var dataType = document.getElementById("CourseNameFind").value;

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data: {
            "courseName":dataType
        },
        success: function (data) {
            //返回的是json字符串        
            var res = JSON.parse(data); //res是json对象
           // dataclearAndadd(res);
            courseclearAndadd(res);

        },
        error: function (err) {
            // alert(err);
        }
    });

}

function deleteCourseSeleted(basepath) {

    var checklist = document.getElementsByClassName("datalist");
    var fileNamelist = document.getElementsByClassName("courseid");

    var delstdList = new Array();

    var j = 0;
    for (var i = 0; i < checklist.length; ++i) {

        if (checklist[i].checked) {

            delstdList[j++] = fileNamelist[i].innerHTML.toString();
        }
    }

    courselist = delstdList.join(",");
    var str = "确认删除ID为：" + courselist + "这些课程吗？";

    if (confirm(str)) {

        $.ajax({
            url: basepath + '/course/deleteCourseSeleted.do',
            type: "POST",
            dataType: "json",
            data: {
                "courselist": courselist
            },
            success: function (data) {
                alert("删除成功");
                var res = JSON.parse(data); //res是json对象
                courseclearAndadd(res);
            },
            error: function (err) {
                alert("删除失败");
            }
        });

    }

}
