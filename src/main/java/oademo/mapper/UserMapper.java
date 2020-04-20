package oademo.mapper;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import oademo.entity.User;

public interface UserMapper {
	User checkLogin(@Param("username")String username, @Param("password")String password) ;
	List<User> userList() ;
	User checkusername(@Param("id")int id);
	List<User> username(@Param("username")String username);
}
