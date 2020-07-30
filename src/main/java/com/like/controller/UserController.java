package com.like.controller;

import com.github.pagehelper.PageInfo;
import com.like.entity.Page;
import com.like.entity.User;
import com.like.entity.VoUser;
import com.like.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("users")
    @ResponseBody
    //返回分页对象进行数据分页展示
    public Page select(@RequestParam(defaultValue = "1") Integer page,Integer limit ) {
//        Integer pageNum = 2;//一页展示2条
//        ModelAndView mv = new ModelAndView();
        System.out.println(page+limit);
        //查询分页数据
        PageInfo<User> pageInfo = userService.queryUser(page, limit);
        //返回存储在request域数据中
//        mv.addObject("pageInfo", pageInfo);
        Page pageList = new Page();
        pageList.setData(pageInfo.getList());
        pageList.setCount(pageInfo.getTotal());
        pageList.setCode(0);
        pageList.setMsg("查询失败");
        //返回给任何前端技术
        //返回给LayUI是json字符串
        return pageList;
    }

    @PostMapping("/user")
    @ResponseBody
    //获取请求参数和响应json字符串
    public VoUser insert(User user) {
        System.out.println(user);
        Integer integer = userService.insertUser(user);
        return new VoUser("添加成功");
    }

    @GetMapping("/selectId/{id}")
    @ResponseBody
    public User selectId(@PathVariable Integer id) {
        //通过json响应给异步请求
        return userService.selectId(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public VoUser updateId(User user) {
        Integer integer = userService.updateUser(user);
        return new VoUser("修改成功");
    }

    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public VoUser deleteId(@PathVariable Integer id) throws RuntimeException {
        Integer integer = userService.deleteId(id);
        return new VoUser("删除成功");
    }
}
