package oademo.biz;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class MailBizTest {
	@Autowired
	MailBiz maildb;
	@Test
	public void testReceiveEmaiList() {
		System.out.println(maildb.receiveEmaiList(2, "王刚", null, null, 0, 0, 10));
	}

	@Test
	public void testSentEmaiList() {

		System.out.println(maildb.sentEmaiList(3, "王刚", "李芳", null, 0, 0, 10));
	}

	@Test
	public void testFindMailsRows() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindById() {
		System.out.println(maildb.findById(1));
	}

}
