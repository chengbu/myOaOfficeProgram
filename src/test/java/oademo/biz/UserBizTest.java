package oademo.biz;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class UserBizTest {
	@Autowired
	private UserBiz user;

	@Test
	public void testCheckLogin() {
		System.out.println(user.username(null));
		System.out.println(user.username("王"));
	}

	@Test
	public void testUserList() {
		fail("Not yet implemented");
	}

	@Test
	public void testCheckusername() {
		System.out.println(user.checkusername(1));
		System.out.println(user.checkusername(5));

	}

}
