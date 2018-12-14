//alert("hello");
/// 定义全局变量
var Objusername;
var Objpassword;
var Objrpassword;
var Objemail;
var Objphone;
var Objyzm;


//验证的全局变量
var usermsg;
var passwordmsg;
var checkpasswordmsg;
var emailmsg;
var phonemsg;
var yzmmsg;


window.onload = function(){

  /*function $(id){
  return document.getElementById("id");
}*/

    //获取输入控件的标记对象
   Objusername = document.getElementById("username");
   Objpassword = document.getElementById("password");
   Objrpassword = document.getElementById("rpassword");
   Objemail = document.getElementById("email");
   Objphone = document.getElementById("phone");
   Objyzm = document.getElementById("yzm");
   btn = document.getElementById("register")

   //获取错误信息的标记对象
   usermsg = document.getElementById("userMsg");
   passwordmsg = document.getElementById("passwordMsg");
   rpasswordmsg = document.getElementById("checkMsg");
   emailmsg = document.getElementById("emailMsg");
   phonemsg = document.getElementById("phoneMsg");
   yzmmsg = document.getElementById("yzmMsg");
};


    function checkForm() {          
      var bUsername = checkusername();
      var bPassword = checkpassword();
      var bRpassword = checkrpassword();
      var bEmail = checkemail();
      var bPhone = checkphone();
      var bYzm = checkyzm();
      return bUsername && bPassword && bRpassword && bEmail && bPhone && bYzm;  // return false后, 事件将被取消
}

    //验证用户名
    function checkusername() {      
	    var regex = /^[a-zA-Z_]\w{0,9}$/;  // 字母数字下划线1到10位, 不能是数字开头（不分大小写）
	    var value = Objusername.value;      // 获取usernameObj中的文本

	    var msg = "";                       // 最后的提示消息, 默认为空
	    if (!value){                         // 如果用户名没填, 填了就是一个字符串可以当作true, 没填的话不论null或者""都是false
	        msg = "用户名必须填写："; 
          usermsg.innerHTML = msg;
          return false;
      }          // 改变提示消息
	    else if (!regex.test(value)){        // 如果用户名不能匹配正则表达式规则
	        msg = "字母数字下划线1到10位，不能是数字开头";
          usermsg.innerHTML = msg;
          return false;
      }      // 改变提示消息
	    else if (value){
       	  	msg = "用户名可用";
          usermsg.innerHTML = msg;
          Objusername.parentNode.parentNode.style.color = msg == "" ? "black" : "blue";
	      return true;
       	  }
	    usermsg.innerHTML = msg;        // 将提示消息放入SPAN
	    Objusername.parentNode.parentNode.style.color = msg == "" ? "black" : "red";    // 根据消息结果改变tr的颜色
	    return true;                   // 如果提示消息为空则代表没出错, 返回true
}
      //验证密码
      function checkpassword() {      // 验证密码
	      var regex = /^.{6,16}$/;           // 任意字符, 6到16位
	      var value = Objpassword.value;
	      var msg = "";
	      if (!value){
	          msg = "密码必须填写";
          passwordmsg.innerHTML = msg;
            return false;
          }
	      else if (!regex.test(value)){
	          msg = "密码为6到16任意字母或数字";
          passwordmsg.innerHTML = msg;
            return false;
          }
	      else if (value){
       	  	msg = "密码可用";
          passwordmsg.innerHTML = msg;
          Objpassword.parentNode.parentNode.style.color = msg == "" ? "black" : "blue";
	      return true;
       	  }
	      passwordmsg.innerHTML = msg;
	      Objpassword.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	      return true;
}
       //验证确认密码
     function checkrpassword(){
      	  
       	  var regex = Objpassword.value;
       	  var value = Objrpassword.value;
          //alert(value);
       	  if (!value) {
       	  	msg = "请输入确认密码";
          rpasswordmsg.innerHTML = msg;
            return false;
          }
       	  else if (value != regex) {
       	  	msg = "两次密码不一致";
          rpasswordmsg.innerHTML = msg;
            return false;
          }
       	  else if (value == regex){
       	  	msg = "密码一致";
          rpasswordmsg.innerHTML = msg;
          Objrpassword.parentNode.parentNode.style.color = msg == "" ? "black" : "blue";
	      return true;
       	  }
       	  	
       	  rpasswordmsg.innerHTML = msg;
          Objrpassword.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	      return true;
}
        //验证邮箱
        function checkemail(){
        	var regex = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/; 
        	var value = Objemail.value;      	

        	if (!value) {
        		msg = "邮箱必须填写";
          emailmsg.innerHTML = msg;
            return false;
          }
        	else if (!regex.test(value)) {
        		msg = "邮箱格式不正确";
          emailmsg.innerHTML = msg;
            return false;
          }
        	else if (value){
       	  	msg = "邮箱格式正确";
          emailmsg.innerHTML = msg;
          Objemail.parentNode.parentNode.style.color = msg == "" ? "black" : "blue";
	      return true;
       	  }
        	emailmsg.innerHTML = msg;
          Objemail.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	      return true;
        }

        //验证手机号码
        function checkphone(){
        	var value = Objphone.value;
        	var regex = /^0?1[3|4|5|7|8][0-9]\d{8}$/;
        	msg = " ";

        	if (!value){
        		msg = " 手机号码必须填写";
          phonemsg.innerHTML = msg;
            return false;
          }
        	else if (!regex.test(value)){
        		msg = "手机号码格式不正确";
          phonemsg.innerHTML = msg;
            return false;
          }
            else if (value){
       	  	msg = "手机号码可用";
          phonemsg.innerHTML = msg;
          Objphone.parentNode.parentNode.style.color = msg == "" ? "black" : "blue";
	      return true;
       	  }
        	phonemsg.innerHTML = msg;
          Objphone.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	      return true;
        }
        
        //验证手机验证码
        function checkyzm(){
        	var value = Objyzm.value;

        	if (!value) {
        		msg = "请输入验证码";
        	
        	yzmmsg.innerHTML = msg;
          Objyzm.parentNode.parentNode.style.color = msg == "" ? "black" : "red";
	         return false;
          }
          return true;
        }
 //  $(function){
 //    var baseUrl = $("#baseUrl").val();
 //    $("#register").on("click",function(){
 //        var in1 = $("#username").val();
 //        var in2 = $("#password").val();
 //        var in3 = $("#email").val();
 //        var in4 = $("#phone").val();
 //        var args = {"username":in1,"password":in2,"email":in3,"phone":in4};
 //        $.post(baseUrl+"",args,function(res){
 //            var json = JSON.parse(res);
 //            if(res==100){
 //                location.href=baseUrl+"index.html";
 //                $(".user_id").val(in1);
 //            }else{
 //                alert(json.msg);
 //            }
 //        });
 //    }
 // }