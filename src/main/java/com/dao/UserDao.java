package com.dao;

import com.pojo.User;



public interface UserDao {
    /**
     * 登陆验证
     * 通过名字找到用户
     * @param username
     * @param password
     * @return
     */
   User findByUsername(String username);

    /**
     * 登陆验证
     * @param phone

     * @return
     */
    User findUserByPhone(String phone);

    /**
    * 用户注册
     * @param user

     * @return  email
             */
//    User addUser(User user);
      int addUser(User user);

}
