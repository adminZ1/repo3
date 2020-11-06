package cn.smbms.service.impl;

import cn.smbms.dao.IUserDao;
import cn.smbms.pojo.User;
import cn.smbms.service.IUserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao dao;

    @Override
    public User getUser(String userName, String pwd) {
        return dao.getUser(userName, pwd);
    }

    //用户管理
    @Override
    public List<User> getUserList() {
        return dao.getUserList();
    }

    //查询用户
    public List<User> getUserName(String userName, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return dao.getUserName(userName);
    }

    @Override
    public User getUserAssignName(String userName) {
        return dao.getUserAssignName(userName);
    }

    @Override
    public User getUpdUserName(String userCode) {

        return dao.getUpdUserName(userCode);
    }

    @Override
    public Integer getUpdUser(User user) {
        return dao.getUpdUser(user);
    }

    @Override
    public Integer getUserCode(String userCode) {
        return dao.getUserCode(userCode);
    }

    @Override
    public Integer getAddUser(User user) {
        user.setCreationDate(new Date());
        return dao.getAddUser(user);
    }

    @Override
    public Integer getDelUser(String userCode) {
        return dao.getDelUser(userCode);
    }

    @Override
    public Integer getUpdPassword(String userCode, String userPassword) {
        return dao.getUpdPassword(userCode, userPassword);
    }

    @Override
    public Integer getPwdContrast(String userCode, String userPassword) {
        return dao.getPwdContrast(userCode, userPassword);
    }

    @Override
    public List<User> getAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return dao.getAll();
    }


}
