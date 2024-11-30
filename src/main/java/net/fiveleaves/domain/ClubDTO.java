package net.fiveleaves.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClubDTO {
	
	private Long clubNo;
	private String clubName;
	private String clubContent;
	private String clubProfile;
	private Integer ageMin;
	private Integer ageMax;
	private Date regdate;
	private Date updateDate;
	private Long userNo;
	private String nickname;
	private Long categoryNo;
	private String categoryName;
	private Integer memberCount;
	
}
