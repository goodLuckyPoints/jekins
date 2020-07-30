package com.like.dao;

import com.like.entity.User;

import java.util.List;

public interface UserDao {
    List<User> queryUserById();

    Integer insertUser(User user);

    User selectId(Integer id);

    Integer updateUser(User user);

    Integer deleteId(Integer id);
}
