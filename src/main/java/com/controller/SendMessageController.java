package com.controller;

import com.utils.GetSMS;
import com.pojo.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.ByteArrayOutputStream;
import java.io.IOException;

import static com.utils.GetSMS.getmMssage;
import static com.utils.GetSMS.randNum;
import static com.utils.RandUtil.getRandomNum;

@Controller

public class SendMessageController {
    @RequestMapping(value = "user/sendSMS", method = RequestMethod.POST)
    public Void SendMS(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

        String numCodeValue = randNum;


        String inputNumCode = request.getParameter("numCode");
//        String inputPhoneNum = request.getParameter("phoneNum");
        String phone=request.getParameter("phonenum");


        String result = getmMssage(phone);
        System.out.print(numCodeValue + "---------------" + result + "--------------------------" + phone + "--------------" + inputNumCode);

        return null;
    }
}