package com.dao;

import com.pojo.User;

import java.util.List;


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

      //删除用户通过ID
      int deleteUser(Integer userId);

      //查询所有用户
      List<User> queryAllUser();


      //查询用户
      User queryUser(Integer userId);

      //修改用户
      int updateUser(User user);
}
