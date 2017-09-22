/**
 * Created by hujunhui on 2017/9/18.
 */
function flushVideoList(basepath) {

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        success: function (hotVideoList,classSum,videolist) {

            //    hotVideoList是四个轮播的视频的信息（名字，图片，地址）
            //    classSum是不同类型的视频的数目，默认公共视频放最前   例如{ 公共视频，大数据，数据挖掘 ...}

            var vhotVideoList = JSON.parse(hotVideoList); //res是json对象
            var vclassSum = JSON.parse(classSum);
           //var vvideolist = JSON.parse(videolist);

            showHot(vhotVideoList);
            showVideoList(vclassSum);    //先生成分类的框架

            for(var i=0;i<vclassSum.length;i++){

                 showVideoSubList(vclassSum[i],i);   //再对每一个类型的视频展示

            }

        },
        error: function (err) {
            // alert("查询失败!");
        }
    });

}
function showHot(vhotVideoList) {

       PageContext = document.getElementById("PageContext").value;
       hotSrc_em = document.getElementsByClassName("scollimg");
       hotInfo_em = document.getElementsByClassName("carousel-caption");

       for(i = 0;i < 4;i++){

           str = PageContext + vhotVideoList[i].videoSrc;
           hotInfo_em[i].innerHTML = vhotVideoList[i].videoInfo;
           hotSrc_em[i].src = str;

       }
}

function showVideoList(vclassSum) {

    PageContext = document.getElementById("PageContext").value;
    em = document.getElementById("vido");
    while (em.hasChildNodes()) //当em下还存在子节点时 循环继续
    {
        em.removeChild(em.firstChild);
    }
    var str="";

    for(var i=0;i<vclassSum.length;i++){

       str = str +  '<tr><td><div class="videoClass"><div class="videpClassTitle"><h3><span class="titleLeft">'+vclassSum[i].videoclassName+'</span></h3><a onclick="listmore("'+PageContext+'/video/videomore",'+ vclassSum[i].videoclassName + ')"><span class="titleRight">查看更多>></span></a></div><div class="vdoTab"></div></div></td></tr>';

    }
    em.innerHTML = str;
}

function showVideoSubList(videoClassName,index) {

    PageContext = document.getElementById("PageContext").value;

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data:{
            "videoClassName": videoClassName
        },
        success: function (videolist) {
            PageContext = document.getElementById("PageContext").value;

            var vhotVideoList = JSON.parse(videolist); //res是json对象
            var ems = document.getElementsByClassName("vdoTab")

            var str = '<table><tr><td>';

            for(var i=0;i<videolist.length && i<4;i++){

              str = str + '<textarea class="realName" disabled>'+videolist[i].videoName+'</textarea><a href="'+PageContext+'/video/videoShow?videoName='+videolist[i].videoName+'" target="_blank"><img src="'+PageContext+'/statics/img/'+videolist[i].Picture+'" alt="视频截图" class="vdoName"></a>';

            }
            str = str + '</td></tr></table>';
            ems[index].innerHTML = str;
        },
        error: function (err) {
            // alert("查询失败!");
        }
    });

}

function listmore(basepath,videoClassName){

//打开一个新的网页，里面显示该类型的所有视频

    // 创建Form
    var form = $('<form></form>');
    // 设置属性
    form.attr('action', basepath);
    form.attr('method', 'get');
    // form的target属性决定form在哪个页面提交
    // _self -> 当前页面 _blank -> 新页面
    form.attr('target', '_blank');
    // 创建Input
    var my_input = $('<input type="text" name="videoClassName" />');
    my_input.attr('value', videoClassName);
    // 附加到Form
    form.append(my_input);
    // 提交表单
    form.submit();
    // 注意return false取消链接的默认动作
    return false;

}
function flushListByClassName(basepath) {

    PageContext = document.getElementById("PageContext").value;
    em = document.getElementById("parent");
    className = document.getElementById("videoClassName").value;
    while (em.hasChildNodes()) //当em下还存在子节点时 循环继续
    {
        em.removeChild(em.firstChild);
    }

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data:{
            "videoClassName": className
        },
        success: function (videoClasslist) {

            var videoClasslist = JSON.parse(videoClasslist);
            str = '';
            for(var i=0;i<videoClasslist.length;i++){

                str = str + '<div class="child"><textarea class="realName" disabled>'+videoClasslist[i].videpName+'</textarea><a href="'+PageContext+'/video/videoShow?videoName='+videolist[i].videoName+'" target="_blank"><img src="'+PageContext+'/statics/img/'+videolist[i].Picture+'" alt="视频截图" class="vdoName"></a></div>';

            }

        },
        error: function (err) {
            // alert("查询失败!");
        }
    });





}



