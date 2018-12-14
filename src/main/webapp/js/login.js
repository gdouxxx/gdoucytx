//alert("nihao");

function btn(){
	var btn1 = document.getElementById('denglu');
	var value = document.getElementById('login-code').value;
    var code = document.getElementById('codetxt').value;

    function check(){
    	if (code != value) {
    		alert("验证码错误")；
    		return false;
    	}
    }
}


