package com.midproject.tripin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.midproject.tripin.model.UserVO;

@Mapper
public interface UserRepo {
	UserVO selectUser(Integer user_id);
	List<UserVO> selectAllUser();
	void insertUser();
	void deleteUser();
	void updateUser(UserVO user);
}
