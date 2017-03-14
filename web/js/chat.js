/**
 * Created by Administrator on 2017/3/5 0005.
 */

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    return date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes() +seperator2 +date.getSeconds();
}
$(document).ready(function () {

    dwr.engine.setActiveReverseAjax(true) ;

    //设置在页面关闭时，通知服务端销毁会话
    dwr.engine.setNotifyServerOnPageUnload(true);

    $(document).keydown(function () {
        if(event.ctrlKey == true && event.keyCode == 13){
            var box_obj = document.getElementById("massage");
            var main_obj = $(".main ul");
            var input_obj = $("#input_text");
            var text = $.trim(input_obj.val());
            if(text==""){
                return;
            }
            service.push(text);
            var s = '<li>'+
                '<p class="time">'+
                '<span>'+
                getNowFormatDate()+
                '</span>'+
                '</p>'+
                '<div class="self">'+
                '<img class="avatar" width="30" height="30" src="images/self_avatar.jpg">'+
                '<div class="text">'+text+
                '</div>'+
                '</div>'+
                '</li>';
            main_obj.append(s);
            input_obj.val("");
            box_obj.scrollTop = box_obj.scrollHeight;
        }
    });
});

function callback(msg){
    var box_obj = document.getElementById("massage");
    var main_obj = $(".main ul");
    var s = '<li>'+
        '<p class="time">'+
        '<span>'+getNowFormatDate()+
        '</span>'+
        '</p>'+
        '<div class="main_self">'+
        '<img class="avatar" width="30" height="30" src="images/default-avatar.jpg">'+
        '<div class="text">'+msg+
        '</div>'+
        '</div>'+
        '</li>';
    main_obj.append(s);
    box_obj.scrollTop = box_obj.scrollHeight;
    if(window.Notification && Notification.permission !== "denied") {
        Notification.requestPermission(function(status) {
            var n = new Notification('你有一条新的消息', { body: msg,icon:'images/self_avatar.jpg' });
            n.onclick = function () {
                //
            };
            setTimeout(function () {
                n.close();
            },5000);
        });
    }
}