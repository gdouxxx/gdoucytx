package com.service;
import com.pojo.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public interface UserService {

//    //检验用户登录
//    User checkLogin(String username, String password, HttpServletRequest request);
    //图形验证码，账号名，密码登陆的检验用户登录
    User checkLogin(String username, String password);

    //手机号登陆的验用户登录
    User checkIsUsername(String usename);

    //手机号登陆的验用户登录
    User checkPhoneLogin(String phone);

    //用户注册
    int addUser(User user);

}
