package net.fiveleaves.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.UserDTO;
import net.fiveleaves.mapper.UserMapper;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper mapper;
	
	private PasswordEncoder pwencoder;

	@Override
	public void register(UserDTO user) {
		
		log.info("register......" + user);
		
		// password encoding 처리
		user.setPassword(pwencoder.encode(user.getPassword()));
		
		mapper.insertUser(user);
		mapper.insertAuthority("ROLE_USER");
		
	}
	
	
	
}
