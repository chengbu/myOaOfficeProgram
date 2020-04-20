package oademo.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oademo.biz.UserBiz;
import oademo.entity.User;
import oademo.mapper.UserMapper;


@Service
public class UserBizImpl implements UserBiz {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public User checkLogin(String username, String password) { 
		 
		return userMapper.checkLogin(username, password);
	}

	@Override
	public List<User> userList() {
		
		return userMapper.userList();
	}

	@Override
	public User checkusername(int id) {
		// TODO Auto-generated method stub
		return userMapper.checkusername(id);
	}

	@Override
	public List<User> username(String username) {
		// TODO Auto-generated method stub
		return userMapper.username(username);
	}



}