package cn.smbms.dao;

import cn.smbms.pojo.Bill;

import java.util.List;

public interface IBill {
    //查询全部
    List<Bill> getBillList();

    //指定查询
    List<Bill> getBillCondition(Bill bill);

    //查看信息
    Bill getBill(String billCode);

    //修改
    Bill billUpdate(String billCode);
}
