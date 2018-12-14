<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>畅游天下登录</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css">
    <script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/login.js"></script>
    <script type="text/javascript">
        function changeImg(obj){
            obj.src="${pageContext.request.contextPath }/getImage?time="+new Date().getTime();
        }
    </script>
</head>
<body>

<div class="top">
    <ul>
        <li><a href="${pageContext.request.contextPath }/user/index">返回首页</a></li>
        <li><a href="#">联系我们</a></li>
    </ul>
</div>


<div class="box">
    <div class="header">
        <ul id="myTab" class="nav nav-tabs">
            <li class="active"><a href="#login" data-toggle="tab">登录</a></li>
            <li><a href="#duanxin" data-toggle="tab">短信登录</a></li>
        </ul>
    </div>
    <c:if test="${errorInfo!=null}">${errorInfo}</c:if>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="login">

            <form action="${pageContext.request.contextPath }/user/checkLogin" method="post" id="myform-login">
                <input type="text" id="username_txt" name="username" class="form-control" placeholder="请输入用户名">
                <span class="errorTips"></span>
                <input type="password" id="password_txt" name="password" class="form-control" placeholder="请输入密码">
                <span class="errorTips"></span>

                <!--验证码 -->
                <div class="yzcode" id="yzcode">
                    <div class="codetxt">
                        <input type="txt" id="checks" class="form-control" placeholder="请输入验证码" name="verifyCode">


                    </div>
                    <%--<div class="coderd" id="login-code"></div>--%>
                    <%--<div class="shuaxin" onclick="show()"><img src="<%=basePath%>images/shuaxin.png"></div>--%>
                    <div class="col-sm-3">
                        <img src="/user/getImage" alt="" width="100" height="32" class="imgVerify" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">
                    </div>
                </div>
                <span class="errorTips" id="msg"></span>

                <div id="zidong">
                    <input name="" type="checkbox" name="aut oLogin" value="" checked><span>下次自动登录</span>
                    <a href="#">忘记密码？</a>
                </div>
                <button type="submit" class="btn btn-primary" id="user/login">登录</button>
            </form>
            <div class="register"><p>还没有账号？<a href="${pageContext.request.contextPath }/user/register">立即注册</a></p></div>

        </div>

        <!--短信登录 -->
        <div class="tab-pane fade" id="duanxin">
            <form action="${pageContext.request.contextPath }/user/checkPhoneLogin" method="post" id="myform-duanxin">
                <c:if test="${loginInfo!=null}">${loginInfo}</c:if>
                <input type="text" id="phonenum" name="phonenum" class="form-control" placeholder="请输入手机号码">
                <span class="errorTips"></span>
                <div class="yanzheng">
                    <input type="txt" class="form-control" id="txt_yzm" name="numCode" placeholder="请输入验证码">
                    <span><input type="button" name="yz" class="btn btn-primary" id="yz"  value="获取验证码" onclick="sendMessage()"></span>
                </div>
                <span class="errorTips"></span>
                <button type="submit" class="btn btn-primary" id="denglu2">登录</button>
            </form>
            <div class="register"><p>还没有账号？<a href="<%=basePath%>/user/register">立即注册</a></p></div>
        </div>
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




</body>
</html>
