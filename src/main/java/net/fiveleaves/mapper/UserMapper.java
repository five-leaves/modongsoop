package net.fiveleaves.mapper;

import net.fiveleaves.domain.UserDTO;

public interface UserMapper {

	public void insertUser(UserDTO user);
	
	public void insertAuthority(String authority);
	
	public UserDTO read(String username);
	
	public int update(UserDTO user);
	
	public int deleteUser(Long userNo);
	
	public int deleteAuthority(Long userNo);
	
}
