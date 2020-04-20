package oademo.biz;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@ContextConfiguration("classpath:spring-beans.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class ScheduleBizTest {

	@Autowired
	ScheduleBiz schedule;
	@Test
	public void testGetAll() {
		fail("Not yet implemented");
	}

	@Test
	public void testFindAll() {
		schedule.findAll().forEach(x->System.out.println(x));
	}

	@Test
	public void testFindById() {
  
	}

	@Test
	public void testFindByIdTitle() {
		fail("Not yet implemented");
	}

	@Test
	public void testAdd() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() throws ParseException {

                 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				 Date now = new Date();
				 SimpleDateFormat ds = new SimpleDateFormat("yyyy-MM-dd ");
				 Date startTime = df.parse(ds.format(now) +"18:00:00");

System.out.println(startTime);

	}



	@Test
	public void testFetchscheduleRows() {
		System.out.println(schedule.fetchscheduleRows(0, null));
	}

}
