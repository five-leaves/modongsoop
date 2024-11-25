package net.fiveleaves.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserDTO {
	
	private Long userNo;
	private String username;
	private String password;
	private String profile;
	private String nickname;
	private int birth;
	private char enabled;
	private Date regdate;
	private Date updateDate;

}
