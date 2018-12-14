// alert("nihao");
   /* window.onload = function(){

    	       //满意度滚动
                var area =document.getElementById('scrollBox');
                var con1 = document.getElementById('con1');
                var con2 = document.getElementById('con2');
                con2.innerHTML=con1.innerHTML;
                function scrollUp(){
                if(area.scrollTop>=con1.offsetHeight){
                    area.scrollTop=0;
                }else{
                    area.scrollTop++
                }
                }                
                var time = 50;
                var mytimer=setInterval(scrollUp,time);
                area.onmouseover=function(){
                    clearInterval(mytimer);
                }
                area.onmouseout=function(){
                    mytimer=setInterval(scrollUp,time);
                }
    }*/


    /*function $(id){
        return document.getElementById('id');
    }
    var o1 = $('strategy_1');
    var ocont = $('title');
    var obtn = $('check');*/
    
    var ohot;
    var o1;
    var ocont;
    var obtn;

window.onload = function(){
    ohot = document.getElementById("hot-strategy");
    o1 = document.getElementById("strategy_1");
    ocont = document.getElementById("title");
    obtn = document.getElementById("check");
};
    function Checkover(){
        var dis = disp();
        return dis;
    }

    function Checkout(){
        var hid = hid();
        return hid;
    }



    function disp(){
        obtn.style.display = 'block';
    }

    function hid(){
        obtn.style.display = 'none';
    }
    //alert("nihao");





    
 