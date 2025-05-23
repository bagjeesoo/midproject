package com.midproject.tripin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midproject.tripin.model.UserVO;
import com.midproject.tripin.repository.UserRepo;
import com.midproject.tripin.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepo userRepo;

	@Override
	public UserVO selectUser(Integer user_id) {
		return userRepo.selectUser(user_id);
	}

	@Override
	public List<UserVO> selectAllUser() {
		return userRepo.selectAllUser();
	}

	@Override
	public void insertUser() {
		
		
	}

	@Override
	public void deleteUser() {
		
		
	}

	@Override
	public void updateUser(UserVO user) {
		userRepo.updateUser(user);
	}

}
