<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>畅游天下注册</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/register.css">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>

</head>
<body>

<!--<div class="top">
      <ul>
          <li><a href="index.html">返回首页</a></li>
          <li><a href="#">联系我们</a></li>
      </ul>
  </div>-->
<div class="container">
    <div class="logo">
        <div class="logo-img">
            <img src="../../../images/logo_1.jpg">
        </div>
        <div class="logo-nav">
            <ul>
                <li><a href="${pageContext.request.contextPath }/user/index">返回首页</a></li>
                <li><a href="#">联系我们</a></li>
            </ul>
        </div>
        <div class="login">已经有畅游天下账号了？<a href="${pageContext.request.contextPath }/user/login">立即登录</a></div>
    </div>
</div>

<div class="register container">
    <div class="register-l">
        <div class="form-reg">
            <form action="${pageContext.request.contextPath }/user/checkRegister" method="post" id="myform-register" >
                <table>
                    <tr>
                        <td class="txt">用户名</td>
                        <td><input type="text" id="username" name="username"  onkeyup="checkusername();" placeholder="请输入用户名"></td>
                        <td><span id="userMsg" style="margin-left: 15px;"></span>
                            <font color="#999999"></font></td>
                    </tr>
                    <tr>
                        <td class="txt">登录密码</td>
                        <td><input type="password" id="password" name="password" onkeyup="checkpassword();" placeholder="请输入密码"></td>
                        <td><span id="passwordMsg" style="margin-left: 15px;"></span>
                            <font color="#999999"></font></td>
                    </tr>
                    <tr>
                        <td class="txt">确认密码</td>
                        <td><input type="password" id="rpassword" name="rpassword" onkeyup="checkrpassword();" placeholder="确认密码"></td>
                        <td><span id="checkMsg" style="margin-left: 15px;"></span>
                            <font color="#999999"></font></td>
                    </tr>
                    <tr>
                        <td class="txt">邮箱</td>
                        <td><input type="email" name="email"  id="email" onkeyup="checkemail();" placeholder="邮箱"></td>
                        <td><span id="emailMsg" style="margin-left: 15px;"></span>
                            <font color="#999999"></font></td>

                    </tr>
                    <tr>
                        <td class="txt">手机号码</td>
                        <td><input type="text" name="phonenum" id="phonenum" onkeyup="checkphone();"  placeholder="手机号"></td>
                        <td><span id="phonedMsg" style="margin-left: 15px;"></span>
                            <font color="#999999"></font></td>
                    </tr>
                    <tr>
                        <td class="txt">验证码</td>
                        <td><input type="txt" name="numCode" id="yzm" onkeyup="checkyzm();" placeholder="请输入验证码">
                            <input type="button" name="yz"  id="yz" class="btn btn-primary" style="width: 30%;"  value="获取验证码" onclick="sendMessage()"></td>
                        <td><span id="yzmdMsg" style="margin-left: 15px;"></span>
                            <font color="#999999"></font></td>
                    </tr>
                </table>
                <input type="submit" class="btn btn-primary" id="register" value="立即注册"></input>
                <input type="reset" class="btn btn-primary" name="reset" id="reset" value="重置"></input>
            </form>
        </div>
    </div>

    <div class="register-r" id="register-r">
        <h5>注册成为畅游天下用户后，您可以：</h5>
        <ul>
            <li>畅游全国所有景点</li>
            <li>第一时间获取最新攻略信息</li>
            <li>轻松管理订单</li>
            <li>规划最省钱、最质量的行程</li>
        </ul>
    </div>
</div>


<script type="text/javascript">
    $(document).ready(function(){
        var ordertime=20   //设置再次发送验证码等待时间
        var timeleft=ordertime
        var btn=$("#yz")
        var phone=$("#phonenum")
        var reg = /^1[0-9]{10}$/;  //电话号码的正则匹配式
        btn.attr("disabled",true)

        phone.keyup(function(){
            if (reg.test(phone.val())){

                if (timeleft == 20) {
                    btn.removeAttr("disabled")
                }
            }
            else{
                btn.attr("disabled",true)
            }
        })

        //计时函数
        function timeCount(){
            timeleft-=1
            if (timeleft>0){
                btn.val(timeleft+" 秒后重发");
                setTimeout(timeCount,1000)
            }
            else {
                btn.val("重新发送");
                timeleft=ordertime   //重置等待时间
                btn.removeAttr("disabled");
            }
        }

        //事件处理函数
        btn.on("click",function(){
            $(this).attr("disabled",true); //防止多次点击
            //此处可添加 ajax请求 向后台发送 获取验证码请求
            timeCount(this);
        })
    });

    var sms="";
    $("#yz").click(function(){
        var phonenum=$("#phonenum").val();
        if(phonenum!="")
        {
            $.ajax({
                url:"sendSMS",
                type:"post",
                data:{"phonenum":phonenum},
                success:function(result){
                    sms=result;
                }
            });
        }else{
            alert("请输入手机号");
            return false;
        }

    });

</script>

<!--<script type="text/javascript">
    window.onload=function(){
      var reg = document.getElementById("register-r");

      if ( document.body.clientWidth < 900) {
          reg.style.display = 'none';
      }
    }
</script>-->

</body>
</html>
