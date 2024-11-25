package net.fiveleaves.domain;

import lombok.Data;

@Data
public class AuthorityDTO {
	
	private UserDTO userDto;
	
	private String authority;

}
