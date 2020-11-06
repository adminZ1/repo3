package cn.smbms.controller;

import cn.smbms.pojo.Bill;
import cn.smbms.pojo.Provider;
import cn.smbms.service.IBillService;
import cn.smbms.service.IProviderService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ControllerBill {
    @Autowired
    private IBillService service;
    @Autowired
    private IProviderService proService;

    @RequestMapping("/billList")
    public ModelAndView billList(ModelAndView mv, @RequestParam(value = "pageNum", required = true, defaultValue = "1") Integer pageNum,
                                 @RequestParam(value = "pageSize", required = true, defaultValue = "8") Integer pageSize) {
        List<Bill> billList = service.getBillList(pageNum, pageSize);
        PageInfo info = new PageInfo<>(billList, 5);
        mv.addObject("info", info);
        List<Provider> provider = proService.getProvider();
        mv.addObject("provider", provider);
        mv.setViewName("billList");
        return mv;
    }

    @RequestMapping("/billCondiTion")
    public ModelAndView billCondiTion(ModelAndView mv, Bill bill
            , @RequestParam(value = "pageNum", defaultValue = "1", required = true) Integer pageNum
            , @RequestParam(value = "pageSize", required = true, defaultValue = "8") Integer pageSize) {
        List<Bill> billCondition = service.getBillCondition(bill, pageNum, pageSize);
        PageInfo info = new PageInfo<>(billCondition, 5);
        mv.addObject("info", info);
        mv.setViewName("billList");
        return mv;
    }

    @RequestMapping("/billView")
    public ModelAndView getBill(ModelAndView mv, String billCode) {
        Bill bill = service.getBill(billCode);
        mv.addObject("bill", bill);
        mv.setViewName("billView");
        return mv;
    }

    @RequestMapping("/billUpdate")
    public ModelAndView billUpdate(ModelAndView mv, String billCode) {
        Bill bill = service.billUpdate(billCode);
        mv.addObject("bill", bill);
        List<Provider> provider = proService.getProvider();
        mv.addObject("provider", provider);
        mv.setViewName("billUpdate");
        return mv;
    }

}
