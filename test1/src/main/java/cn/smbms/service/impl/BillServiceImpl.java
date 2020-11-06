package cn.smbms.service.impl;

import cn.smbms.dao.IBill;
import cn.smbms.pojo.Bill;
import cn.smbms.service.IBillService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BillServiceImpl implements IBillService {
    @Autowired
    private IBill dao;

    //查询全部
    @Override
    public List<Bill> getBillList(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return dao.getBillList();
    }


    @Override
    public List<Bill> getBillCondition(Bill bill, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return dao.getBillCondition(bill);
    }

    @Override
    public Bill getBill(String billCode) {
        return dao.getBill(billCode);
    }

    @Override
    public Bill billUpdate(String billCode) {
        return dao.billUpdate(billCode);
    }
}
