package com.service;
import com.pojo.User;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


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

    //用户删除
    int deleteUser(Integer userId);

    //查询所有用户
    List<User> queryAllUser();

   //查询用户
    User queryUser(Integer userId);

    //修改用户
    int updateUser(User user);

}
