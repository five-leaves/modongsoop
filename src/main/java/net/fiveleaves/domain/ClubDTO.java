package net.fiveleaves.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ClubDTO {
	
	private Long clubNo;
	private String clubName;
	private String clubContent;
	private String clubProfile;
	private int ageMin;
	private int ageMax;
	private Date regdate;
	private Date updateDate;
	
	private CategoryDTO categoryDto;
	private UserDTO userDto;
	
}
