package com.service.impl;
import com.pojo.User;
import com.dao.UserDao;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
@SessionAttributes("user")
public class UserServiceImpl implements UserService {

    @Resource
    private UserDao userDao;

   
    /*
     * 检验用户登录业务
     *
     */
   
//    @Override
//    public User checkLogin(String username, String password,HttpServletRequest request) {
//         User user = userDao.findByUsername(username);
//         HttpSession session = request.getSession();
//        if(user != null && user.getPassword().equals(password)){
//            session.setAttribute("user", user);
//            return user;
//        }
//
//        return null;
//    }

    @Override
    public User checkLogin(String username, String password) {
        User user = userDao.findByUsername(username);
        if(user != null && user.getPassword().equals(password)){
            return user;
        }

        return null;
    }

    @Override
    public User checkPhoneLogin(String phone){
        User user = userDao.findUserByPhone(phone);
        if(user != null){
            return user;
        }

        return null;
    }

    @Override
    public User checkIsUsername(String username){
        User user = userDao.findByUsername(username);
        if(user != null){
            return user;
        }

        return null;
    }

    @Override
    public int addUser(User user){
        return userDao.addUser(user) ;
    }


    @Override
    public int deleteUser(Integer userId){return userDao.deleteUser(userId);}

    @Override
    public List<User> queryAllUser(){return userDao.queryAllUser();}

    @Override
    public User queryUser(Integer userId){return userDao.queryUser(userId);}

    @Override
    public  int updateUser(User user){return userDao.updateUser(user);}
}

