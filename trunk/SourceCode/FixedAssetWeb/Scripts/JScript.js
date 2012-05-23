// JScript File

function OpenPartsDlg() {
    var returnvalue = window.showModalDialog("PartselectDlg.aspx", '', 'dialogWidth:780px;dialogHeight:450px;Left=100,top=50,toolbar=no,resizable=yes,scrollbars=yes');
}

function OpenWin(src, width, height, left, top) {
    var fecture = "height=" + height + ", width=" + width + ", toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no,"
    if (top != null) {
        fecture += "top=" + top;
    }
    else {
        fecture += "top=50";
    }
    if (left != null) {
        fecture += ",left=" + left;
    }
    else {
        fecture += ",left=100";
    }
    window.open(src, "",
                 fecture);
}



// 获取元素坐标
var getCoords = function(node) {
    var x = node.offsetLeft;
    var y = node.offsetTop;
    var parent = node.offsetParent;
    while (parent != null) {
        x += parent.offsetLeft;
        y += parent.offsetTop;
        parent = parent.offsetParent;
    }
    return { x: x, y: y };
}
,
// getElementById
$ = function(element) {
    return typeof (element) == 'object' ? element : document.getElementById(element);
},

// getElementsByTagName
$t = function(tag, efrom) {
    return efrom == undefined ? document.getElementsByTagName(tag) : efrom.getElementsByTagName(tag);
},

// getElementsByTagName
$c = function(className, oBox) {
    //适用于获取某个HTML区块内部含有某一特定className的所有HTML元素
    this.d = oBox || document;
    var children = this.d.getElementsByTagName('*') || document.all;
    var elements = new Array();
    for (var ii = 0; ii < children.length; ii++) {
        var child = children[ii];
        var classNames = child.className.split(' ');
        for (var j = 0; j < classNames.length; j++) {
            if (classNames[j] == className) {
                elements.push(child);
                break;
            }
        }
    }
    return elements;
},
// 获取页面大小
pagesize = null,
getPageSize = function() {
    var xScroll, yScroll;
    if (window.innerHeight && window.scrollMaxY) {
        xScroll = document.body.scrollWidth;
        yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight) { // all but Explorer Mac
        xScroll = document.body.scrollWidth;
        yScroll = document.body.scrollHeight;
    } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
        xScroll = document.body.offsetWidth;
        yScroll = document.body.offsetHeight;
    }
    var windowWidth, windowHeight;
    if (self.innerHeight) { // all except Explorer
        windowWidth = self.innerWidth;
        windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
        windowWidth = document.documentElement.clientWidth;
        windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers
        windowWidth = document.body.clientWidth;
        windowHeight = document.body.clientHeight;
    }
    // Modify By Mudoo
    var visibleWidth, visibleHeight;
    visibleWidth = document.body.clientWidth;
    visibleHeight = document.body.clientHeight;
    // for small pages with total height less then height of the viewport
    if (yScroll < windowHeight) {
        pageHeight = windowHeight;
    } else {
        pageHeight = yScroll;
    }
    // for small pages with total width less then width of the viewport
    if (xScroll < windowWidth) {
        pageWidth = windowWidth;
    } else {
        pageWidth = xScroll;
    }
    arrayPageSize = new Array(pageWidth, pageHeight, windowWidth, windowHeight, visibleWidth, visibleHeight);
    return arrayPageSize;
};

// 下拉菜单
var doHide = null;
var prvSubMenu = null;
function showMenu(e, id) {
    clearTimeout(doHide);
    var menu = null;
    menu = document.getElementById(e.id + '_menu');
    if (menu == null) return;
    if (prvSubMenu != null && prvSubMenu != menu) hideMenu(prvSubMenu.id, true);
    menu.style.display = '';
    var XY = getCoords(e);
    if (menu.offsetHeight > 400) menu.style.height = '400px';
    if (pagesize == null) pagesize = getPageSize();
    if (XY.y + menu.offsetHeight > pagesize[5]) {
        XY.y -= (menu.offsetHeight + 5);
    } else {
        XY.y += (e.offsetHeight + 5);
    }
    if (XY.x + menu.offsetWidth > pagesize[4]) {
        XY.x -= Math.abs(e.offsetWidth - menu.offsetWidth);
    }
    menu.style.left = XY.x + 'px';
    menu.style.top = XY.y + 'px';
    prvSubMenu = menu;

    menu.onmouseover = function() {
        showMenu(this);
    }
    menu.onmouseout = function() {
        hideMenu(this);
    }

    //	displaySelect(false);
}

function hideMenu(menu, t) {
    menu = $(menu);
    if (menu == null) return;
    if (!t) {
        doHide = setTimeout('hideMenu("' + menu.id + '", true)', 500);
        return;
    }
    menu.style.display = 'none';
    prvSubMenu = null;

    //	displaySelect(true);
}

function menuInit() {
    var menus = $c('dropmenu');
    for (var i = 0; i < menus.length; i++) {
        menus[i].onmouseover = function() {
            showMenu(this);
        }
        menus[i].onmouseout = function() {
            hideMenu(this.id + '_menu');
        }
    }
}


