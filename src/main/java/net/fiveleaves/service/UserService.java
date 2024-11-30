package net.fiveleaves.service;

import net.fiveleaves.domain.UserDTO;

public interface UserService {
	public UserDTO read(String username) throws Exception;
}
