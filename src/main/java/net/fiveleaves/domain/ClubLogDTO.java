package net.fiveleaves.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClubLogDTO {

	private UserDTO userDto;
	private ClubDTO clubDto;
	
	private Date regdate;
}
