package cn.smbms.service;

import cn.smbms.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IUserService {
    User getUser(String userName, String pwd);

    //用户管理
    List<User> getUserList();

    //查询用户
    List<User> getUserName(String userName,Integer pageNum,Integer pageSize);

    //指定用户查询
    User getUserAssignName(String userName);

    //修改用户信息
    User getUpdUserName(String userCode);

    //修改用户点击保存
    Integer getUpdUser(User user);

    //验证userCoed唯一
    Integer getUserCode(String userCode);

    //添加用户
    Integer getAddUser(User user);
    //删除
    Integer getDelUser(String userCode);
    //修改密码
    Integer getUpdPassword(String userCode,String userPassword);

    //判断旧密码
    Integer getPwdContrast(String userCode,String userPassword);

    //分页
    List<User> getAll(Integer pageNum,Integer pageSize);
}
