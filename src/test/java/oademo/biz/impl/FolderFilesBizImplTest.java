package oademo.biz.impl;

import static org.hamcrest.CoreMatchers.nullValue;
import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Commit;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import oademo.biz.FolderFilesBiz;
import oademo.entity.FolderFiles;
@ContextConfiguration("classpath:spring-beans.xml")//@ContextConfiguration意思为上下文配置
@RunWith(SpringJUnit4ClassRunner.class)//运行测试的junit版本号
//@Transactional//为该类添加事务管理用于事务回滚
public class FolderFilesBizImplTest {
	@Autowired
	private FolderFilesBiz target;
	@Test
	public void testFindAllFolders() {
		List<FolderFiles> folderFiles=target.findAllFolders();
		for(FolderFiles f:folderFiles) {
			System.out.println(f);
		}
	}

	@Test
	public void testFindDocumentsByFolder() {
		List<FolderFiles> list=target.findFolderFilesByFolder(1);
		for(FolderFiles f:list) {
			System.out.println(f.getCreateDate());
		}
	}
	@Test
	public void testFindTotalRows() {
//		int num=target.findTotalRows(1,"");
		int num=target.findTotalRows(0,"根目录");
		System.out.println(num);
	}
	@Test
	public void testFindFolderFilesByPages() {
		List<FolderFiles> list=target.findFolderFilesByPages(2, "生产日程1", 1, 1);
		for(FolderFiles f:list) {
			System.out.println(f);
			System.out.println(f);
		}
	}
	@Test
	public void testFindParentId() {
		FolderFiles f=target.findParentId(7);
		System.out.println(f);
	}
	@Test
	public void testInsertFolder() {
		target.insertFolder (new FolderFiles(0,"name",null,"folder", null,1,new Date(), 1,1,"0kb"));
	}
}
