package cn.smbms.service;

import cn.smbms.pojo.Bill;

import java.util.List;

public interface IBillService {
    //查询全部
    List<Bill> getBillList(Integer pageNum, Integer pageSize);

    //指定查询
    List<Bill> getBillCondition(Bill bill,Integer pageNum,Integer pageSize);

    //查看信息
    Bill getBill(String billCode);

    //修改
    Bill billUpdate(String billCode);
}
