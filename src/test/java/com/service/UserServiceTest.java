package com.service;

import com.dao.UserDao;
import com.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"
})

public class UserServiceTest {

    @Autowired
    private UserService userService;

    @Test
    public void checkPhoneLogin() {
        User user=userService.checkPhoneLogin("13420121762");
        System.out.print(user);
    }

    @Test
    public void addUser(){
        User u2 = new User();
        u2.setPassword("123456");
        u2.setUsername("123456");
        u2.setEmail("23455@qq.com");
        u2.setPhone("13420124037");
        int user =userService.addUser(u2);
        System.out.print(user+"----------------------------------------------");
    }

}
