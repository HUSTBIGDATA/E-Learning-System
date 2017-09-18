/**
 * Created by hujunhui on 2017/9/18.
 */
function flushVideoList() {

    $.ajax({
        url: basepath,
        type: "POST",
        dataType: "json",
        data:{
            "filename": filename
        },
        success: function (hotVideoList,classSum,videolist) {

            //    hotVideoList是四个轮播的视频的信息（名字，图片，地址）
            //    classSum是不同类型的视频的数目，默认公共视频放最前   例如{ 公共视频，大数据，数据挖掘 ...}
            //    videolist存放的是不同种类视频信息，数目为 classSum * 4  例如(大数据1，大数据2，大数据3，大数据4，机器学习1，机器学习2，，)
            //   而大数据1 = 视频信息（名字，图片，地址）
            //   所以videolist里面为  ｛（名字，图片，地址）（名字，图片，地址）（名字，图片，地址）（名字，图片，地址）（名字，图片，地址）（名字，图片，地址）｝
            var vhotVideoList = JSON.parse(hotVideoList); //res是json对象
            var vclassSum = JSON.parse(classSum);
            var vvideolist = JSON.parse(videolist);

            showHot(vhotVideoList);
            showClass(vclassSum);
            showVideoList(vvideolist);

        },
        error: function (err) {
            // alert("查询失败!");
        }
    });

}
function showHot(vhotVideoList) {
    
}
function showClass(vclassSum) {
    
}
function showVideoList(vvideolist) {

}