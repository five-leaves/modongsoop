package net.fiveleaves.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import net.fiveleaves.domain.UserDTO;

@Getter
public class FiveleavesUser extends User {
	
	private static final long serialVersionUID = 1L;
	
	private UserDTO user;

	public FiveleavesUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}

	public FiveleavesUser(UserDTO dto) {
		
		super(dto.getUsername(), dto.getPassword(), dto.getAuthList().stream()
				.map(auth -> new SimpleGrantedAuthority(auth.getAuthority())).
				collect(Collectors.toList()));
		
		this.user = dto;
		
	}
	
}
