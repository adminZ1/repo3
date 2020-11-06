package cn.smbms.dao;

import cn.smbms.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface IUserDao {
    //登录操作
    User getUser(@Param("userName") String userName, @Param("pwd") String pwd);

    //用户管理
    List<User> getUserList();

    //查询用户
    List<User> getUserName(String userName);

    //指定用户查询
    User getUserAssignName(String userName);

    //点击修改用户信息传值
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
    Integer getUpdPassword(@Param("userCode")String userCode,@Param("userPassword") String userPassword);

    //判断旧密码
    Integer getPwdContrast(@Param("userCode") String userCode,@Param("userPassword") String userPassword);

    //分页
    List<User> getAll();

}
