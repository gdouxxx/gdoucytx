package com.controller;
import com.pojo.User;
import com.service.UserService;
import com.utils.RandomValidateCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;


import javax.naming.AuthenticationException;
import javax.security.auth.Subject;
import javax.servlet.ServletException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static com.utils.GetSMS.randNum;


@Controller
@RequestMapping("/user")

//这里用了@SessionAttributes，可以直接把model中的user(也就key)放入其中
//这样保证了session中存在user这个对象
@SessionAttributes("user")
public class UserController {

    @Autowired
    private UserService userService;

    //正常访问index页面
    @RequestMapping("/index")
    public String index() {
        return "/user/index";
    }

    //正常访问login页面
    @RequestMapping("/login")
    public String login() {
        return "/user/login";
    }

    //正常访问register页面
    @RequestMapping("/register")
    public String register() {
        return "/user/register";
    }

    /**
     * 用户登录
     *
     * @param model
     * @param request
     * @param session
     * @param response
     * @param user
     * @return
     */
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    public String userLogin(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response, User user) {
        String inputVerifyCode = request.getParameter("verifyCode");
        String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");
        if (verifyCodeValue.equals(inputVerifyCode.toUpperCase())) {
            User u = userService.checkLogin(user.getUsername(), user.getPassword());

            if (u == null) {
                model.addAttribute("errorInfo", "用户名或密码错误！");
                return "user/login";
            } else {
                if (u.getUserId() != null && !"".equals(u.getUserId())) {
                    //登录成功
                    //***************判断用户是否勾选了自动登录*****************
                    String autoLogin = request.getParameter("autoLogin");
                    if ("autoLogin".equals(autoLogin)) {
                        //要自动登录
                        //创建存储用户名的cookie
                        Cookie cookie_username = new Cookie("cookie_username", user.getUsername());
                        cookie_username.setMaxAge(10 * 60);
                        //创建存储密码的cookie
                        Cookie cookie_password = new Cookie("cookie_password", user.getPassword());
                        cookie_password.setMaxAge(10 * 60);
                        response.addCookie(cookie_username);
                        response.addCookie(cookie_password);
                    }
                    //将user对象存到session中
                    session.setAttribute("user", u);
                    return "user/index";
                }
                model.addAttribute("errorInfo", "用户名id为空！");
                return "user/login";
            }
        } else {
            model.addAttribute("errorInfo", "验证码错误！");
            return "user/login";
        }
    }

    /**
     * 获取生成验证码显示到 UI 界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    /**
     * //     * 登录页面生成验证码
     * //
     */
//    @RequestMapping(value = "/getVerify")
//    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
//        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
//        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
//        response.setHeader("Cache-Control", "no-cache");
//        response.setDateHeader("Expire", 0);
//        RandomValidateCode randomValidateCode = new RandomValidateCode();
//        try {
//            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    //表单提交过来的路径
//    @RequestMapping("/checkLogin")
//    public String checkLogin(User user,HttpServletRequest request){
//
//        //调用service方法
//        user = userServivce.checkLogin(user.getUsername(), user.getPassword(), request);
//        //若有user则添加到model里并且跳转到成功页面
//        if(user != null){
//
//            return "/user/index";
//        }
//        return "/user/login";
//    }

//    //表单提交过来的路径
//    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
//    public String checkLogin(Model model, String inputStr, User user, HttpServletRequest request) {
//        ;
//        String random = (String) request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
//        //调用service方法
//        System.out.print(inputStr+"————————————————————————————————————");
//        user = userServivce.checkLogin(user.getUsername(), user.getPassword(), request);
//        try {
//            if (random.equals(inputStr)){
//                System.out.print(inputStr+"--------------------------------------------------------------------------------------");
//                if (user != null) {
//                    model.addAttribute("user", user);
//                    return "user/index";
//
//                }
//                model.addAttribute("error", "用户名或密码错误");
//                return "redirect:/";
//            } else {
//                model.addAttribute("error", "验证码错误");
//                return "redirect:/";
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            model.addAttribute("error", "我就执行了最后的部分气不气");
//            return "redirect:/";
//       }
//     return "1";
//         }

    //手机号登陆提交的表单和逻辑处理
    @RequestMapping(value = "/checkPhoneLogin", method = RequestMethod.POST)
    public String userPhoneLogin(Model model, HttpServletRequest request, HttpSession session, HttpServletResponse response) {
        String numCodeValue = randNum;


        String inputNumCode = request.getParameter("numCode");
        String phone = request.getParameter("phonenum");
        if (numCodeValue.toUpperCase().equals(inputNumCode.toUpperCase())) {
            User u = userService.checkPhoneLogin(phone);

            if (u == null) {
                model.addAttribute("errorInfo", "手机号未注册！");
                return "user/login";
            } else {

                //将user对象存到session中
                session.setAttribute("user", u);
                return "user/index";

            }
        } else {
            model.addAttribute("errorInfo", "验证码错误！");
            return "user/login";
        }
    }


    //注册用户提交的交单和逻辑处理
    @RequestMapping(value = "/checkRegister", method = RequestMethod.POST)
    public String userRegister(Model model, HttpServletRequest request, HttpServletResponse response) {
        String numCodeValue = randNum;
        String inputUsername = request.getParameter("username");
        String inputNumCode = request.getParameter("numCode");
        String inputPassword = request.getParameter("password");
        String inputEmail = request.getParameter("email");
        String phone = request.getParameter("phonenum");

        if(numCodeValue.toUpperCase().equals(inputNumCode.toUpperCase())){
            User u = userService.checkPhoneLogin(phone);

            if(u!=null){
                model.addAttribute("errorInfo","手机号已注册！");
                return "user/register";
            }else {
                User u1=userService.checkIsUsername(inputUsername);
                //将user对象存到session中
                if(u1!=null){
                    model.addAttribute("errorInfo","用户已注册！");
                    return "user/register";
                }else {
        User u2 = new User();
        u2.setPassword(inputPassword);
        u2.setUsername(inputUsername);
        u2.setEmail(inputEmail);
        u2.setPhone(phone);
        userService.addUser(u2);
        return "user/login";
    }



            }
        }else{
            model.addAttribute("errorInfo","验证码错误！");
            return "user/register";
        }

    }




}