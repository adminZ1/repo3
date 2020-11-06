package cn.smbms.service.impl;

import cn.smbms.dao.IProvider;
import cn.smbms.pojo.Provider;
import cn.smbms.service.IProviderService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ProviderServideImpl implements IProviderService {
    @Autowired
    private IProvider dao;

    @Override
    public List<Provider> getProvider() {
        return dao.getProvider();
    }

    @Override
    public Provider getProCode(String proCode) {
        return dao.getProCode(proCode);
    }

    /* //查询
    List<Provider> getProList(String proName);*/
    @Override
    public List<Provider> getProList(String proName ,Integer pageNum,Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return dao.getProList(proName);
    }

    //判断是否存在供应商编码
    @Override
    public Integer getIntProCode(String proCode) {
        return dao.getIntProCode(proCode);
    }

    @Override
    public Integer getAddProvider(Provider provider) {
        provider.setCreationDate(new Date());

        return dao.getAddProvider(provider);
    }

    @Override
    public Provider getUpdProCode(String proCode) {
        return dao.getUpdProCode(proCode);
    }

    @Override
    public Integer getUpdProvider(Provider provider) {
        return dao.getUpdProvider(provider);
    }

    @Override
    public Integer getDelPro(String proCode) {
        return dao.getDelPro(proCode);
    }

    @Override
    public List<Provider> getAll(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        return dao.getAll();
    }

}
