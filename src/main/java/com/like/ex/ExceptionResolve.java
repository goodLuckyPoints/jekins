package com.like.ex;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 异常解析器
 * 捕获所有handler抛出异常并抛到对应处理
 */
public class ExceptionResolve implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        e.printStackTrace();//打印堆栈跟踪信息
        ModelAndView mv = new ModelAndView();
        if (e instanceof RuntimeException) {
            mv.setViewName("redirect:/error.jsp");
        }
        return mv;
    }
}
