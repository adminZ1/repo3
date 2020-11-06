package cn.smbms.controller;

import cn.smbms.pojo.User;
import cn.smbms.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.Request;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@SessionAttributes({"user"})
public class ControllerSuper {

    @Autowired
    private IUserService service;

    @RequestMapping("/login")
    public ModelAndView login(String username, String userPassword) {
        ModelAndView mv = new ModelAndView();
        User user = service.getUser(username, userPassword);
        if (user == null) {
            mv.setViewName("login");
        } else {
            mv.addObject("user", user);
            mv.setViewName("welcome");
        }

        return mv;
    }

    @RequestMapping("/userList")
    public ModelAndView userList() {
        ModelAndView mv = new ModelAndView();
        List<User> userlis = service.getUserList();
        mv.addObject("userList", userlis);
        mv.setViewName("userList");
        return mv;
    }

    //查询
    @RequestMapping("/userName")
    public ModelAndView userName(String userName,@RequestParam(value = "pageNum", required = true , defaultValue = "1") Integer pageNum,
                                 @RequestParam(value = "pageSize" , required = true , defaultValue = "8") Integer pageSize) {
        ModelAndView mv = new ModelAndView();
        List<User> userList = service.getUserName(userName,pageNum,pageSize);
        PageInfo info=new PageInfo<>(userList,5);
        mv.addObject("info", info);
        mv.setViewName("userList");
        return mv;
    }

    @RequestMapping("/AssiAssignName")
    public ModelAndView AssiAssignName(String userName) {
        ModelAndView mv = new ModelAndView();
        User user = service.getUserAssignName(userName);
        mv.addObject("userName", user);
        mv.setViewName("userView");
        return mv;
    }

    @RequestMapping("/userUpdate")
    public ModelAndView userUpdate(String userName) {
        ModelAndView mv = new ModelAndView();
        User user = service.getUpdUserName(userName);
        mv.addObject("user", user);
        mv.setViewName("userUpdate");
        return mv;
    }

    /*  //修改用户点击保存
    User getUpdUser(User user);*/
    @RequestMapping("/getUpdUser")
    public String getUpdUser(User user) {
        Integer user1 = service.getUpdUser(user);
        ControllerSuper c = new ControllerSuper();
        return "redirect:getUserByPage";
    }

    /*   //验证userCoed唯一
        User= getUserCode(String userCode);*/
    @RequestMapping("/getUserCode")
    @ResponseBody
    public Integer getUserCode(String userCode) {
        Integer result = service.getUserCode(userCode);
        return result;
    }

    /*//添加用户
    Integer getAddUser(User user);*/
    @RequestMapping("/getAddUser")
    public String getAddUser(User user) {
        Integer u = service.getAddUser(user);
        return "redirect:getUserByPage";
    }

    /*//删除
    Integer getDelUser(String userCode);*/
    @RequestMapping("/getDelUser/{userCode}")
    public String getDelUser(@PathVariable("userCode") String userCode) {
        Integer delUser = service.getDelUser(userCode);
        return "redirect:/getUserByPage";
    }

    /* //修改密码
     Integer getUpdPssword(String userCode,String userPassword);*/
    @RequestMapping("/getUpdPassword")
    public String getUpdPassword(String userCode, String userPassword) {
        Integer updPssword = service.getUpdPassword(userCode, userPassword);
        return "login";
    }

    /* //判断旧密码
     Integer getpwdContrast(String userCode,String userPassword);*/
    @RequestMapping("/getPwdContrast")
    @ResponseBody
    public int getPwdContrast(String userCode, String userPassword) {
        System.out.println("pwd====================================" + userPassword);
        Integer integer = service.getPwdContrast(userCode, userPassword);
        return integer;
    }

    //分页
    @RequestMapping("/getUserByPage")
    public ModelAndView getUserByPage(@RequestParam(value = "pageNum", defaultValue = "1", required = true) Integer pageNum,
                                @RequestParam(value = "pageSize", defaultValue = "8", required = true) Integer PageSize, ModelAndView mv) {
        List<User> userList = service.getAll(pageNum,PageSize);
        PageInfo info=new PageInfo(userList,5);
        mv.addObject("info",info);
        mv.setViewName("userList");
       return mv;
    }
}