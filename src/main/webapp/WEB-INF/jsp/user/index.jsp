<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>畅游天下主页</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/index.css">
    <script type="text/javascript" src="../js/index.js"></script>

</head>
<body>
<!--欢迎框 -->
<div class="wellcome" id="wellcome">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您好，<span class="user_id">xxx</span>，欢迎来到畅游天下</div>


<!--logo部分 -->
<div class="logo">
    <div class="logo-both">
        <div class="logo-l"><span><img src="../images/logo.png"><span></span></div>
        <div class="logo-c">
            <input type="text" class="serch" placeholder="请输入...">
            <button class="btn">搜索</button>
        </div>
    </div>
    <div class="logo-r">
        <img src="../images/phone.png"><span><p>咨询热线</p><h4 style="color: blue;font-size: 26px;">134201xxxxx</h4></span>
    </div>
    <div class="clear"></div>
</div>


<!--nav部分 -->
<div class="nav">
    <nav class="navbar navbar-default" id="nav_daohang">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span></button>
            </div>
            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav navbar-right" style="padding: 0px;">
                    <li class="active"><a href="index.html"><span class="glyphicon glyphicon-home"></span>首页</a></li>
                    <li class="dropdown"><a href="infomation.html"><span class="glyphicon glyphicon-th-list"></span>最新资讯</a>
                        <ul class="dropdown-content">
                            <li><a href="#">凤凰古城</a></li>
                            <li><a href="#">北京故宫</a></li>
                            <li><a href="#">云南大理</a></li>
                            <li><a href="#">武汉樱花</a></li>
                            <li><a href="#">四川美食</a></li>
                            <li><a href="#">港澳风情</a></li>
                        </ul>
                    </li>
                    <li><a href="strategy.html"><span class="glyphicon glyphicon-fire"></span>热门攻略</a>
                    <li><a href="route.html"><span class="glyphicon glyphicon-flag"></span>特价路线</a></li>
                    <li><a href="person.html"><span class="glyphicon glyphicon-user"></span>个人中心</a></li>
                    <li><a href="collection.html"><span class="glyphicon glyphicon-heart"></span>我的收藏</a></li>
                    <li><a href="login.html"><span class="glyphicon glyphicon-star"></span>登录/注册</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>


<!--轮播图 -->
<div class="lunbo">

    <div class="row">
        <div class="lun">
            <div id="myCarousel" class="carousel slide">
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="item active lunbo-img">
                        <a href="#"><img src="../images/l-1.jpg"></a>
                    </div>
                    <div class="item lunbo-img">
                        <a href="#"><img src="../images/l-2.jpg"></a>
                    </div>
                    <div class="item lunbo-img">
                        <a href="#"><img src="../images/l-1.jpg"></a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- <div id="list">
    <div id="list-l" class="list-l" onmouseover="display()" onmouseout="hid()">
       <table class="list-table">
           <tr class="active">
               <td id="pictrue"><img src="../icon/release.png" alt="" ></span></td>
               <td id="cont"><a href="#">休闲度假</a><img src="../icon/right.png"></td>
           </tr>
           <tr>
               <td id="pictrue"><img src="../icon/spot.png"></td>
               <td id="cont"><a href="#">热门景点</a><img src="../icon/right.png"></td>
           </tr>
           <tr>
               <td id="pictrue"><img src="../icon/beach.png"></td>
               <td id="cont"><a href="#">情侣蜜游</a><img src="../icon/right.png"></td>
           </tr>
           <tr>
               <td id="pictrue"><img src="../icon/account.png"></td>
               <td id="cont"><a href="#">毕业旅行</a><img src="../icon/right.png"></td>
           </tr>
           <tr>
               <td id="pictrue"><img src="../icon/changyou.png"></td>
               <td id="cont"><a href="#">畅游港澳台</a><img src="../icon/right.png"></td>
           </tr>
       </table>
    </div>
    <div id="list-r" class="list-r" onmouseover="display()" onmouseout="hid()" style="display: none;">333</div>
</div>-->


<!--消息滚动 -->
<!--<div class="gundong">
    <div class="box1">
    <div class="manyi container"><img src="../icon/赞.png" alt="" style="width: 30px;height: 30px;"><span style="display: block;float: right; margin-top: 3px;margin-right: 1px;">满意度<span style="color: red;font-size: 20px;padding-left: 0px;">98%</span></span></div>
    <div class="content" id="scrollBox" style="overflow: hidden;text-align: left;">
        <ul id="con1">
            <li> 四川--九寨沟--云南大理西双版纳双人三日游</li>
            <li>香港--九龙--迪士尼乐园三日游</li>
            <li>广州--广州塔--广州的小蛮腰</li>
        </ul>
         <div id="con2" style="text-align: left"></div>
    </div>
   </div>
</div>-->




<!--资讯部分 -->
<!--分割线 -->
<div class="line">
    <div class="middle-line">
        <span class="line-text">最新资讯</span>
    </div>
</div>
<div id="hot-infomation">
    <div class="infomation_l">
        <div class="img"><img src="../images/l-5.jpg" alt=""></div>
        <div class="title">欢乐海洋之旅</div>
        <div class="content">带你玩转秦皇岛、山海关、南戴河，惊爆价出游</div>
        <div class="money"><img src="../icon/rmb.png" id="rmb"><span id="sum">99.9元</span></div>
    </div>

    <div class="infomation_c">
        <div class="img"><img src="../images/l-5.jpg" alt=""></div>
        <div class="title">欢乐海洋之旅</div>
        <div class="content">带你玩转秦皇岛、山海关、南戴河，惊爆价出游</div>
        <div class="money"><img src="../icon/rmb.png" id="rmb"><span id="sum">99.9元</span></div>
    </div>

    <div class="infomation_r">
        <div class="img"><img src="../images/l-5.jpg" alt=""></div>
        <div class="title">欢乐海洋之旅</div>
        <div class="content">带你玩转秦皇岛、山海关、南戴河，惊爆价出游</div>
        <div class="money"><img src="../icon/rmb.png" id="rmb"><span id="sum">99.9元</span></div>
    </div>
</div>

<!--攻略部分 -->
<!--分割线 -->
<div class="line">
    <div class="middle-line">
        <span class="line-text">热门攻略</span>
    </div>
</div>
<div id="hot-strategy" onmouseover ="return Checkover()" onmouseout="return Checkout()">
    <div id="strategy_1" onmouseover="disp()"; onmouseout="hid();">
        <div id="title">
            <h3>繁华香港</h3>
            <p id="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;石板街上老旧的小摊，叮叮车里质朴的香港人，都爹利街里上演的浪漫依旧。如果你肯放慢脚步，你就能发现另一个不一样的香港城。</p>
        </div>
        <div id="check" style="display: none;"><button id="chenkinfomation">查看详情</button></div>
    </div>
    <div id="strategy_2">
        <div id="title">
            <h3>繁华香港</h3>
            <p id="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;石板街上老旧的小摊，叮叮车里质朴的香港人，都爹利街里上演的浪漫依旧。如果你肯放慢脚步，你就能发现另一个不一样的香港城。</p>
        </div>
        <div id="check"><button id="chenkinfomation">查看详情</button></div>
    </div>
    <div id="strategy_3">
        <div id="title">
            <h3>繁华香港</h3>
            <p id="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;石板街上老旧的小摊，叮叮车里质朴的香港人，都爹利街里上演的浪漫依旧。如果你肯放慢脚步，你就能发现另一个不一样的香港城。</p>
        </div>
        <div id="check"><button id="chenkinfomation">查看详情</button></div>
    </div>
    <div id="strategy_4">
        <div id="title">
            <h3>繁华香港</h3>
            <p id="introduce">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;石板街上老旧的小摊，叮叮车里质朴的香港人，都爹利街里上演的浪漫依旧。如果你肯放慢脚步，你就能发现另一个不一样的香港城。</p>
        </div>
        <div id="check"><button id="chenkinfomation">查看详情</button></div>
    </div>
</div>
<div class="toTop">
    <a href="#wellcome"><span class="glyphicon glyphicon-chevron-up"></span></a>
</div>



<!--底部部分 -->
<div class="foot">
    <hr style="height:1px;border:none;border-top:1px solid gray;" />
    <div>
        <table>
            <tr>
                <th>关于畅游天下</th>
                <th>有话要说</th>
                <th>服务保障</th>
            </tr>
            <tr>
                <td><a href="#">帮助中心</a></td>
                <td><a href="#">客服热线</a></td>
                <td><a href="#">隐私政策</a></td>
            </tr>
            <tr>
                <td><a href="#">法律声明</a></td>
                <td><a href="#">我要投诉</a></td>
                <td><a href="#">争议调解</a></td>
            </tr>
        </table>
    </div>
    <div class="footer">
        <p>Copyright © 2018-2019 Changyou.com | <a href="#">营业执照</a> | ICP证：xxxxxxxxxx | xxxxxxxxxxx | xxxxxxxxxx</p>
        <p>违法和不良信息举报电话：xxx-xxxxxxxx 违法和不良信息举报邮箱：xxxxxxx@xxxxxx.com</p>
    </div>
</div>



<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
    //$(function(){
    //自动播放
    $('#myCarousel').carousel({
        interval:4000,
        wrap:true
    });
</script>

</body>
</html>
