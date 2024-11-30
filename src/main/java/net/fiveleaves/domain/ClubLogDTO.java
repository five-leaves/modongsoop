package net.fiveleaves.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClubLogDTO {

	private Long userNo;
	private Long clubNo;
	private String username;
	
	private Date regdate;
}
