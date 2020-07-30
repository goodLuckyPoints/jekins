package com.like.service;

import com.github.pagehelper.PageInfo;
import com.like.entity.User;

public interface UserService {
    PageInfo<User> queryUser(Integer currentPage, Integer pageNum);

    Integer insertUser(User user);

    User selectId(Integer id);

    Integer updateUser(User user);

    Integer deleteId(Integer id);
}
