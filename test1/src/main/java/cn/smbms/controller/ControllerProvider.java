package cn.smbms.controller;

import cn.smbms.pojo.Provider;
import cn.smbms.service.IProviderService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ControllerProvider {

    @Autowired
    private IProviderService service;

    ModelAndView mv = new ModelAndView();

    //查询全部供应商信息
    @RequestMapping("/providerList")
    public ModelAndView providerList() {
        List<Provider> provider = service.getProvider();
        mv.addObject("provider", provider);
        mv.setViewName("billUpdate");
        return mv;
    }


    //点击查看    Provider getProCode(Provider proCode);
    @RequestMapping("/providerView/{proCode}")
    public ModelAndView getProCode(@PathVariable("proCode") String proCode) {
        Provider Code = service.getProCode(proCode);
        mv.addObject("proCode", Code);
        mv.setViewName("providerView");
        return mv;
    }


    /*  //判断是否存在供应商编码
    Integer getIntProCode(String proCode);*/
    @RequestMapping("/getAddPro")
    @ResponseBody
    public int getIntProCode(String proCode) {
        Integer intProCode = service.getIntProCode(proCode);
        return intProCode;
    }

    /*   //添加数据
    Provider getAddProvider(Provider provider);*/
    @RequestMapping("/getAddProvider")
    public ModelAndView getAddProvider(Provider provider) {
        Integer addProvider = service.getAddProvider(provider);
        mv.setViewName("redirect:/getProviderByPage");
        return mv;
    }

    /* //修改进入
    Provider getUpdProCode(String proCode);
*/
    @RequestMapping("/getUpdProCode/{proCode}")
    public ModelAndView getUpdProCode(@PathVariable("proCode") String proCode) {
        Provider updProCode = service.getUpdProCode(proCode);
        mv.addObject("provider", updProCode);
        mv.setViewName("providerUpdate");
        return mv;
    }

    /*   //修改
    Integer getUpdProvider(Provider provider);*/
    @RequestMapping("/getUpdProvider")
    public String getUpdProvider(Provider provider) {
        Integer updProvider = service.getUpdProvider(provider);
        return "redirect:/getProviderByPage";
    }

    /*  //删除
     Integer getDelPro(String proCode);*/
    @RequestMapping("/getDelPro/{proCode}")
    public String getDelPro(@PathVariable("proCode") String proCode) {
        Integer del = service.getDelPro(proCode);
        return "redirect:/getProviderByPage";
    }


/*    //分页
    @RequestMapping("/getProviderByPage")
    public ModelAndView getAddPage(ModelAndView mv, @RequestParam(value = "pageNum", required = true, defaultValue = "1") Integer pageNum,
                                          @RequestParam(value = "pageSize", required = true, defaultValue = "8") Integer pageSize) {
        List<Provider> all = service.getAll(pageNum, pageSize);
        PageInfo info=new PageInfo<>(all,5);
        int pages= info.getList().size()%5==0?info.getList().size()/5:info.getList().size()/5+1;
        mv.addObject("info", info);
        mv.setViewName("providerList");
        return mv;
    }*/

    //分页
    @RequestMapping("/getProviderByPage")
    public ModelAndView getProviderByPage(ModelAndView mv, @RequestParam(value = "pageNum", required = true, defaultValue = "1") Integer pageNum,
                                          @RequestParam(value = "pageSize", required = true, defaultValue = "8") Integer pageSize) {
        List<Provider> all = service.getAll(pageNum, pageSize);
        PageInfo info=new PageInfo<>(all,5);
        mv.addObject("info", info);
        mv.setViewName("providerList");
        return mv;
    }
    /*
    //查询
   List<Provider> getProList(String proName);
*/
    @RequestMapping("/getProList")
    public ModelAndView getProList(String proName, @RequestParam(value = "pageNum", required = true, defaultValue = "1") Integer pageNum,
                                   @RequestParam(value = "pageSize", required = true, defaultValue = "8") Integer pageSize) {
        List<Provider> proList = service.getProList(proName,pageNum,pageSize);
        PageInfo info=new PageInfo<>(proList,5);
        mv.addObject("info", info);
        mv.setViewName("providerList");
        return mv;
    }




}
