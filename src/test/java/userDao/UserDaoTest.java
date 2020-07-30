package userDao;

import com.like.dao.UserDao;
import com.like.entity.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

/**
 * 配置spring-test测试dao层可以进行自动注入
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-context.xml")
public class UserDaoTest {
    @Autowired
    private UserDao userDao;

    @Test
    public void test1() {
        List<User> users = userDao.queryUserById();
        System.out.println(users);
    }
    @Test
    public void test2(){
        System.out.println(userDao.updateUser(new User(1, "like", true, new Date())));
    }
    @Test
    public void test3(){
        userDao.insertUser(new User(null,"hello",false,new Date()));
    }
}
