
var dialogReturn_key = "ECTS_DialogKey"; //保存弹出窗口的返回值的cookie键值
function DialogCloseCallback(control, callback) {
    var returnvalue = getCookie(dialogReturn_key); //获得窗口的返回值
    if (returnvalue != null && returnvalue != "") {
        if (callback != null) {
            eval(callback);
        }
        if (control != null)
            $(control).click();
    }
    setCookie(dialogReturn_key, ""); //清空Cookie
    //         iframeAutoFit();//iframe自动伸展，解决滚动问题
}
