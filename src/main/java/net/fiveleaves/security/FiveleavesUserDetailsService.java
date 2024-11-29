package net.fiveleaves.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.UserDTO;
import net.fiveleaves.mapper.UserMapper;
import net.fiveleaves.security.domain.FiveleavesUser;

@Log4j
public class FiveleavesUserDetailsService implements UserDetailsService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		log.warn("Load User By UserName : " + userName);
		
		// userName means userid
		UserDTO vo = userMapper.read(userName);
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null ? null : new FiveleavesUser(vo);
		
	}
	
}
