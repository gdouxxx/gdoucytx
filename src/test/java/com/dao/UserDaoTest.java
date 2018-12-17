package com.dao;



import com.pojo.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
        "classpath:spring/spring-dao.xml"
})

public class UserDaoTest {


    @Autowired
    private UserDao userDao;

    @Test
    public void findByUsername() {
        User user = userDao.findByUsername("zhangsan");
        System.out.print(user.getUserId()+"-----------------------------------------------------------------------------------------------------------------------------------------------"+user.getUsername());
    }

    @Test
    public void findUserByPhone() {
        User user = userDao.findUserByPhone("13420121762");
        System.out.print(user.getUsername()+"-----------------------------------------------------------------------------------------------------------------------------------------------"+user.getUsername());
    }

    @Test
    public void addUser() {
        User u = new User();
        u.setPassword("123");
        u.setUsername("123");
        u.setEmail("234");
        u.setPhone("123");
        int user =userDao.addUser(u);
        System.out.print(user);

    }

    @Test
    public void deleteUser()
    {
        int user =userDao.deleteUser(9);
        System.out.print(user);

    }

    @Test
    public void queryAllUser()
    {
        List<User> User = userDao.queryAllUser();
        System.out.print(User);

    }

    @Test
    public void queryUser()
    {
       User user= userDao.queryUser(4);
        System.out.print(user);

    }

    @Test
    public void updateUser()
    {
        User u1= userDao.queryUser(4);
        u1.setPassword("123456");
        int user= userDao.updateUser(u1);
        System.out.print(user);

    }


}
