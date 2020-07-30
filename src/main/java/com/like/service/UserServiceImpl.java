package com.like.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.like.dao.UserDao;
import com.like.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    //当前事务没开启，如果开启直接合并外部事务
    @Transactional(propagation = Propagation.SUPPORTS)
    public PageInfo<User> queryUser(Integer currentPage , Integer pageNum) {
        //分页查询后返回给controller，只返回给第一个查询
        PageHelper.startPage(currentPage,pageNum);
        //查询数据库进行分页处理
        List<User> users = userDao.queryUserById();
        return new PageInfo<User>(users);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED,
            timeout = 3,
            readOnly = false,
            isolation = Isolation.DEFAULT,
            rollbackFor = Exception.class)
    public Integer insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public User selectId(Integer id) {
        return userDao.selectId(id);
    }

    @Override
    public Integer updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public Integer deleteId(Integer id) throws RuntimeException {

        return userDao.deleteId(id);
    }
}
