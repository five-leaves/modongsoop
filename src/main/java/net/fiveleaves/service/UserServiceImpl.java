package net.fiveleaves.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.fiveleaves.domain.UserDTO;
import net.fiveleaves.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public UserDTO read(String username) throws Exception {
		return userMapper.read(username);
	}
	
}
