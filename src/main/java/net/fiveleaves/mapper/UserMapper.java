package net.fiveleaves.mapper;

import net.fiveleaves.domain.UserDTO;

public interface UserMapper {

	public UserDTO read(String username);
	
}
