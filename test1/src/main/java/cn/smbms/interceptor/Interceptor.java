package cn.smbms.interceptor;

import cn.smbms.pojo.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Interceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("进入拦截器");
        HttpSession session=request.getSession();
        User loginUser = (User) session.getAttribute("user");
        System.out.println(loginUser);
        if(loginUser==null){
            //没有用户登录，跳转到登录页面
            System.out.println("老子进入了没有啊1111");
            response.sendRedirect("login.jsp");
        }
        System.out.println("这里也来了吧22222222s");
        return true;

    }
}
