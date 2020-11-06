package cn.smbms.dao;

import cn.smbms.pojo.Provider;

import java.util.List;

public interface IProvider {
    //查询全部供应商信息
    List<Provider> getProvider();

    //点击查看
    Provider getProCode(String proCode);

    //查询
    List<Provider> getProList(String proName);

    //判断是否存在供应商编码
    Integer getIntProCode(String proCode);

    //添加数据
    Integer getAddProvider(Provider provider);

    //修改进入
    Provider getUpdProCode(String proCode);

    //修改
    Integer getUpdProvider(Provider provider);

    //删除
    Integer getDelPro(String proCode);

    //分页
    List<Provider> getAll();
}
