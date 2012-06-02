/* …œ∑Ω≤Àµ• */
function switchTab(tabpage,tabid){
var oItem = document.getElementById(tabpage).getElementsByTagName("li"); 
    for(var i=0; i<oItem.length; i++){
        var x = oItem[i];    
        x.className = "";
}
	document.getElementById(tabid).className = "Selected";
	var dvs=document.getElementById("cnt").getElementsByTagName("div");
	for (var i=0;i<dvs.length;i++){
	  if (dvs[i].id==('d'+tabid))
	    dvs[i].style.display='block';
	  else
  	  dvs[i].style.display='none';
	}
}
function isNumber(oNum) {
    if (!oNum) { return false; }
    var index = oNum.toString().indexOf('-');
    var temp = oNum.toString().substr(index + 1);
    var strP = /^\d+(\.\d+)?$/;
    if (!strP.test(temp)) return false;
    try {
        if (parseFloat(temp) != temp) return false;
    }
    catch (ex) {
        return false;
    }
    return true;
}
function ValidatePrice(priceTextBox, defaultValue) {
    if (priceTextBox == null) { return false; }
    if (!priceTextBox.value) {
        priceTextBox.value = defaultValue;
    }
    else {
        if (!isNumber(priceTextBox.value)) {
            priceTextBox.value = defaultValue;
            priceTextBox.focus();
            return false;
        }
        var value = new Number(parseFloat(priceTextBox.value));
        priceTextBox.value = value.toFixed(2);
        return true;
    }
}
function ValidateInt32(int32TextBox, defaultValue) {
    if (int32TextBox == null) { return false; }
    if (!int32TextBox.value) {
        int32TextBox.value = defaultValue;
    }
    else {
        if (!isNumber(int32TextBox.value)) {
            int32TextBox.value = defaultValue;
            int32TextBox.focus();
            return false;
        }
        var value = new Number(parseFloat(int32TextBox.value));
        if (value > 90000) {            
            int32TextBox.value = defaultValue;
            int32TextBox.focus();
            return false;
        }
        int32TextBox.value = value.toFixed(0);
        return true;
    }
}
