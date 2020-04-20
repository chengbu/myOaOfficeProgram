package oademo.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import oademo.entity.User;

public interface UserBiz {
	User checkLogin(String username, String password);
	List<User> userList();
	User checkusername(int id);
	List<User> username(String username);
}
