package net.fiveleaves.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	
	private Long boardNo;
	private String boardTitle;
	private String boardContent;
	private Long viewCount;
	private Date regdate;
	private Date updateDate;
	
	private ClubDTO clubDto;
	private UserDTO userDto;
}
